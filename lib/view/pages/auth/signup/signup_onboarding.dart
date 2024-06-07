import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../constants/colors.dart';
import '../../../../controllers/sign_up.dart';
import '../../../../utils/size_config.dart';
import '../../../../utils/spacing.dart';
import '../../../widgets/background.dart';
import '../../../widgets/custom_appbar.dart';
import 'components/base_address.dart';
import 'components/enter_email.dart';
import 'components/user_data.dart';
import 'components/service_providers.dart';

class SignUpOnBoardingPage extends StatefulWidget {
  const SignUpOnBoardingPage({Key? key, required this.index}) : super(key: key);
final int index;
  @override
  State<SignUpOnBoardingPage> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<SignUpOnBoardingPage> {
  final cont = Get.put(SignUpCont());
@override
  void initState() {
    super.initState();
    cont.pageController=PageController(initialPage: widget.index);
    cont.signupTabIndex.value=widget.index;
  }
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: cont.signupTabIndex.value == 0 ? false : true,
        body: Background(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.widthMultiplier * 2.5),
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Positioned(
                        top: SizeConfig.heightMultiplier * 18,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: PageView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: cont.pageController,
                          itemCount: 4,
                          onPageChanged: (int index) {
                            cont.signupTabIndex.value = index;
                          },
                          itemBuilder: (context, index) {
                            if (index == 0) {
                              return const EnterEmailPage();
                            } else if (index == 1) {
                              return const UserData(
                                  // onTap: () {
                                  // _pageController.nextPage(
                                  //   duration: const Duration(milliseconds: 300),
                                  //   curve: Curves.easeInOut,
                                  // );
                                  // },
                                  );
                            } else if (index == 2) {
                              return const BaseAddressPage();
                            } else if (index == 3) {
                              return const ServiceProvidersPage();
                            }
                            return null;
                          },
                        ),
                      ),
                      Positioned(
                        top: SizeConfig.heightMultiplier * 7,
                        left: 0,
                        right: 0,
                        child: Column(
                          children: [
                            CustomAppbar(
                              title: "Create a New Account",
                              onTap: () {
                                if (cont.signupTabIndex.value != 0) {
                                  cont.signupTabIndex.value--;
                                  cont.pageController
                                      .jumpToPage(cont.signupTabIndex.value);
                                }
                              },
                            ),
                            Spacing.y(4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                4,
                                (index) =>
                                    Expanded(child: buildDotIndicator(index)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDotIndicator(int index) {
    return Obx(
      () => AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: SizeConfig.heightMultiplier * 0.8,
        margin:
            EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 0.8),
        decoration: BoxDecoration(
          color: cont.signupTabIndex.value == index
              ? AppColors.primaryClr
              : AppColors.greyClr,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
