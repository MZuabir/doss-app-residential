import 'package:doss_resident/constants/icons.dart';
import 'package:doss_resident/view/widgets/txt_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../utils/size_config.dart';
import '../../utils/spacing.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';


class VerificationBottomSheet extends StatefulWidget {
  final Color? iconColor;
  final Color? textColor;
  final Function()? onTap;
  final String? description;
  final String? btnTitle;
  final String? hintText;
   const VerificationBottomSheet({Key? key, this.iconColor, this.textColor, this.description, this.btnTitle, this.hintText, this.onTap}) : super(key: key);

  @override
  State<VerificationBottomSheet> createState() => _VerificationBottomSheetState();
}

class _VerificationBottomSheetState extends State<VerificationBottomSheet> {
  final msgController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      physics: const FixedExtentScrollPhysics(),
      child: Container(
        color: Colors.black,
        child: Padding(
          padding: EdgeInsets.only(
            left: SizeConfig.widthMultiplier*2.5,
            right: SizeConfig.widthMultiplier*2.5,
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Spacing.y(5),
              CircleAvatar(
                radius: 23,
                backgroundColor: AppColors.darkGryClr,
                child: Image.asset(AppIcons.search,
                  height: SizeConfig.imageSizeMultiplier*7,
                  width: SizeConfig.imageSizeMultiplier*7,
                  color: widget.iconColor??Colors.white,
                ),
              ),
              Spacing.y(3),
              Text(
                "Request Verification",
                style: textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w600,color: widget.textColor??Colors.white),
              ).tr(),
              Spacing.y(3),
              Text(tr(widget.description??"Verification allows you to request an investigation directly from the security guard"),
                style: textTheme.bodySmall,
                textAlign: TextAlign.center,
              ).tr(),
              Spacing.y(4),
              CustomTextField(
                hintText:widget.hintText?? "Ex: Check if I closed the gate",
                title: "Tell John Jones what you want checked.",
                controller:msgController,isTitle:widget.iconColor==null ?true:false,
              ),
              Spacing.y(2),
              CustomButton(title: tr(widget.btnTitle??"Request Verification"),
                onTap: widget.onTap,
              ),
             widget.iconColor==null? Spacing.y(2):const SizedBox(),
              widget.iconColor==null?  CustomTextBtn(title: "Cancel",
                onTap: (){
                Get.back();
                },
              ):const SizedBox(),
              Spacing.y(3),
            ],
          ),
        ),
      ),
    );
  }

}
