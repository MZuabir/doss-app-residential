import 'package:doss_resident/controllers/home.dart';
import 'package:doss_resident/controllers/verification.dart';
import 'package:get/get.dart';

import '../controllers/auth.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthCont>(() => AuthCont());
    Get.lazyPut<HomeCont>(() => HomeCont());
    Get.lazyPut<VerificationCont>(() => VerificationCont());
  }
}
