import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../utils/size_config.dart';

class CustomMapButton extends StatelessWidget {
  final Function()? onTap;
  final String title;

  const CustomMapButton({Key? key,  this.onTap, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColors.primaryClr,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.widthMultiplier * 8,
          vertical: SizeConfig.heightMultiplier * 0.7,
        ),
        child: Text(
          title,
          style: textTheme.bodySmall!.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
