import 'package:doss/constants/colors.dart';
import 'package:doss/utils/size_config.dart';
import 'package:doss/utils/spacing.dart';
import 'package:doss/view/widgets/background.dart';
import 'package:flutter/material.dart';

import 'components/verification_card.dart';


class VerificationPage extends StatelessWidget {
  const VerificationPage({Key? key}) : super(key: key);
  final bool isNoRecord=false;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Background(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier*2.5),
          child: Column(
            children: [
              Spacing.y(7),
              Text("Verification",
                  textAlign: TextAlign.center,
                  style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600)
              ),
              isNoRecord?Spacing.y(37): Spacing.y(4),
              isNoRecord?Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      "There are no new verification requests at this time",
                  style: textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),
                  ),
                  Spacing.y(2),
                  Container(
                    height: SizeConfig.heightMultiplier*6,
                    width: SizeConfig.widthMultiplier*50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppColors.primaryClr,
                    ),
                    child: Center(child: Text("View History",style: textTheme.headlineSmall,)),
                  )
                ],
              ):
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                    children: [
                      ...List.generate(4, (index) =>const VerificationCard(

                      )),
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
