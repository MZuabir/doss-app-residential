import 'package:flutter/material.dart';

import '../../../../../utils/spacing.dart';
import '../components/history_custom_tile.dart';


class HistoryRoofPage extends StatelessWidget {
  const HistoryRoofPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            ...List.generate(3, (index) => const HistoryCustomTile()),
          ],
        ),
      ),
    );
  }
}
