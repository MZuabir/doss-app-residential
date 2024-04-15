import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/icons.dart';
import '../../../../../utils/size_config.dart';
import '../../../../../utils/spacing.dart';
import '../../../../bottomsheets/custom_btm_sheet.dart';
import '../../../../widgets/custom_button.dart';


class CoverageCard extends StatefulWidget {
  const CoverageCard({Key? key}) : super(key: key);

  @override
  State<CoverageCard> createState() => _CoverageCardState();
}
class _CoverageCardState extends State<CoverageCard> {



  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.tileClr,
      ),
      margin: EdgeInsets.only(
          bottom: SizeConfig.heightMultiplier*2
      ),
      child: Column(
        children: [
          Container(
            height: SizeConfig.heightMultiplier*10,
            width: SizeConfig.widthMultiplier*100,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                topLeft: Radius.circular(10),
              ),
              color: AppColors.darkGryClr,
              image: const DecorationImage(
                image: AssetImage("assets/images/coverage.png"),
                fit: BoxFit.cover,
              )
            ),
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.widthMultiplier*5,
              vertical: SizeConfig.heightMultiplier*1.5,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    style: textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),
                    children: [
                       TextSpan(
                        text: tr("You are"),
                        style: const TextStyle(color: Colors.white), // Color for the first part
                      ),
                      TextSpan(
                        text: " 3km ",
                        style: TextStyle(color: AppColors.primaryClr), // Color for "3km"
                      ),
                       TextSpan(
                        text: tr("from the coverage area"),
                        style: const TextStyle(color: Colors.white), // Color for the rest
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.widthMultiplier*5,
              vertical: SizeConfig.heightMultiplier*2,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                    Text(
                      "Notice",
                      style: textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),
                    ).tr(),
                Spacing.y(2),
                Text("You are outside the coverage area, as soon as you are within a 2km radius, the watchman will be notified of your request.",
                  style: textTheme.bodyMedium,).tr(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}