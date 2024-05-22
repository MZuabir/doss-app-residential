import 'dart:convert';
import 'dart:developer';
import 'package:doss_resident/controllers/sign_up.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../constants/api.dart';
import '../constants/cont.dart';
import '../services/api.dart';
import '../view/widgets/custom_snackbar.dart';

class UserDataCont extends GetxController {
  final cont = Get.find<SignUpCont>();
  //FORM KEY
  var formKey = GlobalKey<FormState>();
  //SIGNUP CONTROLLERS
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController document =
      //
      TextEditingController(text: kDebugMode ? "99363624544" : "");
  RxBool isCpfSelected = true.obs;
  RxBool isCpnjSelected = false.obs;
  final FocusNode nameNode = FocusNode();
  final FocusNode phoneNode = FocusNode();
  final FocusNode documentNode = FocusNode();
  Rxn<XFile> photo = Rxn<XFile>();
  String base64Image = '';

  Future<void> postUserData() async {
    try {
      log("message");
      if (base64Image == "") {
        showCustomSnackbar(true, "Please Select Image");
        return;
      }
      if (formKey.currentState?.validate() ?? false) {
        authCont.isLoading.value = true;
        log("message2");
        final fcmToken = await FirebaseMessaging.instance.getToken();
        final body = {
          "name": name.text,
          "document": document.text,
          "phone": phone.text,
          'typeDocument': isCpfSelected.value ? "CPF" : "CPNJ",
          "photo": base64Image,
          "termsAccept": {"termsAccept": true, "IAmOver12YearsOld": true}
        };
        log(body.toString());
        final response = await ApiService.post(
          endPoint: '${ApiUrls.endpoint}residential/onboard/user-information',
          accessToken: authCont.accessToken.value,
          body: body,
          isAuth: false,
        );
        log(response!.statusCode.toString());
        log(response!.body.toString());

        if (response != null) {
          final responseBody = jsonDecode(response.body);
          if (response.statusCode == 200 || response.statusCode == 201) {
            cont.pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
            // print(responseBody);
          } else if (response.statusCode == 400) {
            showCustomSnackbar(true, "${responseBody["errors"][0]}");
          } else {
            showCustomSnackbar(true, "${responseBody["errors"][0]}");
          }
        } else {
          showCustomSnackbar(true, "Something went wrong");
        }
        authCont.isLoading.value = false;
      } else {}
    } catch (e) {
      authCont.isLoading.value = false;
      log(e.toString());
      showCustomSnackbar(true, "Something went wrong");
    }
  }
}
