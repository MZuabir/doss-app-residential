import 'package:flutter/material.dart';
import 'components/usefull_custom_tile.dart';

class UseFullContactsPage extends StatelessWidget {
  const UseFullContactsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            ...List.generate(
                23, (index) => const UseFullContactCustomTile()
            ),
          ],
        ),
      ),
    );
  }
}


