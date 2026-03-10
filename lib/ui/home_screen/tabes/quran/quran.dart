import 'package:flutter/material.dart';
import 'package:islamic/core/models/quran_data.dart';
import 'package:islamic/core/utiles/app_assets.dart';
import 'package:islamic/core/utiles/app_colors.dart';
import 'package:islamic/core/utiles/app_routes.dart';
import 'package:islamic/core/utiles/helper.dart';
import 'package:islamic/providers/most_recent_provider.dart';
import 'package:islamic/ui/home_screen/tabes/quran/sura_detailes/utiles/shared_utiles.dart';
import 'package:islamic/ui/home_screen/tabes/quran/widgets/custom_show_sura.dart';
import 'package:islamic/ui/home_screen/tabes/quran/widgets/ustom_all_sura.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Quran extends StatefulWidget {
  Quran({super.key});

  @override
  State<Quran> createState() => _QuranState();
}

class _QuranState extends State<Quran> {
  late var mostRecentProvider;
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => mostRecentProvider.getData());
  }




  List<int> filter = List.generate(114, (index) => index);

  @override
  Widget build(BuildContext context) {
     mostRecentProvider=Provider.of<MostRecentProvider>(context);
    Helper.init(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Helper.screenWidth * .04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: .start,
        spacing: 8,
        children: [
          TextField(
            onChanged: (text) {
              searchInList(text);
            },
            style: Helper.bold20White,
            cursorColor: AppColors.primaryColor,

            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: AppColors.primaryColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: AppColors.primaryColor),
              ),
              prefixIcon: Image.asset(AppAssets.qIcon),
              hintText: "Sura Name",
              hintStyle: Helper.bold14White,
            ),
          ),
          Text("Most Recently ", style: Helper.bold16Weight),
          mostRecentProvider.value <0
              ?SizedBox()
              :SizedBox(
              height: Helper.screenHeight * .2,
              width: double.infinity,
              child: CustomShowSura(index: mostRecentProvider.value)),
          Text("Suras List ", style: Helper.bold16Weight),
          Expanded(
            child: filter.isEmpty
                ? Center(
                    child: Text("No sura found", style: Helper.bold20White),
                  )
                : ListView.separated(
                    // shrinkWrap: true,
                    // physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(vertical: 5),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setData(filter[index]);
                          Navigator.of(context).pushNamed(
                            AppRoutes.suraDetailes,
                            arguments: filter[index],
                          );
                        },
                        child: CustomAllSura(number: filter[index]),
                      );
                    },
                    separatorBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Divider(
                        endIndent: 20,
                        indent: 20,

                        height: 2,
                        color: Colors.grey,
                      ),
                    ),
                    itemCount: filter.length,
                  ),
          ),
        ],
      ),
    );
  }

  void searchInList(String text) {
    List<int> sResult = [];
    for (int i = 0; i < 114; i++) {
      if (QuranData.arabicQuranSura[i].contains(text)) {
        sResult.add(i);
      }
      if (QuranData.englishQuranSurah[i].toLowerCase().contains(
        text.toLowerCase(),
      )) {
        sResult.add(i);
      }
    }
    filter = sResult;
    setState(() {});
  }
}
