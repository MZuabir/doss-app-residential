
import 'package:doss_resident/constants/cont.dart';
import 'package:doss_resident/controllers/vehicles.dart';
import 'package:doss_resident/utils/size_config.dart';
import 'package:doss_resident/utils/spacing.dart';
import 'package:doss_resident/view/bottomsheets/add_vehicle.dart';
import 'package:doss_resident/view/widgets/background.dart';
import 'package:doss_resident/view/widgets/custom_appbar.dart';
import 'package:doss_resident/view/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/tile.dart';

class VehiclesPage extends StatefulWidget {
  const VehiclesPage({Key? key}) : super(key: key);
  
  @override
  State<VehiclesPage> createState() => _CarPageState();
}

class _CarPageState extends State<VehiclesPage> {
  final cont = Get.put(VehiclesCont());
  @override
  Widget build(BuildContext context) {
   
    return Obx(
      () => ShowLoading(
        inAsyncCall: authCont.isLoading.value,
        child: Scaffold(
          body: Background(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.widthMultiplier * 2.5),
              child: Column(
                children: [
                  Spacing.y(7),
                  CustomAppbar(
                    title: "vehicles",
                    isIcon: true,
                    
                    actionOnTap: () => Get.bottomSheet(AddVehicleBS(),
                        isScrollControlled: true),
                  ),
                  Spacing.y(7),
                  Expanded(
                    child: cont.getVehicles == null
                        ? LoadingWidget(
                            height: SizeConfig.heightMultiplier * 60)
                        : cont.getVehicles!.isEmpty
                            ? const Center(
                                child: Text('No Vehicles Found!'),
                              )
                            : SingleChildScrollView(
                                child: Column(
                                  children: [
                                    ...List.generate(
                                        cont.getVehicles!.length,
                                        (index) => VehiclesTile(
                                              index: index,
                                            )),
                                  ],
                                ),
                              ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}








// Obx(
// ()=> CustomDropDownField(
// hinttext: "Filter",
// listdata: cont.filterList,
// currentSelectedValue: cont.selectedFilter.value == ""
// ? null
// : cont.selectedFilter.value,
// onChanged: (value) {
// cont.selectedFilter.value = value.toString();
// },
// ),
// ),













