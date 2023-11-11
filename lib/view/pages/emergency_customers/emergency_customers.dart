import 'package:flutter/material.dart';

import 'components/customer_custom_tile.dart';


class EmergencyCustomersPage extends StatelessWidget {
  const EmergencyCustomersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            ...List.generate(
                23, (index) => const EmergencyCustomersCustomTile()
            ),
          ],
        ),
      ),
    );
  }
}





