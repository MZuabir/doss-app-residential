
import 'package:doss_resident/utils/size_config.dart';
import 'package:doss_resident/view/pages/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            return GetMaterialApp(
              theme: ThemeData(
                textTheme: TextTheme(
                  labelSmall: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: SizeConfig.textMultiplier * 1.2),
                  bodyLarge: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: SizeConfig.textMultiplier * 2.1),
                  bodyMedium: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: SizeConfig.textMultiplier * 1.8),
                  bodySmall: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: SizeConfig.textMultiplier * 1.5),
                  displaySmall: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: SizeConfig.textMultiplier * 1.2),
                  headlineLarge: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: SizeConfig.textMultiplier * 3.4),
                  headlineMedium: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: SizeConfig.textMultiplier * 3),
                  headlineSmall: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: SizeConfig.textMultiplier * 2.2),
                ),
                fontFamily: 'Urbanist',
                scaffoldBackgroundColor: Colors.black,
              ),
              debugShowCheckedModeBanner: false,
              home: const SplashPage(),
            );
          },
        );
      },
    );
  }
}
