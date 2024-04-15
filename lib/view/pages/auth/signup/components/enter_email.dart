import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../constants/colors.dart';
import '../../../../../constants/icons.dart';
import '../../../../../controllers/sign_up.dart';
import '../../../../../utils/size_config.dart';
import '../../../../../utils/spacing.dart';
import '../../../../widgets/auth_textfield.dart';
import '../../../../widgets/custom_button.dart';

class EnterEmailPage extends StatefulWidget {
  final Function()? onTap;
  EnterEmailPage({Key? key, this.onTap}) : super(key: key);

  @override
  State<EnterEmailPage> createState() => _EnterEmailPageState();
}

class _EnterEmailPageState extends State<EnterEmailPage> {
  final cont = Get.put(SignUpCont());
  List<String> icon = [
    AppIcons.faceBook,
    AppIcons.google,
    AppIcons.apple,
  ];

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Enter your email",
            style: textTheme.headlineMedium,
          ).tr(),
          Spacing.y(3),
          AuthTextField(
            title: "Email",
            hintText: "Enter Email",
            controller: cont.emailController,
          ),
          Spacing.y(3),
          CustomCheckbox(
            title: "I agree to the",
            value: cont.termsAndPolicies.value,
            onChanged: (bool? value) {
              cont.termsAndPolicies.value = value!;
              cont.updateButtonState();
            },
            btnTitle: 'Terms of Use and Privacy Policies',
            onTap: () {
              // Get.to(()=>const TermAndConditionsPage(),
              // transition: Transition.downToUp,
              // );
            },
          ),
          CustomCheckbox(
            title: "I confirm that I am at least 12 years old",
            value: cont.age.value,
            onChanged: (bool? value) {
              cont.age.value = value!;
              cont.updateButtonState();
            },
          ),
          Spacing.y(5),
          CustomButton(
            title: "Next",
            onTap: widget.onTap,
            isEnabled: cont.isEnabled.value,
          ),
          Spacing.y(2),
        ],
      ),
    );
  }
}

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?>? onChanged;
  final String title;
  final String? btnTitle;
  final Function()? onTap;

  const CustomCheckbox(
      {Key? key,
      required this.value,
      required this.onChanged,
      required this.title,
      this.btnTitle,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        Container(
          color: Colors.grey,
          height: SizeConfig.heightMultiplier * 2.4,
          width: SizeConfig.heightMultiplier * 2.4,
          child: Checkbox(
            value: value,
            side: const BorderSide(
              width: 0,
              color: Colors.grey,
            ),
            checkColor: AppColors.whiteClr,
            activeColor: AppColors.primaryClr,
            onChanged: onChanged,
          ),
        ),
        Spacing.x(2),
        Text(
          tr(title),
          style: textTheme.bodySmall,
        ),
        btnTitle == null
            ? const SizedBox()
            : TextButton(
                onPressed: onTap,
                child: SizedBox(
                  width: SizeConfig.widthMultiplier * 60,
                  child: Text(
                    tr(btnTitle ?? ""),
                    style: textTheme.bodySmall!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
              )
      ],
    );
  }
}
