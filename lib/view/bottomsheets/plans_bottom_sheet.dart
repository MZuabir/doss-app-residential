import 'package:doss_resident/constants/cont.dart';
import 'package:doss_resident/constants/icons.dart';
import 'package:doss_resident/controllers/plans.dart';
import 'package:doss_resident/view/widgets/loading.dart';
import 'package:doss_resident/view/widgets/txt_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../utils/size_config.dart';
import '../../utils/spacing.dart';
import '../widgets/custom_button.dart';

class PlansBottomSheet extends StatefulWidget {
  PlansBottomSheet({
    super.key,
    required this.sID,
  });
  final String sID;
  @override
  State<PlansBottomSheet> createState() => _PlansBottomSheetState();
}

class _PlansBottomSheetState extends State<PlansBottomSheet> {
  final cont = Get.put(PlansCont());

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () => cont.getPlans(widget.sID));
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: SizeConfig.heightMultiplier * 80,
      color: Colors.black,
      padding:
          EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 2.5),
      child: Obx(
        () => cont.plans == null
            ? LoadingWidget(height: SizeConfig.heightMultiplier * 70)
            : cont.plans!.data.plans.isEmpty
                ? const Center(
                    child: Text('No Plans Found!'),
                  )
                : Column(
                    children: [
                      Spacing.y(1),
                      CircleAvatar(
                        radius: 23,
                        backgroundColor: AppColors.darkGryClr,
                        child: Image.asset(
                          AppIcons.guard,
                          height: SizeConfig.imageSizeMultiplier * 7,
                          width: SizeConfig.imageSizeMultiplier * 7,
                        ),
                      ),
                      Spacing.y(3),
                      Text(
                        "Select your plan",
                        style: textTheme.headlineMedium!
                            .copyWith(fontWeight: FontWeight.w600),
                      ).tr(),
                      Spacing.y(2),
                      Text(
                        "Monthly billing, cancel whenever you want.",
                        style: textTheme.bodySmall,
                        textAlign: TextAlign.center,
                      ).tr(),
                      Spacing.y(5),
                      //PLANS
                      SizedBox(
                        height: SizeConfig.heightMultiplier * 40,
                        width: SizeConfig.widthMultiplier * 100,
                        child: Column(
                          children: [
                            ...List.generate(cont.plans!.data!.plans!.length,
                                (index) {
                              final data = cont.plans!.data!.plans![index];
                              return GestureDetector(
                                onTap: () {
                                  cont.selectedPlan.value = index;
                                },
                                child: Container(
                                  width: SizeConfig.widthMultiplier * 100,
                                  margin: EdgeInsets.only(
                                    bottom: SizeConfig.heightMultiplier * 3,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          SizeConfig.widthMultiplier * 4,
                                      vertical:
                                          SizeConfig.heightMultiplier * 2),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: AppColors.darkGryClr,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            data.description,
                                            style: textTheme.bodyMedium,
                                          ).tr(),
                                          AnimatedContainer(
                                            duration: const Duration(
                                                milliseconds: 200),
                                            height: 18,
                                            width: 18,
                                            padding: const EdgeInsets.all(2.5),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color:
                                                    cont.selectedPlan.value ==
                                                            index
                                                        ? AppColors.primaryClr
                                                        : AppColors.whiteClr,
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            child: Container(
                                              height: 15,
                                              width: 15,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color:
                                                    cont.selectedPlan.value ==
                                                            index
                                                        ? AppColors.primaryClr
                                                        : AppColors.darkGryClr,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Spacing.y(2),
                                      Row(
                                        children: [
                                          Text(
                                            numberFormat.format(data.price),
                                            style: textTheme.headlineSmall!
                                                .copyWith(
                                                    color:
                                                        AppColors.primaryClr),
                                          ),
                                          Text(
                                            "/mes",
                                            style: textTheme.bodyLarge,
                                          )
                                        ],
                                      ),
                                      Spacing.y(1),
                                      Text(
                                        "+ R\$5+ ${tr("convenience fee")}",
                                        style: textTheme.bodySmall,
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                      const Spacer(),
                      CustomButton(
                        isLoading: cont.isLoading.value,
                        title: tr('Continue to payment'),
                        onTap: () => cont.getPaymentLink(widget.sID),
                      ),
                      Spacing.y(2),
                      CustomTextBtn(
                        title: "To go back",
                        onTap: () {
                          Get.back();
                        },
                      ),
                      Spacing.y(3),
                    ],
                  ),
      ),
    );
  }
}
