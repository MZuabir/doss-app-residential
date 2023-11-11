import 'package:flutter/material.dart';

import '../components/customers_expansion_tile.dart';


class CustomerAllPage extends StatelessWidget {
  const CustomerAllPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            CustomersExpansionTile(),
          ],
        ),
      ),
    );
  }
}
