import 'package:doss_resident/constants/colors.dart';
import 'package:doss_resident/constants/icons.dart';
import 'package:doss_resident/utils/size_config.dart';
import 'package:doss_resident/utils/spacing.dart';
import 'package:doss_resident/view/widgets/background.dart';
import 'package:doss_resident/view/widgets/custom_appbar.dart';
import 'package:doss_resident/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import 'components/custom_relative_btn.dart';
import 'components/invitation_tile.dart';


class RelativesPage extends StatelessWidget {
   RelativesPage({Key? key}) : super(key: key);
  bool isEmpty=false;

  @override
  Widget build(BuildContext context) {
    final textTheme=Theme.of(context).textTheme;
    return Scaffold(
      body: Background(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier*2.5),
          child: Column(
            children: [
              Spacing.y(7),
              CustomAppbar(title: "Relatives",
              isIcon: true,
                icon: AppIcons.add,
              ),
              Spacing.y(4),
              isEmpty?Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("There are no family members registered yet",
                      style: textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                    Spacing.y(3),
                    CustomRelativeButton(title: 'Invite Family',
                    onTap: (){

                    },
                    ),
                    Spacing.y(15),
                  ],
                ),
              ):  Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      ...List.generate(3, (index) =>const InvitationTile()),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
