import 'dart:convert';
import 'dart:developer';

import 'package:doss_resident/constants/api.dart';
import 'package:doss_resident/constants/cont.dart';
import 'package:doss_resident/models/plans.dart';
import 'package:doss_resident/services/api.dart';
import 'package:doss_resident/view/widgets/custom_snackbar.dart';
import 'package:get/get.dart';

class PlansCont extends GetxController {
  RxInt selectedPlan = 0.obs;
  RxBool isLoading = false.obs;
  final Rxn<PlansModel> _plans = Rxn<PlansModel>();
  PlansModel? get plans => _plans.value;

  Future<void> getPlans(String serviceProviderID) async {
    try {
      _plans.value = null;
      final response = await ApiService.get(
          endPoint:
              '${ApiUrls.endpoint}/service-provider/$serviceProviderID/plans',
          accessToken: authCont.accessToken.value);
      log(response!.body);
      _plans.value = PlansModel.fromJson(jsonDecode(response.body));
    } catch (e) {
      showCustomSnackbar(true, "Something went wrong");
    }
  }

  //GET PAYMENT LINK
  Future<void> getPaymentLink() async {
    try {
      isLoading.value = true;

      final response = await ApiService.get(
          endPoint:
              '${ApiUrls.endpoint}residential/onboard/payment/${plans!.data.plans[selectedPlan.value].id}/pix',
          accessToken: authCont.accessToken.value);
      log(response!.body);
    } catch (e) {
      showCustomSnackbar(true, "Something went wrong");
    } finally {
      isLoading.value = false;
    }
  }
}
