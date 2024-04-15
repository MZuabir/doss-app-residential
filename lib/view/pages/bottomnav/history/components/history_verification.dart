import 'package:flutter/material.dart';

import 'history_custom_tile.dart';


class HistoryVerificationPage extends StatelessWidget {
  const HistoryVerificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            ...List.generate(2, (index) => const HistoryCustomTile()),
          ],
        ),
      ),
    );
  }
}
