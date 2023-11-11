import 'package:doss/constants/colors.dart';
import 'package:doss/constants/icons.dart';
import 'package:doss/utils/size_config.dart';
import 'package:doss/view/widgets/background.dart';
import 'package:doss/view/widgets/custom_button.dart';
import 'package:doss/view/widgets/txt_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../../utils/spacing.dart';
import '../auth/signin/signin.dart';


class AccessPage extends StatefulWidget {
  const AccessPage({Key? key}) : super(key: key);

  @override
  State<AccessPage> createState() => _AccessPageState();
}

class _AccessPageState extends State<AccessPage> {
  List<String> icon=[
    AppIcons.faceBook,
    AppIcons.google,
    AppIcons.apple,
  ];
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return  Scaffold(
      body: Background(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal:SizeConfig.widthMultiplier*2.5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Welcome to)!",
                textAlign: TextAlign.center,
                style: textTheme.bodyLarge,
              ),
              Spacing.y(1),
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
              Spacing.y(9),
              CustomButton(
                  title: "To enter",
                  onTap: (){
                    Get.to(
                        ()=>const SignInPage(),
                      transition: Transition.rightToLeft,
                    );
                  }
              ),
              Spacing.y(3),
              Text("or enter with",
              style: textTheme.bodyLarge,
              ),
              Spacing.y(4),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 ...List.generate(3, (index) =>Padding(
                   padding:EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier*2.5),
                   child: CircleAvatar(
                     radius: 22,
                     backgroundColor: AppColors.whiteClr,
                     child: Image.asset(icon[index],
                       height: SizeConfig.imageSizeMultiplier*9,
                       width: SizeConfig.imageSizeMultiplier*9,
                     ),
                   ),
                 ) )
               ],
             ),
              Spacing.y(4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    textAlign: TextAlign.center,
                    style: textTheme.bodyMedium,
                  ),
                  const CustomTextBtn(title: "Register"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Forgot password?",
                    textAlign: TextAlign.center,
                    style: textTheme.bodyMedium,
                  ),
                  const CustomTextBtn(title: "Retrieve here"),
                ],
              ),
              Spacing.y(4),
            ],
          ),
        ),
      ),
    );
  }
}
