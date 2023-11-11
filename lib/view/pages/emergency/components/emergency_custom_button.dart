import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../utils/size_config.dart';


class EmergencyCustomButton extends StatelessWidget {
  const EmergencyCustomButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: SizeConfig.heightMultiplier*6,
      width: SizeConfig.widthMultiplier*30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColors.primaryClr,
      ),
      child: Center(
          child: Text("To connect",
            style: textTheme.bodyLarge!.copyWith(color: Colors.black),
          )),
    );
  }
}