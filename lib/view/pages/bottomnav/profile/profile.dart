import 'package:doss/utils/size_config.dart';
import 'package:doss/utils/spacing.dart';
import 'package:doss/view/widgets/background.dart';
import 'package:flutter/material.dart';
import '../../../../constants/colors.dart';
import 'components/profile_card.dart';
import 'components/profile_tile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<String> cardTitles=[
    "Customers",
    "Vehicles",
    "History",
  ];
  List<String> tileTitles=[
    "Account",
    "Privacy and Accessibility",
    "Rate app",
    "Report a problem in the app",
    "Help",
  ];
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Background(child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier*2.5),
        child: Column(
          children: [
            Spacing.y(7),
            Text("Profile",
                textAlign: TextAlign.center,
                style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600)
            ),
            Spacing.y(4),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Spacing.y(3),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30,
                      child: CircleAvatar(
                        radius: 29,
                        backgroundColor: AppColors.darkGryClr,
                        backgroundImage: const NetworkImage("https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                      ),
                    ),
                    Spacing.y(3),
                    Text("John Jones",
                        textAlign: TextAlign.center,
                        style: textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w500),
                    ),
                    Spacing.y(5),
                    SizedBox(
                      height: SizeConfig.heightMultiplier*13,
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: cardTitles.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ProfileCard(
                            title: cardTitles[index],
                          );
                        },
                      ),
                    ),
                    Spacing.y(2.5),
                   ...List.generate(tileTitles.length, (index) =>   ProfileTile(
                     title: tileTitles[index],
                     onTap: (){

                     },
                   )),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
