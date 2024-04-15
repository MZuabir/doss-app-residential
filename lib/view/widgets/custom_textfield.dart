import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../utils/size_config.dart';
import '../../utils/spacing.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.keyboardType, this.onValidate,
    this.onChange,  this.title, this.isTitle=true,
  });
  final String hintText;
  final String? title;
  final TextEditingController controller;
  final bool isTitle;
  final TextInputType? keyboardType;
  final String? Function(String?)? onValidate;
  final String? Function(String?)? onChange;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.isTitle? Text(
          widget.title??"",
          style: textTheme.bodySmall,
        ).tr():const SizedBox(),
        widget.isTitle?Spacing.y(1):const SizedBox(),
        Padding(
          padding: EdgeInsets.only(bottom: SizeConfig.heightMultiplier * 3),
          child: TextFormField(
            maxLines: 1,
            validator: widget.onValidate,
            controller: widget.controller,
            cursorColor: AppColors.primaryClr,
            onChanged: widget.onChange,
            keyboardType: widget.keyboardType,
            decoration: InputDecoration(
              isCollapsed: true,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.zero),
              ),
              fillColor: AppColors.fieldClr,
              filled: true,
              contentPadding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.widthMultiplier * 3,
                  vertical: SizeConfig.heightMultiplier * 4),
              hintText: tr(widget.hintText),
              hintStyle: textTheme.bodyLarge!.copyWith(color: Colors.black45,fontWeight: FontWeight.w500),
            ),
            style: textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500,color: Colors.black),
          ),
        ),
      ],
    );
  }
}
