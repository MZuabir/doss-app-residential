import 'dart:developer';
import 'package:doss_resident/utils/size_config.dart';
import 'package:doss_resident/view/pages/splash/splash.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:permission_handler/permission_handler.dart';
import 'bindings/bindings.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  await FirebaseMessaging.instance.requestPermission();
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  //////print("Handling a background message: ${message.messageId}");
}
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Permission.notification.request();
  final fcm=await FirebaseMessaging.instance.getToken();
  log(fcm.toString());
  
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    startLocale: kDebugMode?const Locale('en','US'):const Locale('pt','BR'),
      supportedLocales: const[ Locale('en', 'US'),  Locale('pt', 'BR')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      child: const MyApp()),);
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
              initialBinding: AuthBindings(),
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
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
