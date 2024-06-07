import 'dart:convert';
import 'package:doss_resident/constants/api.dart';
import 'package:doss_resident/constants/cont.dart';
import 'package:doss_resident/models/zip_code.dart';
import 'package:doss_resident/services/api.dart';
import 'package:doss_resident/view/widgets/custom_snackbar.dart';

class ZipCodeService {
 static Future<ZipCodeModel?> getZipCodeDetails(String val) async {
    try {
      final response = await ApiService.get(
        endPoint: '${ApiUrls.endpoint}zipcode/search/$val',
        isAuth: false,
        accessToken: authCont.accessToken.value,
      );
     
      if (response != null) {
        final responseBody = jsonDecode(response.body);
        if (response.statusCode == 200 || response.statusCode == 201) {
          //SUCCESS
          final model = ZipCodeModel.fromJson(responseBody);
          return model;

          // print(responseBody);
        } else if (response.statusCode == 400) {
          showCustomSnackbar(true, "${responseBody["errors"][0]}");
        } else {
          showCustomSnackbar(true, "${responseBody["errors"][0]}");
        }
      } else {
        // showCustomSnackbar(true, "Something went wrong");
      }
    } catch (e) {
      // print(e);
      // showCustomSnackbar(true, "Something went wrong");
    }
    return null;
  }
}
