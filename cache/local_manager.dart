// ignore_for_file: prefer_conditional_assignment

import 'package:flutter_guide_examples/core/constant/enum/local_keys_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LocaleManager {
  static LocaleManager? _instace;

  static LocaleManager get instance {
    _instace ??= LocaleManager._init();
    return _instace!;
  }


  SharedPreferences? _sharedPreferences;
  LocaleManager._init() {
    SharedPreferences.getInstance().then((value) => _sharedPreferences = value);
  }

  void clearAll()async {
    await _sharedPreferences!.clear();
  }

  static void preferencesInit() async {
    if (instance._sharedPreferences == null) {
      instance._sharedPreferences = await SharedPreferences.getInstance();
    }
    return;
  }
  Future<void> setStringValue(LocalPreferensKeys key ,String value)async{
    await _sharedPreferences?.setString(key.toString(), value);//burda sharedpreferencesta key value mantıgı var map gibi
    //işte keyi enum ile token yapmısız valuesine o deger girecek 


  }
   Future<void> setBoolValue(LocalPreferensKeys key ,bool value)async{
    await _sharedPreferences?.setBool(key.toString(), value);//burda sharedpreferencesta key value mantıgı var map gibi
    //işte keyi enum ile token yapmısız valuesine o deger girecek 


  }

  String? getStringValue(LocalPreferensKeys key) {
    //gette de yazdgıımız set i cagırıyoz key ile key zaten enum olandı
    return _sharedPreferences?.getString(key.toString());
  }
   bool? getBoolVlue(LocalPreferensKeys key) {
    //gette de yazdgıımız set i cagırıyoz key ile key zaten enum olandı
    return _sharedPreferences?.getBool(key.toString()) ?? false;
  }
}
/*
shared preferences onemli oldugu için baslangıcta privite yaptık gerkes erismemeli
SharedPreferences? _sharedPreferences; bu sekil 
sonra constructurda getinstane degerini atadık cunku construtur await olamdıgı için then ile aktardık

*/ 