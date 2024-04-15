import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../utils/size_config.dart';
import '../../../../utils/spacing.dart';
import '../../emergency/components/emergency_custom_button.dart';


class WatchManCustomTile extends StatelessWidget {
  const WatchManCustomTile({Key? key}) : super(key: key);

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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 17,
            child: CircleAvatar(
              radius: 16,
              backgroundColor: AppColors.darkGryClr,
              backgroundImage: const NetworkImage("https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
            ),
          ),
          Spacing.x(3),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("João Alves",
                style: textTheme.headlineSmall,
              ),
              Spacing.y(1),
              Text("11 9999-9999",
                style: textTheme.bodyMedium,
              ),
            ],
          ),
          const Spacer(),
          const EmergencyCustomButton(),
        ],
      ),
    );
  }
}