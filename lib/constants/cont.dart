import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart';
import '../controllers/auth.dart';

final authCont=Get.find<AuthCont>();

final numberFormat=NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');