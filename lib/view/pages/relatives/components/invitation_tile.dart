import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../utils/size_config.dart';
import '../../../../utils/spacing.dart';



class InvitationTile extends StatelessWidget {
  const InvitationTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme=Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.darkGryClr
      ),
      margin: EdgeInsets.only(bottom:SizeConfig.heightMultiplier*3),
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.widthMultiplier*4,
        vertical: SizeConfig.heightMultiplier*2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("jeruscleiton@gmail.com",
                style: textTheme.bodyMedium,),
              Text("Invitation accepted",
                style: textTheme.bodyMedium,).tr(),
            ],
          ),
          Spacing.y(4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Remove invitation",
                style: textTheme.bodyMedium,).tr(),
              Text("Invitation resent",
                style: textTheme.bodyMedium!.copyWith(color: Colors.green),).tr(),
            ],
          ),
        ],
      ),
    );
  }
}
