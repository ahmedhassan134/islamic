import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamic/core/utiles/app_assets.dart';
import 'package:islamic/core/utiles/app_colors.dart';
import 'package:islamic/ui/home_screen/tabes/hadeeth/hadeeth.dart';
import 'package:islamic/ui/home_screen/tabes/quran/quran.dart';
import 'package:islamic/ui/home_screen/tabes/radio/radio.dart';
import 'package:islamic/ui/home_screen/tabes/sebha/sebha.dart';
import 'package:islamic/ui/home_screen/tabes/time/time.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
List<String>backgroundImage=[
  AppAssets.quran_bg,
  AppAssets.hadith_bg,
  AppAssets.sebha_bg,
  AppAssets.radio_bg,
  AppAssets.more_bg,
];
List<Widget> selectedPage=[
  
  Quran(),
  Hadeeth(),
  Sebha(),
  Radioo(),
  Time()
];

class _HomeScreenState extends State<HomeScreen> {
  int cIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          backgroundImage[cIndex],
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          backgroundColor: Colors.black.withAlpha(90),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              Image.asset(AppAssets.islami,height: 171,),
              Expanded(child: selectedPage[cIndex]),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cIndex,
            backgroundColor: AppColors.primaryColor,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.whiteColor,
            unselectedItemColor: AppColors.blackyColor,
            onTap: (index) {
              cIndex = index;
              setState(() {});
            },

            items: [
              customItem(index: 0, icon: AppAssets.quranBg, label: "quran"),
              customItem(index: 1, icon: AppAssets.hadith, label: "hadith"),
              customItem(index: 2, icon: "assets/images/seb_image.png", label: "sebha"),
              customItem(index: 3, icon: AppAssets.radio, label: "radio"),
              customItem(index: 4, icon: AppAssets.vector, label: "counter"),
            ],
          ),
        ),
      ],
    );
  }

  BottomNavigationBarItem customItem({
    required String icon,
    required int index,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: bottomIcon(icon: icon, index: index),
      label: label,
    );
  }

  Widget bottomIcon({required int index, required String icon}) {
    return cIndex == index
        ? Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: AppColors.blackyColor,
              borderRadius: BorderRadius.circular(66),
            ),
            child: ImageIcon(AssetImage(icon)),
          )
        : ImageIcon(AssetImage(icon));
  }
}
