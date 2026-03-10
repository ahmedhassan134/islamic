import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic/core/models/quran_data.dart';
import 'package:islamic/core/utiles/app_assets.dart';
import 'package:islamic/core/utiles/app_colors.dart';
import 'package:islamic/core/utiles/helper.dart';
import 'package:islamic/providers/most_recent_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/custom_content.dart';

class SuraDetailesOne extends StatefulWidget {
  SuraDetailesOne({super.key});

  @override
  State<SuraDetailesOne> createState() => _SuraDetailesState();
}

class _SuraDetailesState extends State<SuraDetailesOne> {
 String verse="";

late MostRecentProvider most;

  @override
  Widget build(BuildContext context) {

    var index = ModalRoute.of(context)?.settings.arguments as int;
    if (verse.isEmpty) {
      loadQuran(index);
    }
     most=Provider.of<MostRecentProvider>(context);

    Helper.init(context);
    return Container(
      margin: EdgeInsets.only(bottom: Helper.screenHeight * .06),
      // decoration: BoxDecoration(
      //   image: DecorationImage(
      //     image: AssetImage(AppAssets.souraDetailes),
      //     fit: BoxFit.fill,
      //   ),
      // ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        // appBar: AppBar(
        //   title: Text(
        //     QuranData.englishQuranSurah[index],
        //     style: Helper.bold14White,
        //   ),
        // ),
        body: SafeArea(
          child: Column(
            spacing: Helper.screenHeight * .06,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Text(
                QuranData.arabicQuranSura[index],
                style: Helper.bold16Weight,
              ),
              Expanded(
                child: verse.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      )
                    :  SingleChildScrollView(
                  child: Text(
                                        textAlign: TextAlign.center,
                                        verse,
                                        style: Helper.bold20White,
                                        textDirection: TextDirection.rtl,
                                      ),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }


void loadQuran(int index)async{
   String data= await rootBundle.loadString("assets/files/quran/${index+1}.txt");
    List<String> content=data.split("\n");


   for (int i = 0; i < content.length; i++) {
     content[i]+="[${i+1}]";
   }
   verse=content.join(" ");
    Future.delayed(Duration(seconds: 1),() =>    setState(() {

   }),);



 
}

 @override
 void dispose() {
   // TODO: implement dispose
   most.getData();
   super.dispose();
 }

}
