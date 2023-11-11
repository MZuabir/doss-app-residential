import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../utils/size_config.dart';


class PlanCard extends StatelessWidget {
  const PlanCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: SizeConfig.heightMultiplier*12,
      width: SizeConfig.widthMultiplier*100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.darkGryClr,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.widthMultiplier*5,
        vertical: SizeConfig.heightMultiplier*2.5,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Home plan",
                style: textTheme.bodySmall,
              ),
              Text("R\$ 29.30",
                style: textTheme.bodySmall,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Commercial plan",
                style: textTheme.bodySmall,
              ),
              Text("R\$ 49.90",
                style: textTheme.bodySmall,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
