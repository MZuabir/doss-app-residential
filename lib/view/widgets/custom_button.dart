import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../utils/size_config.dart';

class CustomButton extends StatelessWidget {
   CustomButton({
    Key? key,
    required this.title,
    required this.onTap,  this.isEnabled=true,  this.height,
  }) : super(key: key);
  final Function()? onTap;
  final bool isEnabled;
  final String title;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height??SizeConfig.heightMultiplier*6,
        width: SizeConfig.widthMultiplier*100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color:isEnabled? AppColors.primaryClr:Colors.grey,
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: height==null?SizeConfig.textMultiplier * 2.2:SizeConfig.textMultiplier * 1.6,
            ),
          ),
        ),
      ),
    );
  }
}
