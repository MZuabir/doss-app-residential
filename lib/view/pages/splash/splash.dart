import 'dart:async';

import 'package:doss_resident/constants/cont.dart';
import 'package:doss_resident/constants/local_db.dart';
import 'package:doss_resident/view/pages/auth/signup/signup_onboarding.dart';
import 'package:doss_resident/view/pages/bottomnav/bottom_nav_bar.dart';
import 'package:doss_resident/view/widgets/loading.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/size_config.dart';
import '../../../utils/spacing.dart';
import '../../widgets/background.dart';
import '../onboarding/onboarding.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      final prefs = await SharedPreferences.getInstance();
      authCont.accessToken.value =
          prefs.getString(LocalDBconstants.accesstoken) ?? "";

      if (authCont.accessToken.value != "" &&
          authCont.accessToken.value.isNotEmpty) {
        await authCont.refreshToken();
        // await authCont.getUserMoreInfoFromBackend();
        Timer.periodic(const Duration(minutes: 2),
            (timer) async => await authCont.refreshToken());
        _navigateToNextScreen();
      } else {
        await Future.delayed(const Duration(seconds: 4));
        Get.off(() => const OnBoardingPage(),
            transition: Transition.rightToLeft);
      }
    });
  }

  Future<void> _navigateToNextScreen() async {
    final prefs = await SharedPreferences.getInstance();
    bool isGoHome = prefs.getBool(LocalDBconstants.isGoHome) ?? false;
    await Future.delayed(const Duration(seconds: 2));
    int selectedPage = await authCont.checkStatus();
    if(isGoHome){
      Get.off(() => const BottomNavPage());
    }
   else{ if(authCont.accessToken.value==''){
        Get.off(() => const OnBoardingPage(),
            transition: Transition.rightToLeft);
   }else{
         Get.off(() => SignUpOnBoardingPage(index: selectedPage),
            transition: Transition.rightToLeft);
   }
    }
    // if (authCont.isEmailCheck.value == true) {
    //   if (isGoHome) {
    //     Get.off(() => const BottomNavPage());
    //   } else {
    //     Get.off(() => const SignUpOnBoardingPage(),
    //         transition: Transition.rightToLeft);
    //   }
    // } else {
    //   // Get.off(() => const SignUpOnBoardingPage(),transition: Transition.rightToLeft);
    //  
    // }
    // print(isEmailCheck.value);

    // Get.off(()=> const AccessPage(),);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Background(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "DossApp",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: SizeConfig.textMultiplier * 7,
                fontWeight: FontWeight.w600,
                letterSpacing: 3,
              ),
            ),
            Spacing.y(2),
            Text(
              "Security and tranquility, always by your side!",
              textAlign: TextAlign.center,
              style: textTheme.bodySmall,
            ).tr(),
              Spacing.y(2),
            LoadingWidget(height: SizeConfig.heightMultiplier*6)
          ],
        ),
      ),
    );
  }
}
