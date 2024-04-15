import 'package:doss_resident/constants/cont.dart';
import 'package:doss_resident/view/widgets/loading.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import '../../../constants/colors.dart';
import '../../../constants/icons.dart';
import '../../../utils/size_config.dart';
import '../../../utils/spacing.dart';
import '../../widgets/background.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/lang_btn.dart';
import '../../widgets/txt_button.dart';

class AccessPage extends StatefulWidget {
  const AccessPage({Key? key}) : super(key: key);

  @override
  State<AccessPage> createState() => _AccessPageState();
}

class _AccessPageState extends State<AccessPage> {
  List<String> icon = [
    AppIcons.faceBook,
    AppIcons.google,
    AppIcons.apple,
  ];
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Obx(
      () => ShowLoading(
        inAsyncCall: authCont.isLoading.value,
        child: Scaffold(
          body: Background(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.widthMultiplier * 2.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Spacing.y(7),
                  Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.only(
                            right: SizeConfig.widthMultiplier * 5),
                        child: const SelectLangButton(),
                      )),
                  Spacing.y(18),
                  Text(
                    "Welcome to)!",
                    textAlign: TextAlign.center,
                    style: textTheme.bodyLarge,
                  ).tr(),
                  Spacing.y(1),
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
                  Spacing.y(9),
                  CustomButton(
                      title: "To enter", onTap: () => authCont.authorization()),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Forgot password?",
                        textAlign: TextAlign.center,
                        style: textTheme.bodyMedium,
                      ).tr(),
                      const CustomTextBtn(title: "Retrieve here"),
                    ],
                  ),
                  Spacing.y(4),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
