import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants/colors.dart';
import '../../../../../controllers/home.dart';
import '../../../../../utils/size_config.dart';
import '../../../../../utils/spacing.dart';


class StatusTile extends StatefulWidget {

   const StatusTile({Key? key}) : super(key: key);

  @override
  State<StatusTile> createState() => _StatusTileState();
}

class _StatusTileState extends State<StatusTile> {
  final cont=Get.put(HomeCont());

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: SizeConfig.heightMultiplier*8.5,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.darkGryClr,
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(
            horizontal: SizeConfig.widthMultiplier*5.0,
            vertical: SizeConfig.heightMultiplier*2),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 17,
              child: CircleAvatar(
                radius: 16,
                backgroundColor: AppColors.darkGryClr,
                backgroundImage: const NetworkImage("https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
              ),
            ),
            Spacing.x(3),
            Obx(
              ()=> Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("John Jones)!",
                    style: textTheme.bodyMedium,
                  ),
                  Spacing.y(0.1),
                  Text(
                    cont.isSwitched.value?"online":"offline",
                    style: textTheme.bodySmall,
                  ).tr(),
                ],
              ),
            ),
            const Spacer(),
            Transform.scale(
              scaleX: 0.8,
              scaleY: 0.8,
              child: Obx(
                ()=> CupertinoSwitch(
                  trackColor: Colors.grey,
                  activeColor: AppColors.primaryClr,
                  thumbColor: AppColors.whiteClr,
                  value: cont.isSwitched.value,
                  onChanged: (bool value) { cont.isSwitched.value = value; },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
