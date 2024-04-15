import 'package:doss_resident/controllers/plans.dart';
import 'package:doss_resident/view/widgets/txt_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../utils/size_config.dart';
import '../../utils/spacing.dart';
import '../widgets/custom_button.dart';

class PlansBottomSheet extends StatelessWidget {
  final String icon;
  final String btnTitle;
  final String description;
  final String title;
  final Function()? onTap;
   PlansBottomSheet(
      {super.key,
        required this.icon,
        this.onTap,
        required this.btnTitle,
        required this.title, required this.description});

  final cont=Get.put(PlansCont());

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: SizeConfig.heightMultiplier * 80,
      color: Colors.black,
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier*2.5),
      child: Column(
        children: [
          Spacing.y(3),
          CircleAvatar(
            radius: 23,
            backgroundColor: AppColors.darkGryClr,
            child: Image.asset(icon,
              height: SizeConfig.imageSizeMultiplier*7,
              width: SizeConfig.imageSizeMultiplier*7,
            ),
          ),
          Spacing.y(3),
          Text(
            title,
            style: textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w600),
          ).tr(),
          Spacing.y(2),
          Text(description,
            style: textTheme.bodySmall,
            textAlign: TextAlign.center,
          ).tr(),
          Spacing.y(8),
          ...List.generate(2, (index) => Obx(
        ()=> GestureDetector(
              onTap: (){
                cont.selectedPlan.value=index;
              },
              child: Container(
                width: SizeConfig.widthMultiplier * 100,
                margin: EdgeInsets.only(
                    bottom: SizeConfig.heightMultiplier * 3,
                    ),
                padding: EdgeInsets.symmetric(
                    horizontal:
                    SizeConfig.widthMultiplier * 4,
                vertical: SizeConfig.heightMultiplier*2
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: AppColors.darkGryClr,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Home plan",
                          style: textTheme.bodyMedium,
                        ).tr(),
                        AnimatedContainer(
                          duration:
                          const Duration(milliseconds: 200),
                          height: 18,
                          width: 18,
                          padding: const EdgeInsets.all(2.5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color:cont.selectedPlan.value==index?
                                AppColors.primaryClr:
                                    AppColors.whiteClr,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: Container(
                            height: 15,
                            width: 15,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:
                                cont.selectedPlan.value==index?
                                AppColors.primaryClr:
                                AppColors.darkGryClr,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacing.y(2),
                    Row(
                      children: [
                        Text("RS 29.90",
                        style: textTheme.headlineSmall!.copyWith(color: AppColors.primaryClr),
                        ),
                        Text("/mes",
                          style: textTheme.bodyLarge,
                        )
                      ],
                    ),
                    Spacing.y(1),
                    Text("+ R\$5+ ${tr("convenience fee")}",
                    style: textTheme.bodySmall,
                    )
                  ],
                ),
              ),
            ),
          ),
          ),
          Spacer(),
          CustomButton(title: tr(btnTitle), onTap:onTap,),
          Spacing.y(2),
          CustomTextBtn(
            title: "To go back",
            onTap: (){
              Get.back();
            },
          ),
          Spacing.y(3),

        ],
      ),
    );
  }
}
