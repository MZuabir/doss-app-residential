import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../controllers/payment_tab.dart';
import '../../../utils/size_config.dart';
import '../../../utils/spacing.dart';
import '../../widgets/background.dart';
import '../../widgets/custom_appbar.dart';
import '../credit_card/credit_card.dart';



class PaymentTabPage extends StatelessWidget {
  final cont=Get.put(PaymentTabCont());
  final PageController _pageController = PageController();

  PaymentTabPage({super.key});
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    List<String> statusTitle = [
      "Credit Card",
      "PIX",
    ];
    return  Obx(
          ()=> Scaffold(
        body: Background(
          child: Column(
            children: [
              Spacing.y(7),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier*2.5),
                child: const CustomAppbar(title: "Payment"),
              ),
              Spacing.y(5),
              Container(
                height: SizeConfig.heightMultiplier*6.7,
                width: SizeConfig.widthMultiplier*80,
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
                           _pageController.page==0.0?  _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          ):_pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
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
                              width:SizeConfig.widthMultiplier * 35,
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
              Spacing.y(3),
              Expanded(
                child: PageView.builder(
                  itemCount: statusTitle.length,
                  controller: _pageController,
                  onPageChanged: (int index) {
                      cont.selectedStatus.value = index;
                  },
                  itemBuilder: (BuildContext context, int index) {
                    if(cont.selectedStatus.value==0) {
                      return CreditCardPage();
                    }
                    if(cont.selectedStatus.value==1) {
                      return CreditCardPage();
                    }
                  },),
              ),
              // cont.selectedStatus.value==0? const CreditCardPage():const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
