import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ui/home_screen/tabes/quran/sura_detailes/utiles/shared_utiles.dart';

class MostRecentProvider extends ChangeNotifier{

  int value=0;

 void getData()async{
    final SharedPreferences pref=await SharedPreferences.getInstance();
     value=pref.getInt(SharedUtiles.key)??0;
notifyListeners();

  }
}