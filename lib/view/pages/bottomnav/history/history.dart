import 'package:doss_resident/view/pages/bottomnav/history/components/history_verification.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../constants/colors.dart';
import '../../../../utils/size_config.dart';
import '../../../../utils/spacing.dart';
import '../../../widgets/background.dart';
import '../../../widgets/custom_appbar.dart';
import 'components/all.dart';
import 'components/history_roof.dart';

class NotificationScreen extends StatefulWidget {
  NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    with SingleTickerProviderStateMixin {
  static  List<Tab> myTabs = <Tab>[
    Tab(text: tr('All'),),
    Tab(text: tr('Roof')),
    Tab(text: tr('Verification')),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Background(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.widthMultiplier * 2.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacing.y(7),
                  Text("History",
                      textAlign: TextAlign.center,
                      style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600)
                  ).tr(),
                  Spacing.y(4),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.widthMultiplier * 2),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.darkGryClr,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 0,horizontal: SizeConfig.widthMultiplier * 2),
                      child: TabBar(
                        indicatorSize: TabBarIndicatorSize.tab,indicatorPadding: EdgeInsets.symmetric(vertical: SizeConfig.heightMultiplier * 0.8),
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: AppColors.primaryClr
                        ),
                        indicatorColor: AppColors.primaryClr,
                        controller: _tabController,
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.white,
                        labelStyle: textTheme.bodyMedium!
                            .copyWith(fontWeight: FontWeight.w600,fontSize: SizeConfig.textMultiplier*1.6),
                        tabs: myTabs,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding:  EdgeInsets.only(
                    right: SizeConfig.widthMultiplier*2.5,
                    left: SizeConfig.widthMultiplier*2.5,
                    top: SizeConfig.heightMultiplier*3),
                child: TabBarView(
                  controller: _tabController,
                  physics: const BouncingScrollPhysics(),
                  children:  [
                    AllPage(),
                    const HistoryRoofPage(),
                    const HistoryVerificationPage(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
