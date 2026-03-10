import 'package:flutter/material.dart';
import 'package:islamic/core/utiles/app_assets.dart';
import 'package:islamic/core/utiles/app_colors.dart';
import 'package:islamic/ui/home_screen/tabes/radio/widgets/custom_tabbar.dart';
import 'package:islamic/ui/home_screen/tabes/radio/widgets/radio_detailes_one.dart';
import 'package:islamic/ui/home_screen/tabes/radio/widgets/radio_detailes_two.dart';

class Radioo extends StatefulWidget {
  Radioo({super.key});

  @override
  State<Radioo> createState() => _RadiooState();
}

class _RadiooState extends State<Radioo> {
  bool isClicked = true;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          toolbarHeight: 0,

          backgroundColor: Colors.transparent,
          bottom: TabBar(
            unselectedLabelColor: Colors.red,
              onTap: (int index) {
                isClicked = index == 0;
                setState(() {

                });
              },
              tabs: [
                CustomTabbar(
                  isClicked: isClicked,
                  color1: AppColors.primaryColor,
                  color2:Color(0xff202020) ,
                  text: 'Radio',
                  color3: Colors.black,
                  color4: Colors.white,),
                CustomTabbar(
                  isClicked: isClicked,
                  color1: Color(0xff202020),
                  color2: AppColors.primaryColor,
                  text: 'Reciters',
                  color3: Colors.white,
                  color4: Colors.black,),




              ]),
        ),
        body: TabBarView(children: [
          RadioDetailesOne(),
          RadioDetailesTwo()
        ]),
      ),
    );
  }
}
