import 'dart:convert';
import 'dart:developer';
import 'package:doss_resident/controllers/sign_up.dart';
import 'package:doss_resident/services/zipcode.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/api.dart';
import '../constants/cont.dart';
import '../services/api.dart';
import '../view/widgets/custom_snackbar.dart';

class BaseAddressCont extends GetxController {
  RxBool isCheckingZipCode = false.obs;

  final cont = Get.find<SignUpCont>();
  //FORM KEY
  final formKey = GlobalKey<FormState>();
  //SIGNUP CONTROLLERS
  TextEditingController number = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController state = TextEditingController();

  TextEditingController zipCode = TextEditingController();
  TextEditingController addressName = TextEditingController();
  String neighborhood = '';
  TextEditingController complement = TextEditingController();
  final FocusNode numberNode = FocusNode();
  final FocusNode countryNode = FocusNode();
  final FocusNode cityNode = FocusNode();
  final FocusNode streetNode = FocusNode();
  final FocusNode zipCodeNode = FocusNode();
  final FocusNode complementNode = FocusNode();

  Future<void> postBaseAddress() async {
    try {
      final body = {
        "homePlaceId": "",
        "homePlaceName": addressName.text,
        "selectHomePlaceDefault": true,
        "country": country.text,
        "state": state.text,
        "city": city.text,
        "street": street.text,
        "complement": complement.text,
        "zipCode": zipCode.text,
        "neighborhood": neighborhood,
        "number": number.text,
      };

      authCont.isLoading.value = true;
      final response = await ApiService.post(
        endPoint: '${ApiUrls.endpoint}residential/onboard/address',
        accessToken: authCont.accessToken.value,
        body: body,
        isAuth: false,
      );
      if (response != null) {
        final responseBody = jsonDecode(response.body);
        if (response.statusCode == 200 || response.statusCode == 201) {
          log("RESPONSE NEW ${response.body}".toString());
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
    } catch (e) {
      authCont.isLoading.value = false;
      print(e);
      showCustomSnackbar(true, "Something went wrong");
    }
  }

  Future<void> checkZipCode(String val) async {
    try {
      isCheckingZipCode.value = true;
      final model = await ZipCodeService.getZipCodeDetails(val);
      log(model?.toJson().toString() ?? "no data");
      if (model != null) {
        state.text = model.state.sigla;
        city.text = model.city.name;
        neighborhood = model.neighborhood;
        street.text = model.street;
        complement.text = model.complement;
        country.text = 'Brazil';
      }
      log("NEIGHTBORHOOD $neighborhood");
    } catch (e) {
      showCustomSnackbar(true, "Something went wrong");
    } finally {
      isCheckingZipCode.value = false;
    }
  }
}
