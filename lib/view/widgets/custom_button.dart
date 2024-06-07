import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../utils/size_config.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.title,
    this.isLoading = false,
    required this.onTap,
    this.isEnabled = true,
    this.height,
  }) : super(key: key);
  final Function()? onTap;
  final bool isEnabled;
  final String title;
  final double? height;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? SizeConfig.heightMultiplier * 6,
        width: SizeConfig.widthMultiplier * 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: isEnabled ? AppColors.primaryClr : Colors.grey,
        ),
        child: isLoading
            ? Center(
                child: SizedBox(
                    height: 25,
                    width: 25,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.5,
                      color: AppColors.textClr)),
              )
            : Center(
                child: Text(
                  tr(title),
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: height == null
                        ? SizeConfig.textMultiplier * 2.2
                        : SizeConfig.textMultiplier * 1.6,
                  ),
                ),
              ),
      ),
    );
  }
}
