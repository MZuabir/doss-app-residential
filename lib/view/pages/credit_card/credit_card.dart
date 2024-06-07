import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants/icons.dart';
import '../../../../../utils/spacing.dart';
import '../../../utils/size_config.dart';
import '../../bottomsheets/auth_btm_sheet.dart';
import '../../widgets/auth_textfield.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_drop_down.dart';
import '../bottomnav/bottom_nav_bar.dart';

class CreditCardPage extends StatefulWidget {
  const CreditCardPage({Key? key,}) : super(key: key);

  @override
  State<CreditCardPage> createState() => _CreditCardPageState();
}

class _CreditCardPageState extends State<CreditCardPage> {
  final cardController=TextEditingController();
  final cardNumberController=TextEditingController();
  final dateController=TextEditingController();

  List<String> month=["January","February"];
  List<String> year=["2023","2024"];

  String? selectedMonth;
  String? selectedYear;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Expanded(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier*2.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacing.y(2),
            Text("Payment Information",
              style: textTheme.headlineMedium,
            ).tr(),
            Spacing.y(3),
                AuthTextField(
                    title: "Card data",
                    hintText: "  JOAO ALVES MOURA", controller:cardController ),
                AuthTextField(
                    title: "Commercial plan",
                    isTitle: false,
                    hintText: "00 0000 00000", controller:cardNumberController ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: CustomDropdown(
                    selectedValue: selectedMonth,
                    items: month,
                    onChanged: (value){
                      setState(() {
                        selectedMonth=value;
                      });
                    },
                    title: "Maturity",
                    hint: "September",
                  ),
                ),
                Spacing.x(3),
                Expanded(
                  child: CustomDropdown(
                    selectedValue: selectedYear,
                    isTitle: false,
                    items: year,
                    onChanged: (value){
                      setState(() {
                        selectedYear=value;
                      });
                    },
                    title: "2023",
                    hint: "September",
                  ),
                ),
              ],
            ),
            Spacing.y(2),
             SizedBox(
               width: SizeConfig.widthMultiplier*46,
               child: AuthTextField(
                      hintText: "000", controller:dateController,isTitle: false, ),
             ),
            Spacing.y(3),
            Align(
              alignment: Alignment.center,
              child: Text("We will send payment details to your email after confirmation.",
                textAlign: TextAlign.center,
                style: textTheme.bodySmall,
              ).tr(),
            ),
            Spacing.y(3),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Total",
                      style: textTheme.bodySmall,
                      ).tr(),
                      Text("R\$ 29.90",
                        style: textTheme.headlineSmall,
                      ),
                      Text("R\$5 ${tr("convenience fee")}",
                        style: textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: CustomButton(
                    title: "Pay Now",
                    onTap: (){
                      _showBottomSheet(context);
                    },
                  ),
                ),
              ],
            ),
            Spacing.y(3),


          ],
        ),
      ),
    );
  }
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return   AuthBottomSheet(
          icon: AppIcons.verify,
          onTap: (){
            Get.to(()=>const BottomNavPage(),
            transition: Transition.rightToLeft,
            );
          },
          btnTitle: 'Continue to the app',
          title: 'Payment made successfully!',
          description: 'Congratulations, you have subscribed to DossApp, your days are starting to become safer with us!',
        ); // Use the separate BottomSheet widget
      },
    );
  }
}
