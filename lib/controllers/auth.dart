import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:ui';
import 'package:doss_resident/models/user_model.dart';
import 'package:doss_resident/models/user_more_info.dart';
import 'package:doss_resident/constants/api.dart';
import 'package:doss_resident/services/api.dart';
import 'package:doss_resident/view/pages/bottomnav/bottom_nav_bar.dart';
import 'package:doss_resident/view/pages/onboarding/onboarding.dart';
import 'package:doss_resident/view/widgets/custom_snackbar.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter/cupertino.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/auth_b2c.dart';
import '../constants/local_db.dart';
import '../view/pages/auth/signup/signup_onboarding.dart';

class AuthCont extends GetxController {
  RxInt bnbIndex = 0.obs;
  RxBool isOnline = false.obs;
  RxBool isEmailCheck=false.obs;
  RxBool isNewVerification = false.obs;

    Rxn<UserMoreInfoModel> _userMoreInfo = Rxn<UserMoreInfoModel>();
  UserMoreInfoModel? get getUserMoreInfo => _userMoreInfo.value;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration.zero, () async {
      await checkUserLanguage();
    });
  }

  //OBSERVABLES
  RxBool isLoading = false.obs;
  RxString accessToken = ''.obs;
  RxString userLanguage = ''.obs;
  String get getUserAccessToken => accessToken.value;
  final Rxn<UserModel> _userData = Rxn<UserModel>();
  UserModel? get userInfo => _userData.value;

  //APP AUTH
  FlutterAppAuth appauth = const FlutterAppAuth();

  //SAVE USER TOKEN
  Future<void> saveUserTokens(TokenResponse result) async {
    final prefs = await SharedPreferences.getInstance();
    try {
      //SAVE ACCESS TOKEN
      prefs.setString(LocalDBconstants.accesstoken, result.accessToken!);
      //SAVE ID TOKEN
      prefs.setString(LocalDBconstants.idtoken, result.idToken!);
      //SAVE REFRESH TOKEN
      prefs.setString(LocalDBconstants.refreshToken, result.refreshToken!);
      //SAVE LOGIN BOOLEAN
      prefs.setBool(LocalDBconstants.userLogin, true);
      //SAVE ACCESS TOKEN IN LOCAL VARIABLE
      accessToken.value = result.accessToken!;
      // Get.off(HomePage());
    } catch (e) {
      print(e);
    }
  }

  //LOGIN AUTH OR SIGNUP
  Future<void> authorization() async {
    isLoading.value = true;

    AuthorizationTokenResponse? result;
    try {
      result = await appauth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(clientID, redirectURL,
            discoveryUrl:
                Platform.isAndroid ? androidDiscoveryURL : iosDiscoveryURL,
            promptValues: ['consent', 'login'],
            scopes: scopes),
      );

      if (result != null) {
        accessToken.value = result.accessToken!;
        saveUserTokens(result);
        await checkStatus();
        // await getUserMoreInfoFromBackend();
        if (isEmailCheck.value) {
          Get.to(
            () => const BottomNavPage(),
            transition: Transition.rightToLeft,
          );
        } else {
          Get.to(
            () => const SignUpOnBoardingPage(),
            transition: Transition.rightToLeft,
          );
        }
        log("XXX ${accessToken.value}");
        print(userInfo?.emails);
        // Get.to(()=>BottomNavPage());
      } else {
        print("Somethig");
      }
      isLoading.value = false;
    } catch (e) {
      print(e);
      isLoading.value = false;
    }
  }

  Future<void> signout() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      prefs.clear();
      _userData.value = null;
      bnbIndex.value = 0;
      Get.offAll(() => const OnBoardingPage());
    } catch (e) {}
  }

  Future<bool> refreshToken() async {
    final prefs = await SharedPreferences.getInstance();

    try {
      String? refreshToken = prefs.getString(LocalDBconstants.refreshToken);
      if (refreshToken == null) {
        return false;
      } else {
        final response = await appauth.token(TokenRequest(
            clientID, Platform.isAndroid ? redirectURL : redirectURL,
            discoveryUrl:
                Platform.isAndroid ? androidDiscoveryURL : iosDiscoveryURL,
            refreshToken: refreshToken));

        if (response != null) {
          log('REFRESHING TOKEN');
          _userData.value = parseIdToken(response.idToken!);
          await saveUserTokens(response);

          return true;
        } else {
          return false;
        }
      }
    } catch (e) {
      log("REFRESH ERROR $e");

      return false;
    }
  }

  UserModel parseIdToken(String idToken) {
    final parts = idToken.split(r'.');
    assert(parts.length == 3);

    final Map<String, dynamic> json = jsonDecode(
        utf8.decode(base64Url.decode(base64Url.normalize(parts[1]))));

    return UserModel.fromJson(json);
  }

  Future<void> checkUserLanguage() async {
    log("LOCAL IS ${Get.locale?.countryCode}");
    if (Get.locale?.countryCode == "US") {
      log("message4213123");
      Get.updateLocale(const Locale("en", "US"));
      timeago.setLocaleMessages('en', timeago.EnMessages());
      userLanguage.value = 'English';
    } else if (Get.locale?.countryCode == "BR") {
      log("message2222");
      Get.updateLocale(const Locale("pt", "BR"));
      timeago.setLocaleMessages('pt', timeago.PtBrMessages());
      userLanguage.value = 'Portugese';
    } else {
      userLanguage.value = 'English';
      timeago.setLocaleMessages('en', timeago.EnMessages());
      Get.updateLocale(const Locale("en", "US"));
    }
  }

  Future<void> checkStatus() async {
    try {
      final response = await ApiService.get(
        endPoint: '${ApiUrls.endpoint}residential/check',
        accessToken: accessToken.value,
        isAuth: false,
      );
      log(response!.statusCode.toString());

      // Check for an empty or malformed response body
      if (response != null && response.body.isNotEmpty) {
        if (response.statusCode == 200) {
          // Try to decode the JSON response
          try {
            final jsonData = jsonDecode(response.body);
            isEmailCheck.value = jsonData['success'];
          } catch (e) {
            print("Error decoding JSON: ${e.toString()}");
            showCustomSnackbar(true, "Invalid JSON format");
          }
        } else {
          showCustomSnackbar(true, "Something went wrong");
        }
      } else {
        isEmailCheck.value = false;
      }
    } catch (e) {
      print(accessToken);
      // Handle other exceptions (e.g., network issues)
      print("Error: ${e.toString()}");
      print("Error status api $e");
      print(isEmailCheck.value);
      showCustomSnackbar(true, "Something went wrong");
    }
  }

  //GET IF NEW VERIFICATIONS EXISTS
  Future<void> getNewVerificationExistance() async {
    try {
      final response = await ApiService.get(
          endPoint: '${ApiUrls.endpoint}verification-request/check',
          accessToken: accessToken.value);
      log(response!.body);

      if (response!.statusCode == 200 || response.statusCode == 201) {
        final body = jsonDecode(response!.body);
        isNewVerification.value = body['data']['existsVerificationRequest'];
      }
    } catch (e) {
      print(e);
      showCustomSnackbar(true, "Something went wrong");
    }
  }

  //GET USER MORE INFO
  Future<void> getUserMoreInfoFromBackend() async {
    try {
      final response = await ApiService.get(
          endPoint: '${ApiUrls.endpoint}residential/info',
          accessToken: accessToken.value);
      log("XXX ${response!.statusCode}");
      log(response!.body);

      if (response!.statusCode == 200 || response.statusCode == 201) {
        final body = jsonDecode(response!.body);
        log("DONNNNNEEE");
        _userMoreInfo.value = UserMoreInfoModel.fromJson(body);
        if (_userMoreInfo.value!.data!.userStatus == "Active") {
          isOnline.value = true;
        }
        log("DONNNNNEEE CONVERSION");
      }
    } catch (e) {
      print(e);
      showCustomSnackbar(true, "Something went wrong");
    }
  }


  //SIGNOUT
}
