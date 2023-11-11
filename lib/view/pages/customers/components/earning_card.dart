import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../utils/size_config.dart';
import '../../../../utils/spacing.dart';


class EarningCard extends StatelessWidget {
  final String title;
  const EarningCard({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: SizeConfig.heightMultiplier*7,
      width: SizeConfig.widthMultiplier*50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.darkGryClr
      ),
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.widthMultiplier*5,
        vertical: SizeConfig.heightMultiplier*0.5,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("R\$ 350",
            style: textTheme.headlineSmall!.copyWith(fontSize: SizeConfig.textMultiplier*1.8),
          ),
          Spacing.y(0.5),
          Text(title,
            style: textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
