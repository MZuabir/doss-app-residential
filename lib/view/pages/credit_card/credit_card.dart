import 'package:flutter/material.dart';

import '../../../../../constants/icons.dart';
import '../../../../../utils/spacing.dart';
import '../../../utils/size_config.dart';
import '../../bottomsheets/auth_btm_sheet.dart';
import '../../widgets/auth_textfield.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_drop_down.dart';

class CreditCardPage extends StatefulWidget {
  final Function()? onTap;
  const CreditCardPage({Key? key, this.onTap}) : super(key: key);

  @override
  State<CreditCardPage> createState() => _CreditCardPageState();
}

class _CreditCardPageState extends State<CreditCardPage> {
  final homeController=TextEditingController();
  final commercialController=TextEditingController();
  final agencyController=TextEditingController();
  final accountController=TextEditingController();

  List<String> bank=["HBL","MCB"];

  String? selectedBank;

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
            Text("Plans and payments",
              style: textTheme.headlineMedium,
            ),
            Spacing.y(3),
            Text("How much do you want to charge your future customers monthly?",
              style: textTheme.bodySmall,
            ),
            Spacing.y(3),
            Row(
              children: [
                Expanded(
                  child: AuthTextField(
                      title: "Home plan",
                      hintText: "RS 00.00", controller:homeController ),
                ),
                Spacing.x(3),
                Expanded(
                  child: AuthTextField(
                      title: "Commercial plan",
                      hintText: "RS 00.00", controller:commercialController ),
                ),
              ],
            ),
            CustomDropdown(
              selectedValue: selectedBank,
              items: bank,
              onChanged: (value){
                setState(() {
                  selectedBank=value;
                });
              },
              title: "Data for receiving payment",
              hint: "Select bank",
            ),
            Spacing.y(2),
            Row(
              children: [
                Expanded(
                  child: AuthTextField(
                    hintText: "Agency", controller:agencyController,isTitle: false, ),
                ),
                Spacing.x(3),
                Expanded(
                  child: AuthTextField(
                    hintText: "Account", controller:accountController,isTitle: false, ),
                ),
              ],
            ),
            CustomButton(
              title: "Next",
              onTap: (){
                _showBottomSheet(context);
              },
            ),


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
          onTap: widget.onTap,
          btnTitle: 'Proceed to the app',
          title: 'Congratulations!',
          description: 'Your registration has been completed and approved successfully!Enjoy the benefits of the app and find customers closest to you!',
        ); // Use the separate BottomSheet widget
      },
    );
  }
}
