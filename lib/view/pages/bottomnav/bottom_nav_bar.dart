import 'package:doss/view/pages/bottomnav/profile/profile.dart';
import 'package:doss/view/pages/bottomnav/roof/roof.dart';
import 'package:doss/view/pages/bottomnav/verification/verification.dart';
import 'package:doss/view/widgets/background.dart';
import 'package:flutter/material.dart';
import '../../../constants/colors.dart';
import '../../../constants/icons.dart';
import '../../../utils/size_config.dart';
import 'home/home.dart';

class BottomNavPage extends StatefulWidget {
  const BottomNavPage({Key? key}) : super(key: key);

  @override
  State<BottomNavPage> createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  int currentIndex = 0;
  final screens = [
    const HomePage(),
    const RoofPage(),
    const VerificationPage(),
    const ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Background(
        child: IndexedStack(
          index: currentIndex,
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
        currentIndex: currentIndex,
        onTap: (index) => setState(() {
          currentIndex = index;
        }),
        unselectedLabelStyle:
        TextStyle(fontSize: SizeConfig.textMultiplier * 1.5),
        selectedLabelStyle:
        TextStyle(fontSize: SizeConfig.textMultiplier * 1.6),
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(AppIcons.home,
                height: SizeConfig.imageSizeMultiplier * 6,
                color:
                currentIndex == 0 ? AppColors.primaryClr : Colors.white),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(AppIcons.security,
                height: SizeConfig.imageSizeMultiplier * 6,
                color:
                currentIndex == 1 ? AppColors.primaryClr : Colors.white),
            label: 'Security',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(AppIcons.search,
                height: SizeConfig.imageSizeMultiplier * 6,
                color:
                currentIndex == 2 ? AppColors.primaryClr : Colors.white),
            label: 'search',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(AppIcons.profile,
                height: SizeConfig.imageSizeMultiplier * 6,
                color:
                currentIndex == 3 ? AppColors.primaryClr : Colors.white),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
