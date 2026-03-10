

import 'package:shared_preferences/shared_preferences.dart';
class SharedUtiles {
  static const key="key";
}
void setData(int index)async{

  final SharedPreferences pref=await SharedPreferences.getInstance();
await pref.setInt(SharedUtiles.key, index);
}

