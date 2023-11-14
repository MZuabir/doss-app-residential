import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../constants/icons.dart';
import '../../utils/size_config.dart';
import '../../utils/spacing.dart';

class CustomAppbar extends StatelessWidget {
   const CustomAppbar({super.key, required this.title, this.onTap,  this.isIcon=false,this.icon});

  final String title;
  final VoidCallback? onTap;
  final bool isIcon;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: onTap ?? () => Get.back(),
          child: Icon(Icons.arrow_back,
              size: SizeConfig.imageSizeMultiplier * 6,
          color: AppColors.whiteClr,
          ),
        ),
        const Spacer(),
       Text(title,
            textAlign: TextAlign.center,
            style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600)
           ),
        const Spacer(),
        isIcon?Spacing.x(0):Spacing.x(5),
        isIcon?Image.asset(icon??AppIcons.add,
        height: SizeConfig.imageSizeMultiplier*8,
        width: SizeConfig.imageSizeMultiplier*8,
        ):const SizedBox(),
      ],
    );
  }
}
