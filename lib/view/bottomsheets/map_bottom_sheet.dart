// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../constants/colors.dart';
// import '../../utils/size_config.dart';
// import '../../utils/spacing.dart';
//
// class CustomMapBottomSheet extends StatelessWidget {
//   final String icon;
//   final String btnTitle;
//   final String title;
//   final Function()? onTap;
//   const CustomMapBottomSheet(
//       {super.key,
//       required this.icon,
//       this.onTap,
//       required this.btnTitle,
//       required this.title});
//
//   @override
//   Widget build(BuildContext context) {
//     final textTheme = Theme.of(context).textTheme;
//     return Container(
//       height: SizeConfig.heightMultiplier * 95,
//       color: AppColors.greyLightClr,
//       child: Column(
//         children: [
//           Spacing.y(2),
//           Expanded(
//             child: SingleChildScrollView(
//               physics: const BouncingScrollPhysics(),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Spacing.y(2),
//                   Container(
//                     height: SizeConfig.heightMultiplier * 9,
//                     width: SizeConfig.widthMultiplier * 100,
//                     color: AppColors.darkGryClr.withOpacity(0.5),
//                     padding: EdgeInsets.symmetric(
//                         horizontal: SizeConfig.widthMultiplier * 2.3),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Text(
//                           "John is on his way",
//                           style: textTheme.bodySmall,
//                         ),
//                         CustomMapButton(
//                           title: "Retrun To Map",
//                           onTap: () {
//                             Get.back();
//                           },
//                         )
//                       ],
//                     ),
//                   ),
//                   Spacing.y(2.5),
//                   const ClientDataCard(),
//                   Spacing.y(2.5),
//                   const ArrivalCard(),
//                   Spacing.y(2.5),
//                   const MaidCard(),
//                   Spacing.y(3),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
