import 'package:doss_resident/constants/local_db.dart';
import 'package:doss_resident/view/pages/bottomnav/bottom_nav_bar.dart';
import 'package:doss_resident/view/widgets/custom_snackbar.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpCont extends GetxController {
  late TextEditingController emailController;
  RxBool isEnabled = false.obs;
  RxBool termsAndPolicies = false.obs;
  RxBool age = false.obs;
  RxInt signupTabIndex = 0.obs;

  PageController pageController = PageController();

  void updateButtonState() {
    isEnabled.value =
        emailController.text.isNotEmpty && termsAndPolicies.value && age.value;
  }

  Future<void> onPaymentSuccess() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(LocalDBconstants.isGoHome, true);
    Get.offAll(const BottomNavPage());
  }

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();

    emailController.addListener(() {
      updateButtonState();
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      showCustomSnackbar(false,
          "${message.notification!.title!}\n${message.notification!.body!}");
      onPaymentSuccess();
      // LocalNotificationsService().showAwesomeNotification(message);
    });
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
