import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../utils/size_config.dart';
import '../../utils/spacing.dart';
import '../widgets/custom_button.dart';
import '../widgets/txt_button.dart';

class CustomBottomSheet extends StatelessWidget {
  final String icon;
  final String btnTitle;
  final String title;
  final Function()? onTap;
   const CustomBottomSheet({super.key, required this.icon, this.onTap, required this.btnTitle, required this.title});

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
              title,
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




