import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../utils/spacing.dart';


class CustomDropdown extends StatelessWidget {
  final String? selectedValue;
  final String title;
  final String hint;
  final List<String> items;
  final ValueChanged<String?>? onChanged;

  const CustomDropdown({super.key,
    required this.selectedValue,
    required this.items,
    required this.onChanged,
    required this.title, required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
          style: textTheme.bodyLarge,
        ),
        Spacing.y(1),
        Center(
          child: Container(
            height: 50,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            color: AppColors.fieldClr,
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                isExpanded: true,
                hint: Text(hint,), // Not necessary for Option 1
                value: selectedValue,
                onChanged: onChanged,
                items: items.map((location) {
                  return DropdownMenuItem(
                    value: location,
                    child: Text(location,
                      style: textTheme.bodyLarge!.copyWith(color: Colors.black),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}