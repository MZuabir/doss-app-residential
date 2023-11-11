import 'package:doss/constants/colors.dart';
import 'package:doss/utils/size_config.dart';
import 'package:doss/utils/spacing.dart';
import 'package:doss/view/pages/customers/canceled/canceled.dart';
import 'package:doss/view/pages/customers/components/active_customer_card.dart';
import 'package:doss/view/pages/customers/components/earning_card.dart';
import 'package:doss/view/pages/customers/components/plan_card.dart';
import 'package:doss/view/pages/customers/customers_all/customer_all.dart';
import 'package:doss/view/pages/customers/in_day/in_day.dart';
import 'package:doss/view/pages/customers/pending/pending.dart';
import 'package:doss/view/widgets/background.dart';
import 'package:doss/view/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/customers_tab.dart';

class Customers extends StatefulWidget {
  const Customers({Key? key}) : super(key: key);

  @override
  State<Customers> createState() => _CustomersState();
}

class _CustomersState extends State<Customers> {
  final cont=Get.put(CustomerTabCont());
  @override
  Widget build(BuildContext context) {
    List<String> statusTitle = [
      "All",
      "In day",
      "Pending",
      "Canceled",
    ];
    final textTheme = Theme.of(context).textTheme;
    return Obx(
        ()=> Scaffold(
        body: Background(
          child:Padding(
            padding:  EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier*2.5),
            child: Column(
              children: [
                Spacing.y(7),
                const CustomAppbar(title: "Customers"),
                Spacing.y(4),
                Row(
                  children: [
                    const Expanded(
                      child: ActiveCustomerCard(),
                    ),
                    Spacing.x(4),
                    Expanded(
                      child: Column(
                        children: [
                          const EarningCard(title: 'Total Earning',),
                          Spacing.y(2),
                          const EarningCard(title: 'Earnings in the month',),
                        ],
                      ),
                    )
                  ],
                ),
                Spacing.y(2),
                const PlanCard(),
                Spacing.y(2),
                Divider(
                  thickness: 2,
                  color: AppColors.darkGryClr,
                ),
                Spacing.y(2),
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
                                width:cont.selectedStatus.value==index?SizeConfig.widthMultiplier * 21: SizeConfig.widthMultiplier * 18,
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
                Spacing.y(2),
                cont.selectedStatus.value==0?const CustomerAllPage():
                cont.selectedStatus.value==1?const InDayPage():
                cont.selectedStatus.value==2?const PendingPage():
                    const CanceledPage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
