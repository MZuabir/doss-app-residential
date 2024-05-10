import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:doss_resident/constants/colors.dart';
import 'package:doss_resident/constants/cont.dart';
import 'package:doss_resident/controllers/base_address.dart';
import 'package:doss_resident/controllers/service_providers.dart';
import 'package:doss_resident/controllers/sign_up.dart';
import 'package:doss_resident/models/service_providers.dart';
import 'package:doss_resident/utils/size_config.dart';
import 'package:doss_resident/utils/spacing.dart';
import 'package:doss_resident/view/widgets/custom_button.dart';
import 'package:doss_resident/view/widgets/loading.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants/icons.dart';
import '../../../../bottomsheets/plans_bottom_sheet.dart';
import '../../../payment/payment_tab.dart';

class ServiceProvidersPage extends StatelessWidget {
  const ServiceProvidersPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final cont = Get.put(ServiceProvidersCont());
    final addressCont = Get.find<BaseAddressCont>();

    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Spacing.y(10),
        Text(
          "These are the watchmen available to you",
          style: textTheme.bodyMedium,
        ).tr(),
        Text(
          "Select one to continue",
          style: textTheme.bodyMedium,
        ).tr(),
        Spacing.y(5),
        Obx(
          () => SizedBox(
            height: SizeConfig.heightMultiplier * 42,
            child: cont.serviceProviders == null
                ? LoadingWidget(height: SizeConfig.heightMultiplier * 42)
                : cont.serviceProviders!.data.isEmpty
                    ? const Center(
                        child: Text("No Service Providers Yet"),
                      )
                    : ListView.builder(
                        itemCount: cont.serviceProviders!.data!.length,
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return ServiceProvidersTile(
                            model: cont.serviceProviders!.data![index],
                          );
                        },
                      ),
          ),
        ),
      ],
    );
  }
}

class ServiceProvidersTile extends StatelessWidget {
  const ServiceProvidersTile({Key? key, required this.model}) : super(key: key);
  final ServiceProvidersDataModel model;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: SizeConfig.widthMultiplier * 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.darkGryClr,
      ),
      margin: EdgeInsets.only(right: SizeConfig.widthMultiplier * 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: SizeConfig.heightMultiplier * 25,
            width: SizeConfig.widthMultiplier * 60,
            child: CachedNetworkImage(
              placeholder: (_, p) => const Center(
                child: const CupertinoActivityIndicator(color: Colors.grey),
              ),
              imageUrl: model.serviceProvider!.photoUrl,
              imageBuilder: (_, o) => Container(
                height: SizeConfig.heightMultiplier * 25,
                width: SizeConfig.widthMultiplier * 60,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: o,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                  ),
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.widthMultiplier * 2.5,
              vertical: SizeConfig.heightMultiplier * 2,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.serviceProvider!.name.capitalize!,
                  style: textTheme.bodyMedium,
                ),
                Spacing.y(2),
                Row(
                  children: [
                    Text(
                      "Plans starting from",
                      style: textTheme.bodySmall!
                          .copyWith(fontWeight: FontWeight.w600),
                    ).tr(),
                    Spacing.x(2),
                    Text(
                      numberFormat.format(model.plan!.price),
                      style: textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryClr),
                    ),
                  ],
                ),
                Spacing.y(2),
                CustomButton(
                    height: SizeConfig.heightMultiplier * 4,
                    title: "View Plan",
                    onTap: () {
                      _showBottomSheet(context, model.serviceProvider.id);
                    })
              ],
            ),
          )
        ],
      ),
    );
  }

  void _showBottomSheet(BuildContext context, String sID) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return PlansBottomSheet(
          sID: sID,
          // description: "",
          // icon: AppIcons.guard,
          // onTap: () {
          //   Get.to(() => PaymentTabPage());
          // },
          // btnTitle: ,
          // title: ,
        ); // Use the separate BottomSheet widget
      },
    );
  }
}
