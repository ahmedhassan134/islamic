import 'package:flutter/material.dart';
import 'package:islamic/core/utiles/app_assets.dart';
import 'package:islamic/core/utiles/helper.dart';
class Time extends StatelessWidget {
  const Time({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: Helper.screenWidth*.04,vertical:Helper.screenWidth*.04 ),
      child: Column(
        spacing: Helper.screenHeight*.01,
        crossAxisAlignment: .start,
        children: [
          Image.asset(AppAssets.time),
          Text("Azkar",style: Helper.bold16Weight,),
          Expanded(
            child: Row(
              spacing:Helper.screenWidth*.04,
              children: [
                Expanded(child: Image.asset(AppAssets.evenAzkar,fit: BoxFit.fill,)),
                Expanded(child: Image.asset(AppAssets.morningAzkar,fit: BoxFit.fill,)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
