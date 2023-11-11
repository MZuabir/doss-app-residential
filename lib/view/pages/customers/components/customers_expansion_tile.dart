import 'package:flutter/material.dart';
import '../../../../constants/colors.dart';
import '../../../../utils/size_config.dart';
import '../../../../utils/spacing.dart';


class CustomersExpansionTile extends StatefulWidget {
  final Color color;
  const CustomersExpansionTile({Key? key,  this.color=Colors.green}) : super(key: key);

  @override
  State<CustomersExpansionTile> createState() => _CustomersExpansionTileState();
}
class _CustomersExpansionTileState extends State<CustomersExpansionTile> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool isExpanded = false;

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
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: AppColors.darkGryClr,
                    backgroundImage: const NetworkImage("https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                  ),
                  Spacing.x(3),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Joao Alves . ",
                            style: textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "Home plan",
                            style: textTheme.bodySmall,
                          ),
                        ],
                      ),
                      Spacing.y(1),
                      Row(
                        children: [
                          Text(
                            "Payment status: ",
                            style: textTheme.bodySmall,
                          ),
                          Text(
                            "up to date",
                            style: textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),
                          ),
                          Spacing.x(2),
                          Container(
                            height: 5,
                            width: 5,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: widget.color,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Icon(isExpanded?Icons.expand_less:Icons.expand_more,
                    color: AppColors.whiteClr,
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
                        children: [
                          Padding(
                            padding:EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier*4),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Spacing.y(2),
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
                                Spacing.y(3),
                                Text("Avenida Anchieta, 200 - Campinas - SP - CEP: 13.015-904",
                                style: textTheme.bodyMedium,),
                                Spacing.y(3),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Vehicle(s)",
                                      style: textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      "See All",
                                      style: textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600,color: AppColors.primaryClr),
                                    ),
                                  ],
                                ),
                                Spacing.y(3),
                                Text("Yamaha Ténéré 250 - Azul - XZT0000",
                                  style: textTheme.bodyMedium,),
                                Spacing.y(1.5),
                                Text("+2 Vehicles",
                                  style: textTheme.bodyMedium,),
                                Spacing.y(2),
                              ],
                            ),
                          ),
                          Container(
                            height: SizeConfig.heightMultiplier*20,
                            width: SizeConfig.widthMultiplier*100,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10)
                              )
                            ),
                            child: Image.network("https://images.pexels.com/photos/116675/pexels-photo-116675.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
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