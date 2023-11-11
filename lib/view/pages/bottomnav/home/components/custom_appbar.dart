import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/icons.dart';
import '../../../../../utils/size_config.dart';
import '../../../../../utils/spacing.dart';


class CustomHomeAppbar extends StatelessWidget {
  const CustomHomeAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Welcome to)!",
              style: textTheme.headlineSmall,
            ),
            Spacing.y(0.5),
            Text("Ago, 06, 2023!",
              style: textTheme.bodySmall,
            ),
          ],
        ),
        const Spacer(),
        CircleAvatar(
          radius: 18,
          backgroundColor: AppColors.darkGryClr,
          child: Image.asset(AppIcons.notification,
            height: SizeConfig.imageSizeMultiplier*6,
            width: SizeConfig.imageSizeMultiplier*6,
          ),
        ),
        Spacing.x(4),
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 21,
          child: CircleAvatar(
            radius: 20,
            backgroundColor: AppColors.darkGryClr,
            backgroundImage: const NetworkImage("https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
          ),
        ),
      ],
    );
  }
}
