import 'package:doss/controllers/history_tab.dart';
import 'package:doss/utils/size_config.dart';
import 'package:doss/utils/spacing.dart';
import 'package:doss/view/pages/history/all/all.dart';
import 'package:doss/view/pages/history/roof/history_roof.dart';
import 'package:doss/view/pages/history/verification/history_verification.dart';
import 'package:doss/view/widgets/background.dart';
import 'package:doss/view/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/colors.dart';



class HistoryTabBarPage extends StatelessWidget {
  final cont=Get.put(HistoryTabCont());

  HistoryTabBarPage({super.key});
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    List<String> statusTitle = [
      "All",
      "Roof",
      "Verification",
    ];
    return  Obx(
          ()=> Scaffold(
        body: Background(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier*2.5),
            child: Column(
              children: [
                Spacing.y(7),
                const CustomAppbar(title: "History"),
                Spacing.y(5),
                Container(
                  height: SizeConfig.heightMultiplier*6.7,
                  width: SizeConfig.widthMultiplier*100,
                  decoration: BoxDecoration(
                    color: AppColors.tileClr,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ...List.generate(
                        statusTitle.length,
                            (index) => GestureDetector(
                          onTap: () {
                            cont.selectedStatus.value = index;
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.widthMultiplier * 2.5,
                              vertical: SizeConfig.heightMultiplier * 1,
                            ),
                            child: Hero(
                              tag: 'statusTag$index',
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut, // Use Curves.easeInOut for smooth animation
                                height: SizeConfig.heightMultiplier * 5.5,
                                width:cont.selectedStatus.value==index?SizeConfig.widthMultiplier * 30: SizeConfig.widthMultiplier * 25,
                                decoration:cont.selectedStatus.value == index ? BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color:AppColors.primaryClr,
                                ):
                                BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: AppColors.tileClr,
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  statusTitle[index],
                                  style: textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: cont.selectedStatus.value == index ? Colors.black : Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacing.y(5),
                cont.selectedStatus.value==0? AllPage():
                cont.selectedStatus.value==1?const HistoryRoofPage():const HistoryVerificationPage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
