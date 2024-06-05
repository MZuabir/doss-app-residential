import 'dart:convert';
import 'dart:developer';

import 'package:doss_resident/constants/api.dart';
import 'package:doss_resident/constants/cont.dart';
import 'package:doss_resident/controllers/base_address.dart';
import 'package:doss_resident/models/service_providers.dart';
import 'package:doss_resident/services/api.dart';
import 'package:doss_resident/view/widgets/custom_snackbar.dart';
import 'package:get/get.dart';

class ServiceProvidersCont extends GetxController {
  final Rxn<List<ServiceProvidersModel>> _serviceProviders =
      Rxn<List<ServiceProvidersModel>>();
  List<ServiceProvidersModel>? get serviceProviders => _serviceProviders.value;

  Future<void> getServiceProvidersFromBackend(String zipCode) async {
    try {
     if(zipCode.isEmpty){
      zipCode=authCont.onboardUserInfo.value!.addresses!.zipCode!;
     }
      final response = await ApiService.get(
          endPoint: '${ApiUrls.endpoint}service-provider/zipcode/$zipCode',
          accessToken: authCont.accessToken.value);
      _serviceProviders.value = [];
      log(response!.body);
      final body=jsonDecode(response.body);
      body.forEach((element){
_serviceProviders.value!.add(ServiceProvidersModel.fromJson(element));
      });
       
          
    } catch (e) {
      log(e.toString());
      showCustomSnackbar(true, "Something went wrong");
    }
  }

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration.zero,(){
      final addressCont=Get.find<BaseAddressCont>();
      getServiceProvidersFromBackend(addressCont.zipCode.text);
    });
  }
}
