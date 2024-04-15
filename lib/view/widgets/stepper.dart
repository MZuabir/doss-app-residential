import 'package:doss_resident/constants/colors.dart';
import 'package:doss_resident/constants/icons.dart';
import 'package:doss_resident/utils/size_config.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../utils/spacing.dart';

class CustomStepper extends StatelessWidget {
  final int index;
  final int itemCount;
  final String title;
  final String? subTitle;
  final String icon;

  const CustomStepper({super.key, required this.index, required this.itemCount, required this.title,  this.subTitle, required this.icon});

  @override
  Widget build(BuildContext context) {
    final textTheme=Theme.of(context).textTheme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: AppColors.tileClr, // Replace with your desired color
              child: Image.asset(
               icon,
                color:  index!=3?Colors.green:Colors.white,
                height: SizeConfig.imageSizeMultiplier*7,
                width: SizeConfig.imageSizeMultiplier*7,
              ),
            ),
            if (index < itemCount - 1) // Exclude CustomPaint for the last item
              Column(
                children: [
                  Spacing.y(0.3),
                  SizedBox(
                    width: SizeConfig.widthMultiplier*0.1,
                    height: SizeConfig.widthMultiplier*8,
                    child: CustomPaint(
                      painter: DottedLinePainter(),
                    ),
                  ),
                  Spacing.y(0.3),
                ],
              ),
          ],
        ),
        Spacing.x(8),
        SizedBox(
          height: SizeConfig.heightMultiplier*5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style:index==3? textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600):
              textTheme.bodyMedium,
              ).tr(),
             subTitle!=null? Spacing.y(0.2):SizedBox(),
             subTitle!=null? Text(subTitle??"", style: textTheme.bodySmall).tr():SizedBox(),
            ],
          ),
        ),
      ],
    );
  }
}

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.grey // Color of the dotted line
      ..strokeWidth = 1 // Width of the dotted line
      ..strokeCap = StrokeCap.round;

    double dotRadius = 1;
    double dotSpace = 2;

    double centerX = size.width / 2;
    double startY = 0;

    while (startY < size.height) {
      canvas.drawCircle(Offset(centerX, startY), dotRadius, paint);
      startY += dotRadius * 2 + dotSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

