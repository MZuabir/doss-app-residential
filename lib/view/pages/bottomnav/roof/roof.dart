import 'package:doss_resident/view/widgets/custom_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import '../../../../utils/size_config.dart';
import '../../../../utils/spacing.dart';
import '../../../widgets/background.dart';
import '../../request_coverage/request_coverage.dart';
import 'components/coverage_card.dart';
import 'components/vehicle_card.dart';

class RoofPage extends StatefulWidget {
  const RoofPage({Key? key}) : super(key: key);

  @override
  State<RoofPage> createState() => _RoofPageState();
}

class _RoofPageState extends State<RoofPage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return  Scaffold(
      body: Background(
        child:Padding(
          padding:  EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier*2.5),
          child: Column(
            children: [
              Spacing.y(7),
              Text("Roof",
                  textAlign: TextAlign.center,
                  style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600)
              ).tr(),
              Spacing.y(4),
              Expanded(child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Coverage Request",
                    style: textTheme.bodyLarge!.copyWith(fontSize: SizeConfig.textMultiplier*2.5),
                    ).tr(),
                  Spacing.y(2),
                  const CoverageCard(),
                  const VehicleCard(),
                    CustomButton(title: "Request coverage", onTap: (){
                      Get.to(()=> const RequestCoveragePage(),
                      transition:Transition.rightToLeft,
                      );
                    }),

                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
