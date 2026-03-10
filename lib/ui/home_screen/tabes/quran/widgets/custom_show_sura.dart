import 'package:flutter/material.dart';
import 'package:islamic/core/models/quran_data.dart';
import 'package:islamic/core/utiles/app_assets.dart';
import 'package:islamic/core/utiles/app_colors.dart';
import 'package:islamic/core/utiles/helper.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../providers/most_recent_provider.dart';
import '../sura_detailes/utiles/shared_utiles.dart';
class CustomShowSura extends StatefulWidget {
   CustomShowSura({super.key,required this.index});

  int index;

  @override
  State<CustomShowSura> createState() => _CustomShowSuraState();
}


class _CustomShowSuraState extends State<CustomShowSura> {
  late var mostRecentProvider;
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => mostRecentProvider.getData());
  }





  @override
  Widget build(BuildContext context) {
    Helper.init(context);
    mostRecentProvider=Provider.of<MostRecentProvider>(context);
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.primaryColor,
      ),


      child: Row(
        spacing: 8,

        children: [
          Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(QuranData.englishQuranSurah[mostRecentProvider.value],style: Helper.bold24Black,),
              Text(QuranData.arabicQuranSura[mostRecentProvider.value],style: Helper.bold24Black,),
              Text(QuranData.ayaNumber[mostRecentProvider.value],style: Helper.bold16Black,),
            ],
          ),
          Image.asset(AppAssets.img_most_recent)
        ],
      ),


    );
  }
}
