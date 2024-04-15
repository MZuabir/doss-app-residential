import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../../constants/colors.dart';
import '../../../../../utils/size_config.dart';
import '../../../../../utils/spacing.dart';
import 'history_custom_tile.dart';


class AllPage extends StatelessWidget {
   AllPage({Key? key}) : super(key: key);
  bool isEmpty=true;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return isEmpty?Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("There are no records in your history yet",
            style: textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ).tr(),
          Spacing.y(3),
          Container(
            height: SizeConfig.heightMultiplier*5,
            width: SizeConfig.widthMultiplier*50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: AppColors.primaryClr
            ),
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.heightMultiplier*3),
            child: Center(
              child: Text("Invite family",
              style: textTheme.bodyMedium!.copyWith(color: Colors.black,fontWeight: FontWeight.w600),
              ).tr(),
            ),
          ),
          Spacing.y(15),
        ],
      ),
    ): Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
           ...List.generate(20, (index) => const HistoryCustomTile()),
          ],
        ),
      ),
    );
  }
}
