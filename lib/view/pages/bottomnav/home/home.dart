import 'package:doss/constants/colors.dart';
import 'package:doss/constants/icons.dart';
import 'package:doss/models/on_boarding.dart';
import 'package:doss/utils/size_config.dart';
import 'package:doss/utils/spacing.dart';
import 'package:doss/view/pages/emergency/emergency.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../car/car.dart';
import '../../customers/customers.dart';
import '../../history/history.dart';
import 'components/custom_appbar.dart';
import 'components/custom_button.dart';
import 'components/grid_card.dart';
import 'components/status_tile.dart';
import 'components/verification_card.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier*2.5),
      child: Column(
        children: [
          Spacing.y(7),
          const CustomHomeAppbar(),
          Spacing.y(4),
          const StatusTile(),
          Spacing.y(3),
          Row(
            children: [
              Expanded(
                child: VerificationCard(
                  icon: AppIcons.search,
                  title: "Roof",
                ),
              ),
              Spacing.x(4),
              Expanded(
                child: VerificationCard(
                  icon: AppIcons.security,
                  title: "Verifications",
                ),
              ),
            ],
          ),
          Spacing.y(3),
          Container(
            height: SizeConfig.heightMultiplier*10,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.darkGryClr,
            ),
            child: Padding(
              padding:  EdgeInsets.symmetric(
                  horizontal: SizeConfig.widthMultiplier*5.0,
                  vertical: SizeConfig.heightMultiplier*2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                      SizedBox(
                        width: SizeConfig.widthMultiplier*30,
                        child: Text("In need of more urgent help?",
                          textAlign: TextAlign.start,
                          style: textTheme.bodySmall,
                        ),
                      ),
                  const Spacer(),
                   HomeButton(
                    onTap: (){
                      Get.to(()=>EmergencyTabBarPage(),
                      transition: Transition.rightToLeft,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Column(
        children: List.generate(
          2,
              (rowIndex) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              3,
                  (colIndex) {
                    int index = rowIndex * 3 + colIndex;
                return Padding(
                  padding:EdgeInsets.symmetric(vertical: SizeConfig.heightMultiplier*3),
                  child: GestureDetector(
                    onTap: (){
                      var currentIndex=index;
                      if(currentIndex==1){
                        Get.to(()=>const CarPage(),
                        transition: Transition.rightToLeft,
                        );
                      }
                      if(currentIndex==3){
                        Get.to(()=>const Customers(),
                          transition: Transition.rightToLeft,
                        );
                      }
                      if(currentIndex==4){
                        Get.to(()=>HistoryTabBarPage(),
                          transition: Transition.rightToLeft,
                        );
                      }
                    },
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal:SizeConfig.widthMultiplier*5),
                      child: GridCard(
                        title: homeGridData[index].title,
                        icon: homeGridData[index].icon,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
        ],
      ),
    );
  }
}
