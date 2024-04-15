import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../constants/colors.dart';
import '../../../../utils/size_config.dart';
import '../../../../utils/spacing.dart';
import '../../../widgets/custom_drop_down.dart';


class CustomExpansionTile extends StatefulWidget {
  const CustomExpansionTile({Key? key}) : super(key: key);

  @override
  State<CustomExpansionTile> createState() => _CustomExpansionTileState();
}
class _CustomExpansionTileState extends State<CustomExpansionTile> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool isExpanded = false;
  List<String> type = ['MotorBike', 'Car',]; // Option 2
  List<String> brand = ['Honda', 'Toyota',]; // Option 2
  String? _selectedType;
  String? _selectedBrand;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleExpand() {
    setState(() {
      isExpanded = !isExpanded;
      if (isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: _toggleExpand,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.darkGryClr,
        ),
        margin: EdgeInsets.only(bottom: SizeConfig.heightMultiplier*3),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${tr("Vehicle")} 1",
                        style: textTheme.bodyMedium,
                      ),
                      Icon(isExpanded?Icons.expand_less:Icons.expand_more,
                        color: AppColors.whiteClr,
                      ),
                    ],
                  ),
                  Spacing.y(5),
                  Row(
                    children: [
                      Text(
                        "Remove Vehicle",
                        style: textTheme.bodyMedium!.copyWith(color: AppColors.primaryClr),
                      ).tr(),
                      const Spacer(),
                      Text(
                        "Put to Use",
                        style: textTheme.bodyMedium,
                      ).tr(),
                    ],
                  ),
                ],
              ),
            ),
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return ClipRect(
                  child: Align(
                    alignment: Alignment.topCenter,
                    heightFactor: _animationController.value,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                        color: AppColors.tileClr,
                      ),
                      width: double.infinity,
                      child: Padding(
                        padding:EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier*4),
                        child: Column(
                          children: [
                            Spacing.y(3),
                            CustomDropdown(
                              title: "Type",
                              hint: "Motorcycle",
                              selectedValue: _selectedType,
                              items: type,
                              onChanged: (String? value) {
                                setState(() {
                                  _selectedType = value.toString();
                                });
                              },),
                            Spacing.y(3),
                            CustomDropdown(
                              title: "Brand",
                              hint: "Honda",
                              selectedValue: _selectedBrand,
                              items: brand,
                              onChanged: (String? value) {
                                setState(() {
                                  _selectedBrand = value.toString();
                                });
                              },),
                            Spacing.y(3),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}