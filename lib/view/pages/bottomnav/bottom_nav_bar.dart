import 'package:doss_resident/controllers/bottomNav.dart';
import 'package:doss_resident/view/pages/bottomnav/profile/profile.dart';
import 'package:doss_resident/view/pages/bottomnav/roof/roof.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/colors.dart';
import '../../../constants/icons.dart';
import '../../../utils/size_config.dart';
import '../../widgets/background.dart';
import 'history/history.dart';
import 'home/home.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({Key? key}) : super(key: key);

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  final cont=Get.put(BottomNavCont());
  final screens = [
    const HomePage(),
    const RoofPage(),
    NotificationScreen(),
    const ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {

    return Obx(
      ()=> Scaffold(
        body: Background(
          child: IndexedStack(
            index: cont.currentIndex.value,
            children: screens,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.darkGryClr,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 10,
          selectedItemColor: AppColors.primaryClr,
          unselectedItemColor: Colors.white,
          currentIndex: cont.currentIndex.value,
          onTap: (index) =>
          cont.currentIndex.value = index,

          unselectedLabelStyle:
          TextStyle(fontSize: SizeConfig.textMultiplier * 1.5),
          selectedLabelStyle:
          TextStyle(fontSize: SizeConfig.textMultiplier * 1.6),
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(AppIcons.home,
                  height: SizeConfig.imageSizeMultiplier * 6,
                  color:
                  cont.currentIndex.value == 0 ? AppColors.primaryClr : Colors.white),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(AppIcons.security,
                  height: SizeConfig.imageSizeMultiplier * 6,
                  color:
                  cont.currentIndex.value == 1 ? AppColors.primaryClr : Colors.white),
              label: 'Security',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(AppIcons.refresh,
                  height: SizeConfig.imageSizeMultiplier * 6,
                  color:
                  cont.currentIndex.value == 2 ? AppColors.primaryClr : Colors.white),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Image.asset(AppIcons.profile,
                  height: SizeConfig.imageSizeMultiplier * 6,
                  color:
                  cont.currentIndex.value == 3 ? AppColors.primaryClr : Colors.white),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
