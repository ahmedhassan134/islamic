import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamic/core/models/quran_data.dart';
import 'package:islamic/core/utiles/app_assets.dart';
import 'package:islamic/core/utiles/app_colors.dart';
import 'package:islamic/core/utiles/helper.dart';

import '../widgets/custom_content.dart';

class SuraDetailes extends StatefulWidget {
  SuraDetailes({super.key});

  @override
  State<SuraDetailes> createState() => _SuraDetailesState();
}

class _SuraDetailesState extends State<SuraDetailes> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var index = ModalRoute.of(context)?.settings.arguments as int;
    if (verses.isEmpty) {
      loadFilesQuran(index);
    }

    Helper.init(context);
    return Container(
      margin: EdgeInsets.only(bottom: Helper.screenHeight * .06),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.souraDetailes),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            QuranData.englishQuranSurah[index],
            style: Helper.bold14White,
          ),
        ),
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
                child: verses.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      )
                    : ListView.separated(
                        itemBuilder: (context, index) {
                          return CustomContent(
                            content: verses[index],
                            index: index,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 20);
                        },
                        itemCount: verses.length,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void loadFilesQuran(int index) async {
    String data = await rootBundle.loadString(
      "assets/files/quran/${index + 1}.txt",
    );
    List<String> content = data.split("\n");

    verses = content;
    Future.delayed(Duration(seconds: 1), () => setState(() {}));
  }
}
