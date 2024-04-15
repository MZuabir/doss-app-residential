import 'package:easy_localization/easy_localization.dart';
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
  final String? textBtnTitle;
  final String title;
  final String? description;
  final Function()? onTap;
   const CustomBottomSheet({super.key,
     required this.icon,
     this.onTap, required this.btnTitle, required this.title, this.description,  this.textBtnTitle});

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
            ).tr(),
            description==null?const SizedBox(): Spacing.y(2),
          description==null?const SizedBox():  Text(
              description??"",
              textAlign: TextAlign.center,
              style: textTheme.bodySmall,
            ).tr(),
            Spacing.y(3),
            CustomButton(title: tr(btnTitle), onTap:onTap,
            ),
            textBtnTitle==null?SizedBox(): Spacing.y(2),
            textBtnTitle==null?SizedBox():  CustomTextBtn(title: tr(textBtnTitle??""),
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




