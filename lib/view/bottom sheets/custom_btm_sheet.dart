import 'package:doss/constants/colors.dart';
import 'package:doss/utils/size_config.dart';
import 'package:doss/utils/spacing.dart';
import 'package:doss/view/widgets/custom_button.dart';
import 'package:doss/view/widgets/txt_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomSheet extends StatelessWidget {
  final String icon;
  final String btnTitle;
  final Function()? onTap;
   const CustomBottomSheet({super.key, required this.icon, this.onTap, required this.btnTitle});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      color: Colors.black,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier*2.5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Spacing.y(5),
            CircleAvatar(
              radius: 23,
              backgroundColor: AppColors.darkGryClr,
              child: Image.asset(icon,
              color: AppColors.primaryClr,
                height: SizeConfig.imageSizeMultiplier*7,
                width: SizeConfig.imageSizeMultiplier*7,
              ),
            ),
            Spacing.y(3),
            Text(
              "Proceed with verification?",
              style: textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w600),
            ),
            Spacing.y(3),
            CustomButton(title: btnTitle, onTap:onTap,
            ),
            Spacing.y(2),
            CustomTextBtn(title: "To go back",
            onTap: (){
              Get.back();
            },
            ),
            Spacing.y(3),
          ],
        ),
      ),
    );
  }
}




