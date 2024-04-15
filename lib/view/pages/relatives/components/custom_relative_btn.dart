import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../utils/size_config.dart';


class CustomRelativeButton extends StatelessWidget {
  final Function()? onTap;
  final String title;
  const CustomRelativeButton({Key? key, this.onTap, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme=Theme.of(context).textTheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: SizeConfig.heightMultiplier*5,
        width: SizeConfig.widthMultiplier*50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: AppColors.primaryClr
        ),
        padding: EdgeInsets.symmetric(horizontal: SizeConfig.heightMultiplier*3),
        child: Center(
          child: Text(title,
            style: textTheme.bodyMedium!.copyWith(color: Colors.black,fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
