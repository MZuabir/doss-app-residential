import 'package:flutter/material.dart';

import '../components/customers_expansion_tile.dart';


class CanceledPage extends StatelessWidget {
  const CanceledPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            CustomersExpansionTile(
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
