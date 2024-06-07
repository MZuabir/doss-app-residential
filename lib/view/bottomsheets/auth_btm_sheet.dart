import 'package:doss_resident/constants/cont.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../utils/size_config.dart';
import '../../utils/spacing.dart';
import '../widgets/custom_button.dart';

class AuthBottomSheet extends StatelessWidget {
  final String icon;
  final String btnTitle;
  final String title;
  final String description;
  final Function()? onTap;
  const AuthBottomSheet(
      {super.key,
      required this.icon,
      this.onTap,
      required this.btnTitle,
      required this.title,
      required this.description});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      color: Colors.black,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 2.5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Spacing.y(5),
            CircleAvatar(
              radius: 23,
              backgroundColor: AppColors.darkGryClr,
              child: Image.asset(
                icon,
                height: SizeConfig.imageSizeMultiplier * 7,
                width: SizeConfig.imageSizeMultiplier * 7,
              ),
            ),
            Spacing.y(3),
            Text(
              title,
              textAlign: TextAlign.center,
              style: textTheme.headlineMedium!
                  .copyWith(fontWeight: FontWeight.w600),
            ).tr(),
            Spacing.y(3),
            Text(
              description,
              style: textTheme.bodySmall,
              textAlign: TextAlign.center,
            ).tr(),
            Spacing.y(3),
            Obx(
              () => CustomButton(
                title: tr(btnTitle),
                isLoading: authCont.isLoading.value,
                onTap: onTap,
              ),
            ),
            Spacing.y(5),
          ],
        ),
      ),
    );
  }
}
