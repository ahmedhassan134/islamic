import 'package:flutter/material.dart';

import '../../../../../core/utiles/app_colors.dart';

class CustomTabbar extends StatelessWidget {
  CustomTabbar({
    super.key,

    required this.isClicked,
    required this.color1,
    required this.color2,
    required this.text,
    required this.color3,
    required this.color4
  });


  bool isClicked;
  Color color1;
  Color color2;
  Color color3;
  Color color4;
  String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 40,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: isClicked ? color1 : color2,
      ),
      child: Text(text, textAlign: TextAlign.center,style: TextStyle(color: isClicked?color3:color4),),
    );
  }
}
