import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../constants/colors.dart';
import '../../../../utils/size_config.dart';
import '../../../../utils/spacing.dart';


class CustomCoverageExpansionTile extends StatefulWidget {
  const CustomCoverageExpansionTile({Key? key}) : super(key: key);

  @override
  State<CustomCoverageExpansionTile> createState() => _CustomCoverageExpansionTileState();
}
class _CustomCoverageExpansionTileState extends State<CustomCoverageExpansionTile> with SingleTickerProviderStateMixin {
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
                  Text(
                    "Lookout on the way",
                    style: textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),
                  ).tr(),
                  Spacing.y(2),
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 17,
                        backgroundImage: NetworkImage("https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                      ),
                      Spacing.x(2),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "John Jones",
                            style: textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w600),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Online",
                                style: textTheme.bodySmall,
                              ),
                              Spacing.x(1),
                              Container(
                                height: 7,
                                width: 7,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      Icon(isExpanded? Icons.expand_less:Icons.expand_more,color: Colors.white,),
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier*4),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Spacing.y(2),
                                Text(
                                  "watchman's car",
                                  style: textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w600),
                                ).tr(),
                                Spacing.y(2),
                                Text(
                                  " Fiat Argo Drive 1.0 - Prata - XYZ0000",
                                  style: textTheme.bodySmall,
                                ),
                                Spacing.y(2),
                              ],
                            ),
                          ),
                          Container(
                            height: SizeConfig.heightMultiplier*35,
                            width: SizeConfig.widthMultiplier*100,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage("https://img.freepik.com/free-vector/blue-sports-car-isolated-white-vector_53876-67354.jpg?size=626&ext=jpg&ga=GA1.1.1880011253.1700179200&semt=ais"),
                                fit: BoxFit.cover,
                              ),
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              )
                            ),
                          )
                        ],
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