import 'package:flutter/material.dart';
import 'package:islamic/core/models/quran_data.dart';
import 'package:islamic/core/utiles/app_assets.dart';
import 'package:islamic/core/utiles/helper.dart';
class CustomAllSura extends StatelessWidget {
  // String arabicSura;
  // String engSura;
  // String ayaNumber;
  int number;
   CustomAllSura({required this.number});

  @override
  Widget build(BuildContext context) {
    Helper.init(context);
    
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(AppAssets.suraN,fit: BoxFit.fill,),
          Text("$number",style: Helper.bold16Weight,)
        ],
      ),
      title:Text(QuranData.englishQuranSurah[number],style: Helper.bold20White,),
      subtitle: Text("${QuranData.ayaNumber[number]} Verses ",style: Helper.bold14White,),
      trailing:Text(QuranData.arabicQuranSura[number],style: Helper.bold20White,) ,
    );
  }
}
