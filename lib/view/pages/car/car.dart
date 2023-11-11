import 'package:doss/constants/colors.dart';
import 'package:doss/utils/size_config.dart';
import 'package:doss/utils/spacing.dart';
import 'package:doss/view/pages/car/components/custom_expansion_tile.dart';
import 'package:doss/view/widgets/background.dart';
import 'package:doss/view/widgets/custom_appbar.dart';
import 'package:doss/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';


class CarPage extends StatefulWidget {
  const CarPage({Key? key}) : super(key: key);

  @override
  State<CarPage> createState() => _CarPageState();
}

class _CarPageState extends State<CarPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Background(
        child:Padding(
          padding:  EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier*2.5),
          child: Column(
            children: [
              Spacing.y(7),
              const CustomAppbar(title: "vehicles",
              isIcon: true,
              ),
              Spacing.y(7),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ...List.generate(2, (index) => const CustomExpansionTile()),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: SizeConfig.heightMultiplier*12,
        width: double.infinity,
        color: AppColors.tileClr,
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier*2.5),
          child: Center(
            child: CustomButton(
              title: "Save and close",
              onTap: (){

              },
            ),
          ),
        ),
      ),
    );
  }
}








// Obx(
// ()=> CustomDropDownField(
// hinttext: "Filter",
// listdata: cont.filterList,
// currentSelectedValue: cont.selectedFilter.value == ""
// ? null
// : cont.selectedFilter.value,
// onChanged: (value) {
// cont.selectedFilter.value = value.toString();
// },
// ),
// ),













