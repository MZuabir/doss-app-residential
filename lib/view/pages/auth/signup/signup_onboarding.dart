import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../constants/colors.dart';
import '../../../../controllers/sign_up.dart';
import '../../../../utils/size_config.dart';
import '../../../../utils/spacing.dart';
import '../../../widgets/background.dart';
import '../../../widgets/custom_appbar.dart';
import '../../../widgets/custom_snackbar.dart';
import 'components/base_address.dart';
import 'components/enter_email.dart';
import 'components/user_data.dart';
import 'components/watcherman.dart';

class SignUpOnBoardingPage extends StatefulWidget {
  const SignUpOnBoardingPage({Key? key}) : super(key: key);

  @override
  State<SignUpOnBoardingPage> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<SignUpOnBoardingPage> {
  final cont=Get.put(SignUpCont());
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:_currentPage==0? false:true,
      body: Background(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 2.5),
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                      top: SizeConfig.heightMultiplier*18,
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: PageView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: _pageController,
                        itemCount:4,
                        onPageChanged: (int index) {
                          setState(() {
                            _currentPage = index;
                          });
                        },
                        itemBuilder: (context, index) {
                          if(index == 0){
                            return EnterEmailPage(
                              onTap: (){
                                if(!cont.isEnabled.value) {
                                  showTopSnackBar(
                                    Overlay.of(context),
                                    const CustomSnackBar(title: "Enter Email or Agree to Polices"),
                                    displayDuration: const Duration(seconds: 1),
                                  );
                                }
                                else{
                                  _pageController.nextPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                }
                              },
                            );
                          } else if(index == 1) {
                            return   UserData(
                              onTap: (){
                                _pageController.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.easeInOut,
                                );
                              },
                            );
                          }
                          else if(index==2){
                            return Expanded(child: SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                child: BaseAddressPage(
                                  onTap: () {
                                     Get.back();
                                    _pageController.nextPage(
                                      duration: const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    );
                                  },
                                ),),);
                          }
                          else if(index==3){
                            return WatcherManPage();
                          }
                        },
                      ),
                    ),
                    Positioned(
                      top: SizeConfig.heightMultiplier * 7,
                      left: 0,
                      right: 0,
                      child: Column(
                        children: [
                          const CustomAppbar(title: "Create a New Account"),
                          Spacing.y(4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              4,
                                  (index) => Expanded(child: buildDotIndicator(index)),
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
    );
  }

  Widget buildDotIndicator(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: SizeConfig.heightMultiplier*0.8,
      margin:  EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier*0.8),
      decoration: BoxDecoration(
        color: _currentPage == index ? AppColors.primaryClr : AppColors.greyClr,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}



