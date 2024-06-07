import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../utils/size_config.dart';
import '../../../utils/spacing.dart';
import '../../widgets/background.dart';
import '../../widgets/custom_appbar.dart';
import 'components/customer_custom_tile.dart';
import 'components/usefull_custom_tile.dart';



class EmergencyPage extends StatelessWidget {

   const EmergencyPage({super.key});
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    List<String> statusTitle = [
      "Useful contacts",
      "Customers",
    ];
    return Scaffold(
        body: Background(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier*2.5),
            child: Column(
              children: [
                Spacing.y(7),
                const CustomAppbar(title: "Emergency"),
                Spacing.y(4),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Your watchman",
                        style: textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),
                        ).tr(),
                        Spacing.y(3),
                        ...List.generate(
                            1, (index) => const WatchManCustomTile()
                        ),
                        Spacing.y(1),
                        Text("Useful contacts",
                          style: textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),
                        ).tr(),
                        Spacing.y(3),
                        ...List.generate(
                            3, (index) => const UseFullContactCustomTile()
                        ),
                      ],
                    ),
                  ),
                )

              ],
            ),
          ),
        ),
      );
  }
}
