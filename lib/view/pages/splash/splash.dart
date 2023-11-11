import 'package:doss/utils/spacing.dart';
import 'package:doss/view/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/size_config.dart';
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
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 4));
    Get.off(()=>const OnBoarding(),);
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
              style:TextStyle(
                color: Colors.white,
                fontSize: SizeConfig.textMultiplier*7,
                fontWeight: FontWeight.w600,
                letterSpacing: 3,
              ),
            ),
            Spacing.y(2),
            Text(
              "Security and tranquility, always by your side!",
              textAlign: TextAlign.center,
              style: textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
