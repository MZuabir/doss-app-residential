import 'package:doss_resident/models/stepper.dart';
import 'package:doss_resident/constants/icons.dart';
import 'package:doss_resident/view/pages/bottomnav/bottom_nav_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../utils/size_config.dart';
import '../../../utils/spacing.dart';
import '../../bottomsheets/custom_btm_sheet.dart';
import '../../widgets/background.dart';
import '../../widgets/stepper.dart';
import 'components/custom_cancel_btn.dart';
import 'components/custom_coverage_expansiontile.dart';


class RequestCoveragePage extends StatefulWidget {
  const RequestCoveragePage({Key? key}) : super(key: key);

  @override
  State<RequestCoveragePage> createState() => _RequestCoveragePageState();
}

class _RequestCoveragePageState extends State<RequestCoveragePage> {
  late int  activeStep=5;
  @override
  Widget build(BuildContext context) {
    final textTheme=Theme.of(context).textTheme;
    return Scaffold(
      body: Background(
        child:Column(
          children: [
            Spacing.y(7),
            Text("Roof",
                textAlign: TextAlign.center,
                style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600)
            ),
            Spacing.y(3),
            Expanded(child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: SizeConfig.widthMultiplier * 100,
                    color: AppColors.darkGryClr.withOpacity(0.5),
                    padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.heightMultiplier*2.5,
                        horizontal: SizeConfig.widthMultiplier * 2.3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: SizeConfig.widthMultiplier*65,
                          child: Text(
                            "The request is in progress, follow the coverage status below.",
                            style: textTheme.bodySmall,
                          ).tr(),
                        ),
                        CustomMapButton(
                          title: "Cancel",
                          onTap: () {
                            // Get.back();
                            _showCanVerificationBottomSheet(context);
                          },
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier*2.5),
                    child:  Column(
                      children: [
                        Spacing.y(4),
                       const CustomCoverageExpansionTile(),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.darkGryClr,
                      ),
                      padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier*4,
                      vertical: SizeConfig.heightMultiplier*2,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Follow-up",
                              style: textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),
                              ).tr(),
                              Text("20/10/2023",
                                style: textTheme.bodyMedium,
                              ),
                            ],
                          ),
                          Spacing.y(3),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: stepperData.length,
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return CustomStepper(
                                index: index,
                                itemCount: stepperData.length,
                                title: stepperData[index].title,
                                subTitle: stepperData[index].subTitle,
                                icon: stepperData[index].icon,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                        Spacing.y(3),
                        Container(
                          // height: SizeConfig.heightMultiplier*15,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.greyClr
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.widthMultiplier*4,
                            vertical: SizeConfig.heightMultiplier*2,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Estimate of your arrival",
                              style: textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),
                              ).tr(),
                              Spacing.y(3),
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 22,
                                    backgroundColor: AppColors.tileClr,
                                    child: Image.asset(
                                      AppIcons.location,
                                      height: SizeConfig.imageSizeMultiplier*6,
                                      width: SizeConfig.imageSizeMultiplier*6,
                                    ),
                                  ),
                                  Spacing.x(4),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Estimate of your arrival",
                                        style: textTheme.bodySmall,
                                      ).tr(),
                                      Spacing.y(0.5),
                                      Text("1.2 Km",
                                        style: textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Approx",
                                        style: textTheme.bodySmall,
                                      ).tr(),
                                      Spacing.y(0.5),
                                      Text("6 ${tr("minutes")}",
                                        style: textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Spacing.y(3),
                      ],
                    ),
                  ),

                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
  void _showCanVerificationBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return    CustomBottomSheet(
          onTap: (){
            Get.back();
            _showCancelledBottomSheet(context);
          },
          description: "Do you want to cancel your coverage request?",
          btnTitle: "Cancel Verification",
          icon: AppIcons.warning,
          title: "Yes, I'm sure",
          textBtnTitle: "Go back",
        ); // Use the separate BottomSheet widget
      },
    );
  }

  void _showCancelledBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return    CustomBottomSheet(
          onTap: (){
            Get.off(()=>const BottomNavPage(),
            );
          },
          // description: "Do you want to cancel your coverage request?",
          title: "Verification Cancelled!",
          icon: AppIcons.warning,
          btnTitle: "Back to top",
          // textBtnTitle: "Go back",

        ); // Use the separate BottomSheet widget
      },
    );
  }
}

