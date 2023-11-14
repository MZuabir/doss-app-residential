import 'package:flutter/material.dart';
import '../../../../../constants/icons.dart';
import '../../../../../utils/spacing.dart';
import '../../../../bottomsheets/auth_btm_sheet.dart';
import '../../../../widgets/auth_textfield.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_drop_down.dart';


class BaseAddressPage extends StatefulWidget {
  final Function()? onTap;
   BaseAddressPage({Key? key, this.onTap}) : super(key: key);

  @override
  State<BaseAddressPage> createState() => _BaseAddressPageState();
}

class _BaseAddressPageState extends State<BaseAddressPage> {
  final cepController=TextEditingController();

  final roadController=TextEditingController();

  List<String> state=["pakistan","Brazil"];
  List<String> neighborhood=["pakistan","Brazil"];
  List<String> city=["pakistan","Brazil"];
   String? selectedState;
   String? selectedCity;
   String? selectedNeighborhood;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Base address",
          style: textTheme.headlineMedium,
        ),
        Spacing.y(3),
        AuthTextField(
          title: "CEP",
          hintText: "000000000",
          controller: cepController,
          keyboardType: TextInputType.number,
        ),
        CustomDropdown(
          title: "State",
          hint: "Brazil",
          selectedValue: selectedState,
          items: state,
          onChanged: (String? value) {
            setState(() {
              selectedState = value.toString();
            });
          },),
        Spacing.y(3),
        CustomDropdown(
          title: "City",
          hint: "Brazil",
          selectedValue: selectedCity,
          items: city,
          onChanged: (String? value) {
            setState(() {
              selectedCity = value.toString();
            });
          },),
        Spacing.y(3),
        CustomDropdown(
          title: "Neighborhood",
          hint: "Brazil",
          selectedValue: selectedNeighborhood,
          items: neighborhood,
          onChanged: (String? value) {
            setState(() {
              selectedNeighborhood = value.toString();
            });
          },),
        Spacing.y(3),
        AuthTextField(
          title: "Road",
          hintText: "Road ABC",
          controller: roadController,
          keyboardType: TextInputType.number,
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: AuthTextField(
                title: "Road",
                hintText: "Road ABC",
                controller: roadController,
                keyboardType: TextInputType.number,
              ),
            ),
            Spacing.x(5),
            Expanded(
              child: AuthTextField(
                title: "N°",
                hintText: "200",
                controller: roadController,
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
        Spacing.y(0),
        CustomButton(title: "Next", onTap: (){
          _showBottomSheet(context);
        }),
        Spacing.y(3),
      ],
    );
  }
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return   AuthBottomSheet(
          icon: AppIcons.locationVerified,
          onTap: widget.onTap,
          btnTitle: 'View plans',
          title: 'Your area is covered!',
          description: 'We verify that there is surveillance coverage for your area!Proceed to see available plan options',
        ); // Use the separate BottomSheet widget
      },
    );
  }
}
