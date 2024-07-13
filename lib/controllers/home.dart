import 'dart:convert';
import 'dart:developer';

import 'package:doss_resident/controllers/auth.dart';
import 'package:doss_resident/models/verification_all.dart';
import 'package:doss_resident/services/api.dart';
import 'package:doss_resident/view/bottomsheets/verification_bottom_sheet.dart';
import 'package:doss_resident/view/pages/chat/chat.dart';
import 'package:doss_resident/view/widgets/custom_snackbar.dart';
import 'package:get/get.dart';

class HomeCont extends GetxController {
  RxBool isSwitched = false.obs;
  final AuthCont auth = Get.find<AuthCont>();
  RxBool isRequestRoof = false.obs;
  RxBool isGenertingTicket = false.obs;

  Future<void> getTicket() async {
    try {
      isRequestRoof.value = true;
      final response = await ApiService.getToken(
        token: auth.accessToken.value,
      );
      if (response != null) {
        if (response.statusCode == 200) {
          // do something here
          final res = response.body;
          final data = jsonDecode(res);
          log(data.toString());
          if (!data["existsVerificationRequest"]) {
            Get.bottomSheet(VerificationBottomSheet(
              onTap: () async {
                await generateTicket();
              },
            ));
          } else {
            Get.to(() => ChatPage(
                  data: Verification(
                      id: "1",
                      message: "Hiii",
                      address: Address(
                          city: "RYK",
                          lat: 12222,
                          lng: 111111,
                          number: "030033333333",
                          state: "Punjab",
                          street: "Street 1",
                          zipCode: "64000")),
                ));
          }
        } else {
          showCustomSnackbar(true, "Something went wrong");
        }
      }
    } catch (e) {
      showCustomSnackbar(true, "Something went wrong");
      log(e.toString());
    }
  }

  Future<void> generateTicket() async {
    try {
      final Map<String, String> body = {
        "HomePlaceId": "01HZT75XQY7HY8V51R5JE02HRM",
        "Title": "Test bro"
      };
      isRequestRoof.value = true;
      final response = await ApiService.generateTicket(
          token: auth.accessToken.value, body: body);
      log(response?.statusCode.toString() ?? "no response");
      if (response != null) {
        if (response.statusCode == 200) {
          // do something here
          final res = response.body;
          final data = jsonDecode(res);
        }
      }
    } catch (e) {
      showCustomSnackbar(true, "Something went wrong");
      log(e.toString());
    }
  }
}
