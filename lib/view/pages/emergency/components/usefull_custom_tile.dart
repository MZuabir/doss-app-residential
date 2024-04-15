import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../utils/size_config.dart';
import '../../../../utils/spacing.dart';
import '../../emergency/components/emergency_custom_button.dart';


class UseFullContactCustomTile extends StatelessWidget {
  const UseFullContactCustomTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: SizeConfig.heightMultiplier*12,
      width: SizeConfig.widthMultiplier*100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.tileClr,
      ),
      margin: EdgeInsets.only(bottom: SizeConfig.heightMultiplier*2.5),
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier*4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Firemen",
                style: textTheme.headlineSmall,
              ),
              Spacing.y(1),
              Text("193",
                style: textTheme.bodyMedium,
              ),
            ],
          ),
          const EmergencyCustomButton(),
        ],
      ),
    );
  }
}