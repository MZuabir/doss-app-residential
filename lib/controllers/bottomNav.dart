import 'package:doss_resident/constants/cont.dart';
import 'package:doss_resident/constants/icons.dart';
import 'package:doss_resident/view/bottomsheets/custom_btm_sheet.dart';
import 'package:doss_resident/view/pages/vehicles/vehicles.dart';
import 'package:get/get.dart';

class BottomNavCont extends GetxController{
  RxInt currentIndex = 0.obs;

@override
  void onInit() {
    super.onInit();
    Future.delayed(Duration.zero,()async{
      await authCont.getResidentialInfoFromBackend();
      if(authCont.residentialInfo.value!=null){
        if(!authCont.residentialInfo.value!.homePlaces!.first.registeredVehicle!){
          Get.bottomSheet(CustomBottomSheet(
              icon: AppIcons.car,
              onTap: (){
                Get.back();
                Get.to(()=>VehiclesPage());
              },
              
               btnTitle: 'Add vehicle', title: 'Welcome to DossApp!',description: 'Your registration is complete and your plan is active, but you still need to add your vehicle information.',textBtnTitle: "I'll do it later",));
        }
      }
    });

  }

}