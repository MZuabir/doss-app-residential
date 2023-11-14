import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../utils/size_config.dart';
import '../../utils/spacing.dart';

class AuthTextField extends StatefulWidget {
  const AuthTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
    this.keyboardType, this.onValidate,
    this.onChange,  this.title, this.isTitle=true,
  });
  final String hintText;
  final String? title;
  final TextEditingController controller;
  final bool isPassword;
  final bool isTitle;
  final TextInputType? keyboardType;
  final String? Function(String?)? onValidate;
  final String? Function(String?)? onChange;
  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       widget.isTitle? Text(
            widget.title??"",
        style: textTheme.bodyLarge,
        ):const SizedBox(),
        widget.isTitle?Spacing.y(1):const SizedBox(),
        Padding(
          padding: EdgeInsets.only(bottom: SizeConfig.heightMultiplier * 3),
          child: TextFormField(
            validator: widget.onValidate,
            controller: widget.controller,
            cursorColor: AppColors.primaryClr,
            onChanged: widget.onChange,
            keyboardType: widget.keyboardType,
            obscureText: widget.isPassword ? isObscure : false,
            decoration: InputDecoration(
              isCollapsed: true,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.zero),
              ),

              suffixIcon: widget.isPassword
                  ? GestureDetector(
                      onTap: () => setState(() {
                            isObscure = !isObscure;
                          }),
                      child: Icon(
                        isObscure ? Icons.remove_red_eye_outlined : CupertinoIcons.eye_slash,
                        size: SizeConfig.imageSizeMultiplier * 4.5,
                        color: Colors.black,
                      ))
                  : null,
              fillColor: AppColors.fieldClr,
              filled: true,
              contentPadding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.widthMultiplier * 3,
                  vertical: SizeConfig.heightMultiplier * 2),
              hintText: widget.hintText,
              hintStyle: textTheme.bodyLarge!.copyWith(color: Colors.black45,fontWeight: FontWeight.w500),
            ),
            style: textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500,color: Colors.black),
          ),
        ),
      ],
    );
  }
}
