import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/icons.dart';
import '../../../../../utils/size_config.dart';
import '../../../../../utils/spacing.dart';


class ProfileTile extends StatelessWidget {
  final String title;
  final Function() onTap;
  const ProfileTile({Key? key, required this.title, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Spacing.y(1.5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,
              style: textTheme.bodyLarge!.copyWith(fontSize: SizeConfig.textMultiplier*2.5),
              ).tr(),
              CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.darkGryClr,
                child: Center(
                  child: Image.asset(
                    AppIcons.arrowForward,
                    height: SizeConfig.imageSizeMultiplier*4.5,
                    width: SizeConfig.imageSizeMultiplier*4.5,
                    color: AppColors.primaryClr,
                  ),
                ),
              ),
            ],
          ),
          Spacing.y(2),
          Divider(
            color: AppColors.darkGryClr,
            thickness: 1.5,
          )
        ],
      ),
    );
  }
}
