import 'package:doss_resident/constants/colors.dart';
import 'package:doss_resident/utils/size_config.dart';
import 'package:doss_resident/utils/spacing.dart';
import 'package:doss_resident/view/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants/icons.dart';
import '../../../../bottomsheets/plans_bottom_sheet.dart';
import '../../../payment/payment_tab.dart';


class WatcherManPage extends StatelessWidget {
  const WatcherManPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme=Theme.of(context).textTheme;
    return Column(

      children: [
        Spacing.y(10),
        Text("These are the watchmen available to you",
        style: textTheme.bodyMedium,
        ).tr(),
        Text("Select one to continue",
          style: textTheme.bodyMedium,
        ).tr(),
        Spacing.y(5),
        SizedBox(
          height: SizeConfig.heightMultiplier*42,
          child: ListView.builder(
            itemCount: 5,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return const PlanCard();
            },),
        ),
      ],
    );
  }
}


class PlanCard extends StatelessWidget {
  const PlanCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme=Theme.of(context).textTheme;
    return Container(
      width: SizeConfig.widthMultiplier*60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.darkGryClr,
      ),
      margin: EdgeInsets.only(right: SizeConfig.widthMultiplier*5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: SizeConfig.heightMultiplier*25,
            width: SizeConfig.widthMultiplier*60,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage("https://img.freepik.com/free-photo/portrait-male-security-guard-with-barbed-wire-fence_23-2150368754.jpg?size=626&ext=jpg&ga=GA1.1.1826414947.1699833600&semt=ais"),
              fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                topLeft: Radius.circular(10),
              ),
              color: Colors.black,
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(
              horizontal: SizeConfig.widthMultiplier*2.5,
              vertical: SizeConfig.heightMultiplier*2,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Jone Jones",
                  style: textTheme.bodyMedium,
                ),
                Spacing.y(2),
                Row(
                  children: [
                    Text("Plans starting from",
                      style: textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w600),
                    ).tr(),
                    Text(" R\$ 29.90",
                      style: textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w600,color: AppColors.primaryClr),
                    ),
                  ],
                ),
                Spacing.y(2),
                CustomButton(
                    height: SizeConfig.heightMultiplier*4,
                    title: "View Plan", onTap: (){
                      _showBottomSheet(context);
                })
              ],
            ),
          )
        ],
      ),
    );
  }
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return   PlansBottomSheet(
          description: "Monthly billing, cancel whenever you want.",
          icon: AppIcons.guard,
          onTap: (){
            Get.to(()=>PaymentTabPage());
          },
          btnTitle: 'Continue to payment',
          title: 'Select your plan',
        ); // Use the separate BottomSheet widget
      },
    );
  }
}

