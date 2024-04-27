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
  final Rxn<ServiceProvidersModel> _serviceProviders =
      Rxn<ServiceProvidersModel>();
  ServiceProvidersModel? get serviceProviders => _serviceProviders.value;

  Future<void> getServiceProvidersFromBackend(String zipCode) async {
    try {
      final response = await ApiService.get(
          endPoint: '${ApiUrls.endpoint}/service-provider/zipcode/13100474',
          accessToken: authCont.accessToken.value);
      log(response!.body);
      _serviceProviders.value =
          ServiceProvidersModel.fromJson(jsonDecode(response.body));
    } catch (e) {
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
