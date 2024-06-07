import 'package:doss_resident/constants/cont.dart';
import 'package:doss_resident/controllers/bottomNav.dart';
import 'package:doss_resident/view/bottomsheets/custom_btm_sheet.dart';
import 'package:doss_resident/view/pages/vehicles/vehicles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../models/on_boarding.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/icons.dart';
import '../../../../utils/size_config.dart';
import '../../../../utils/spacing.dart';
import '../../../bottomsheets/verification_bottom_sheet.dart';
import '../../car/car.dart';
import '../../emergency/emergency.dart';
import '../../relatives/relatives.dart';
import 'components/custom_appbar.dart';
import 'components/custom_button.dart';
import 'components/grid_card.dart';
import 'components/status_tile.dart';
import 'components/verification_card.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cont=Get.find<BottomNavCont>();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier*2.5),
      child: Column(
        children: [
          Spacing.y(7),
          const CustomHomeAppbar(),
          Spacing.y(4),
          const StatusTile(),
          Spacing.y(3),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    cont.currentIndex.value=1;
                  },
                  child: VerificationCard(
                    color: AppColors.greyLightClr,
                    icon: AppIcons.search,
                    title: "Request Roof",
                  ),
                ),
              ),
              Spacing.x(4),
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    _showReqVerificationBottomSheet(context);
                  },
                  child: VerificationCard(
                    color: AppColors.primaryClr,
                    icon: AppIcons.security,
                    title: "Request Verification",
                  ),
                ),
              ),
            ],
          ),
          Spacing.y(3),
          Container(
            height: SizeConfig.heightMultiplier*10,
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
                      SizedBox(
                        width: SizeConfig.widthMultiplier*30,
                        child: Text("In need of more urgent help?",
                          textAlign: TextAlign.start,
                          style: textTheme.bodySmall,
                        ).tr(),
                      ),
                  const Spacer(),
                   HomeButton(
                    onTap: (){
                      Get.to(()=>const EmergencyPage(),
                      transition: Transition.rightToLeft,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Column(
        children: List.generate(
          2,
              (rowIndex) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              3,
                  (colIndex) {
                    int index = rowIndex * 3 + colIndex;
                return Padding(
                  padding:EdgeInsets.symmetric(vertical: SizeConfig.heightMultiplier*3),
                  child: GestureDetector(
                    onTap: (){
                      var currentIndex=index;
                      if(currentIndex==1){
                        _showBottomSheet(context);
                      }
                      if(currentIndex==2){
                        Get.to(()=> RelativesPage(),
                          transition: Transition.rightToLeft,
                        );
                      }
                      if(currentIndex==0){
                        cont.currentIndex.value=3;
                      }
                      if(currentIndex==4){
                        cont.currentIndex.value=2;
                      }
                    },
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal:SizeConfig.widthMultiplier*5),
                      child: GridCard(
                        title: homeGridData[index].title,
                        icon: homeGridData[index].icon,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
        ],
      ),
    );
  }
  void _showBottomSheet(BuildContext context) {
   if(!authCont.residentialInfo!.value!.homePlaces!.first.registeredVehicle!){
     showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return   CustomBottomSheet(
          icon: AppIcons.car,
          onTap: (){
            Get.back();
            Get.to(()=>const VehiclesPage(),
              transition: Transition.rightToLeft,
            );
          },
          btnTitle: 'Add Vehicle',
          title: 'Welcome to DossApp!',
          description: 'Your registration is complete and your plan is active, but you still need to add information about your vehicle.',
          textBtnTitle: 'I will do that later',
        ); // Use the separate BottomSheet widget
      },
    );
   }else{
      Get.to(()=>const VehiclesPage(),
              transition: Transition.rightToLeft,
            );
   }
  }
  void _showReqVerificationBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return   VerificationBottomSheet(
          onTap: (){
            Get.back();
            _showCanVerificationBottomSheet(context);
          },
        ); // Use the separate BottomSheet widget
      },
    );
  }
  void _showCanVerificationBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return    VerificationBottomSheet(
          onTap: (){
            Get.back();
          },
          iconColor: AppColors.primaryClr,
          textColor: AppColors.primaryClr,
          description: "Wait for John Jones to accept the verification.",
          btnTitle: "Cancel Verification",
          hintText: "Good morning, John! Could you check if I locked the gate correctly?",
        ); // Use the separate BottomSheet widget
      },
    );
  }
}
