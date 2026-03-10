import 'package:flutter/material.dart';
import 'package:islamic/core/utiles/app_routes.dart';
import 'package:islamic/core/utiles/app_theme.dart';
import 'package:islamic/providers/most_recent_provider.dart';
import 'package:islamic/ui/home_screen/home_screen.dart';
import 'package:islamic/ui/home_screen/tabes/hadeeth/hadeeth.dart';
import 'package:islamic/ui/home_screen/tabes/hadeeth/widget/hadeeth_content.dart';
import 'package:islamic/ui/home_screen/tabes/quran/quran.dart';
import 'package:islamic/ui/home_screen/tabes/quran/sura_detailes/sura_detailes.dart';
import 'package:islamic/ui/home_screen/tabes/quran/sura_detailes/sura_detailes_one.dart';
import 'package:islamic/ui/home_screen/tabes/radio/radio.dart';
import 'package:islamic/ui/home_screen/tabes/sebha/sebha.dart';
import 'package:islamic/ui/home_screen/tabes/time/time.dart';
import 'package:islamic/ui/onboarding_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
     create: (context) => MostRecentProvider(),
      child: const MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.onBoradingSc,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      routes: {
        AppRoutes.onBoradingSc:(context)=>OnBoardingPage(),
        AppRoutes.homeScreen:(context)=>HomeScreen(),
        AppRoutes.quranScreen:(context)=>Quran(),
        AppRoutes.hadeethScreen:(context)=>Hadeeth(),
        AppRoutes.sebhaScreen:(context)=>Sebha(),
        AppRoutes.radioScreen:(context)=>Radioo(),
        AppRoutes.timeScreen:(context)=>Time(),
        AppRoutes.suraDetailes:(context)=>SuraDetailes(),
        AppRoutes.suraDetailesOne:(context)=>SuraDetailesOne(),
        // AppRoutes.hadeethContent:(context)=>HadeethContent(),
      },
    );
  }
}

