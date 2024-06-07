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
  final Rxn<List<PlansModel>> _plans = Rxn<List<PlansModel>>();
  List<PlansModel>? get plans => _plans.value;

  Future<void> getPlans(String workPlaceID) async {
    try {
      _plans.value = null;
      final response = await ApiService.get(
          endPoint: '${ApiUrls.endpoint}service-provider/plans/$workPlaceID',
          accessToken: authCont.accessToken.value);
      _plans.value = [];
      final body = jsonDecode(response!.body);
      log(body.toString());
      body.forEach((element) {
        _plans.value!.add(PlansModel.fromJson(element));
      });
    } catch (e) {
      log(e.toString());
      showCustomSnackbar(true, "Something went wrong");
    }
  }

  //GET PAYMENT LINK
  Future<void> getPaymentLink(String sID) async {
    try {
      isLoading.value = true;
      final fcmToken = await FirebaseMessaging.instance.getToken();

      String planID = _plans.value![selectedPlan.value].id!;
      final body = {"tokenId": fcmToken, "planId": planID};
      final response = await ApiService.post(
          endPoint: '${ApiUrls.endpoint}residential/payment/plan',
          accessToken: authCont.accessToken.value,
          body: body);
      if (response!.statusCode == 200) {
        final paymentlink =
            jsonDecode(response.body)['data']['linkVisualizacao'];
        log("PAYMENT LINK $paymentlink");
        Get.to(() => PaymentWebviewPage(url: paymentlink, onSuccess: () {}));
      } else {
        showCustomSnackbar(true, "Something went wrong");
      }
    } catch (e) {
      showCustomSnackbar(true, "Something went wrong");
    } finally {
      isLoading.value = false;
    }
  }
}
