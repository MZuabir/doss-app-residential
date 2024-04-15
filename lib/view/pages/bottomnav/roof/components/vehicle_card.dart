import 'package:doss_resident/view/widgets/txt_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/icons.dart';
import '../../../../../utils/size_config.dart';
import '../../../../../utils/spacing.dart';
import '../../../../bottomsheets/custom_btm_sheet.dart';


class VehicleCard extends StatefulWidget {
  const VehicleCard({Key? key}) : super(key: key);

  @override
  State<VehicleCard> createState() => _VehicleCardState();
}
class _VehicleCardState extends State<VehicleCard> {



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
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
                color: AppColors.darkGryClr,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.widthMultiplier*5,
              vertical: SizeConfig.heightMultiplier*1.5,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Selected vehicle",
                      style: textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w600),
                    ).tr(),
                    TextButton(
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      onPressed: (){}, child: Text(
                      "Change vehicle",
                      style: textTheme.bodySmall!.copyWith(color: AppColors.primaryClr),
                    ).tr(),),
                  ],
                ),
                Spacing.y(1),
                Text(
                  " Fiat Argo Drive 1.0 - Prata - XYZ0000",
                  style: textTheme.bodySmall,
                ),

              ],
            ),
          ),
          Container(
            height: SizeConfig.heightMultiplier*23,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              color: AppColors.whiteClr,
              image: const DecorationImage(
                image: NetworkImage("https://cdni.autocarindia.com/utils/imageresizer.ashx?n=https://cms.haymarketindia.net/model/uploads/modelimages/Hyundai-Grand-i10-Nios-200120231541.jpg&w=872&h=578&q=75&c=1"),
              )
            ),
          ),
        ],
      ),
    );
  }
}