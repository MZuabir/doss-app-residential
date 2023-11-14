
import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class CustomSnackBar extends StatelessWidget {
  final String? title;

  const CustomSnackBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.primaryClr,
      ),
      child: Center(
        child: Text(
          title ?? "", // Use title here; if null, display an empty string
          style: textTheme.bodyLarge,
        ),
      ),
    );
  }
}