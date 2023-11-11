import 'package:doss/utils/size_config.dart';
import 'package:doss/utils/spacing.dart';
import 'package:doss/view/pages/emergency_customers/emergency_customers.dart';
import 'package:doss/view/pages/usefull_contacts/usefull_contacts.dart';
import 'package:doss/view/widgets/background.dart';
import 'package:doss/view/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../controllers/emergency_tab.dart';



class EmergencyTabBarPage extends StatelessWidget {
  final cont=Get.put(EmergencyTabCont());

   EmergencyTabBarPage({super.key});
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    List<String> statusTitle = [
      "Useful contacts",
      "Customers",
    ];
    return  Obx(
      ()=> Scaffold(
        body: Background(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier*2.5),
            child: Column(
              children: [
                Spacing.y(7),
                const CustomAppbar(title: "Emergency"),
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
                                width:SizeConfig.widthMultiplier * 40,
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
                cont.selectedStatus.value==0?const UseFullContactsPage():const EmergencyCustomersPage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
