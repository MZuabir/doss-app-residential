import 'dart:convert';
import 'dart:developer';

import 'package:doss_resident/constants/api.dart';
import 'package:doss_resident/constants/cont.dart';
import 'package:doss_resident/models/vehicles.dart';
import 'package:doss_resident/services/api.dart';
import 'package:doss_resident/services/image_picker.dart';
import 'package:doss_resident/view/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class VehiclesCont extends GetxController {
  int currentPage = 1;
  final Rxn<List<VehiclesModel>> vehicles = Rxn<List<VehiclesModel>>();
  final List _wantChangeVehicles = [];
  RxList vehicleTypesStringList = [].obs;

  List<VehiclesModel>? get getVehicles => vehicles.value;

  Future<void> getVehiclesFromBackend() async {
    try {
      final response = await ApiService.get(
          endPoint: "${ApiUrls.endpoint}residential/homeplace/${authCont.residentialInfo.value!.homePlaces!.first.homePlaceId}/vehicle/all",
          accessToken: authCont.accessToken.value);
        log("VEHICLES:  ${response!.body}");
      if (response!.statusCode == 200) {
        
       final body=jsonDecode(response.body) as List<dynamic>;
        if (currentPage == 1) {
          vehicles.value = [];
        }
        for (var element in body) {
          vehicles.value!.add(VehiclesModel.fromJson(element));
        }}
    } catch (e) {
      log(e.toString());
      showCustomSnackbar(true, "Something went wrong");
    }
  }

  //CHANGE VEHICLES DATA
  Future<void> updateVehiclesData({
    required String id,
    required String brand,
    required String model,
    required String color,
    required String plate,
    required String? photo,
    String? photoUrl,
    required String type,
  }) async {
    try {
      authCont.isLoading.value = true;
      final Map<String, Object> body;
      if (photo == null) {
        body = {
          "id": id,
          "brand": brand,
          "model": model,
          "color": color,
          "plate": plate,
          "defaultVehicle": true,
          "vehicleType": type
        };
      } else {
        log("THOMASSS");
        final base64Img = await ImagePickerService.xFileToBase64(XFile(photo));
        body = {
          "id": id,
          "brand": brand,
          "model": model,
          "color": color,
          "plate": plate,
          "photo": base64Img,
          "defaultVehicle": true,
          "vehicleType": type
        };
      }
      log(body.toString());
      //CHANGE DATA NEEDED
      final response = await ApiService.put(
          endPoint: ApiUrls.endpoint + "",
          body: body,
          accessToken: authCont.accessToken.value);
      log(response!.body);
      if (response.statusCode == 200) {
        showCustomSnackbar(false, "Vehicle updated successfully.");
      } else if (response.statusCode == 400) {
        final error = jsonDecode(response.body)['errors'][0];

        showCustomSnackbar(true, error.toString());
      }
    } catch (e) {
      log(e.toString());
      showCustomSnackbar(true, "Something went wrong");
    } finally {
      authCont.isLoading.value = false;
    }
  }

  Future<void> putVehicleInUseOrNot(String id, bool value) async {
    try {
      authCont.isLoading.value = true;
      log("${ApiUrls.endpoint}vehicle/$id/default/$value");
      final response = await ApiService.put(
          endPoint: "${ApiUrls.endpoint}vehicle/$id/default/$value",
          accessToken: authCont.accessToken.value);
      log(response!.body);
      if (response!.statusCode == 200) {
        currentPage = 1;
        vehicles.value = null;
        getVehiclesFromBackend();
      }
    } catch (e) {
      log(e.toString());
      showCustomSnackbar(true, "Something went wrong");
    } finally {
      authCont.isLoading.value = false;
    }
  }

  Future<void> removeVehicle(String id) async {
    try {
      Get.back();
      authCont.isLoading.value = true;
      final response = await ApiService.put(
          endPoint: "${ApiUrls.endpoint}vehicle/$id/status/Inactive",
          accessToken: authCont.accessToken.value);
      if (response!.statusCode == 200) {
        int getIndex = getVehicles!.indexWhere((element) => element.id == id);
        vehicles.value!.removeAt(getIndex);
        vehicles.refresh();
      }
    } catch (e) {
      log(e.toString());
      showCustomSnackbar(true, "Something went wrong");
    } finally {
      authCont.isLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration.zero, () async {
      await getVehiclesFromBackend();
    });
  }
}
