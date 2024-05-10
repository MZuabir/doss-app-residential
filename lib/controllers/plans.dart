import 'dart:convert';
import 'dart:developer';

import 'package:doss_resident/constants/api.dart';
import 'package:doss_resident/constants/cont.dart';
import 'package:doss_resident/models/plans.dart';
import 'package:doss_resident/services/api.dart';
import 'package:doss_resident/view/pages/payment%20webview/payment_webview.dart';
import 'package:doss_resident/view/widgets/custom_snackbar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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
  Future<void> getPaymentLink(String sID) async {
    try {
      isLoading.value = true;
      final fcmToken = await FirebaseMessaging.instance.getToken();

      String planID = plans!.data.plans[selectedPlan.value].id;
      final body = {"tokenId": fcmToken, "planId": planID};
     
      final response = await ApiService.post(
          endPoint:
              '${ApiUrls.endpoint}residential/onboard/service-provider/payment/plan',
          accessToken: authCont.accessToken.value,
          body: body);
      if (response!.statusCode == 200) {
        final paymentlink=jsonDecode(response.body)['data']['linkVisualizacao'];
        log("PAYMENT LINK ${paymentlink}");
        Get.to(() => PaymentWebviewPage(url: paymentlink, onSuccess: () {}));
      } else {
        showCustomSnackbar(true, "Something went wrong");
      }
      log(response!.body);
    } catch (e) {
      showCustomSnackbar(true, "Something went wrong");
    } finally {
      isLoading.value = false;
    }
  }
}
