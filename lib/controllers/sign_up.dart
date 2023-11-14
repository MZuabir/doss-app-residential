import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpCont extends GetxController {
  late TextEditingController emailController;
  RxBool isEnabled = false.obs;
  RxBool termsAndPolicies = false.obs;
  RxBool age = false.obs;

  @override
  void onInit() {
    super.onInit();
    emailController = TextEditingController();

    emailController.addListener(() {
      updateButtonState();
    });
  }

  void updateButtonState() {
    isEnabled.value = emailController.text.isNotEmpty && termsAndPolicies.value && age.value;
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
