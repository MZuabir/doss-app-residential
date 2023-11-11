import 'package:doss/constants/icons.dart';
import 'package:doss/view/pages/chat/chat.dart';
import 'package:doss/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../constants/colors.dart';
import '../../../../../utils/size_config.dart';
import '../../../../../utils/spacing.dart';
import '../../../../bottom sheets/custom_btm_sheet.dart';


class VerificationCard extends StatefulWidget {
  const VerificationCard({Key? key}) : super(key: key);

  @override
  State<VerificationCard> createState() => _VerificationCardState();
}
class _VerificationCardState extends State<VerificationCard> {



  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.tileClr,
      ),
      margin: EdgeInsets.only(
        bottom: SizeConfig.heightMultiplier*4
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
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: AppColors.darkGryClr,
                      backgroundImage: const NetworkImage("https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                    ),
                    Spacing.x(3),
                    Text(
                      "Joao Alves",
                      style: textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w600),
                    ),
                    const Spacer(),
                    Text(
                      "Hoje",
                      style: textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w600),
                    ),
                    Spacing.x(2),
                    Text(
                      "as 08:20",
                      style: textTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.widthMultiplier*5,
              vertical: SizeConfig.heightMultiplier*2,),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Address",
                      style: textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "View on map",
                      style: textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600,color: AppColors.primaryClr),
                    ),
                  ],
                ),
                Spacing.y(2),
                Text("Avenida Anchieta, 200 - Campinas - SP - CEP: 13.015-904",
                  style: textTheme.bodyMedium,),
                Spacing.y(2),
                Container(
                  color: AppColors.whiteClr,
                  padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.widthMultiplier*3,
                    vertical: SizeConfig.heightMultiplier*3,),
                  child: Center(
                    child: Text("Good morning, John! Could you check if I locked the gate correctly?",
                      style: textTheme.bodyMedium!.copyWith(color: Colors.black)),
                  ),
                ),
                Spacing.y(3),
                Center(
                  child: CustomButton(
                      height: SizeConfig.heightMultiplier*5,
                      title: "Check", onTap: (){
                    _showBottomSheet(context);
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return   CustomBottomSheet(icon: AppIcons.warning,
        onTap: (){
          Get.to(()=> ChatPage(),
          transition:Transition.rightToLeft
          );
        }, btnTitle: 'Yes I will Check',
        ); // Use the separate BottomSheet widget
      },
    );
  }
}