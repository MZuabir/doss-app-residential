
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/on_boarding.dart';
import '../../../constants/colors.dart';
import '../../../utils/size_config.dart';
import '../../../utils/spacing.dart';
import '../../widgets/background.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/txt_button.dart';
import '../access/access.dart';
import 'components/onboardingpages.dart';


class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 2.5),
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    PageView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: _pageController,
                      itemCount:onBoardingData.length,
                      onPageChanged: (int index) {
                        setState(() {
                          _currentPage = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return  OnBoardingPages(
                          title: onBoardingData[index].title,
                          image: onBoardingData[index].image,
                          description: onBoardingData[index].description,
                        );
                      },
                    ),
                    Positioned(
                      top: SizeConfig.heightMultiplier * 7,
                      left: 0,
                      right: 0,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              onBoardingData.length,
                                  (index) => Expanded(child: buildDotIndicator(index)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              CustomButton(
                  title: "Next",
                  onTap: () {
                    if (_currentPage < 2) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      Get.to(()=>const AccessPage());
                    }
                  }
              ),
              Spacing.y(2),
               CustomTextBtn(
                title: "To jump",
                onTap: (){
                  Get.to(()=>const AccessPage());
                },
              ),
              Spacing.y(4),
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



