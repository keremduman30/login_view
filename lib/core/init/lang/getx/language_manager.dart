import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LanguageManager {
  static LanguageManager? _instace;
  static LanguageManager get instance {
    _instace ??= LanguageManager._init();
    return _instace!;
  }

  LanguageManager._init();
  final trLocale = const Locale("tr");
  final enLocale = const Locale("en");
  List<Locale> get supportLocale => [trLocale, enLocale];

  
  void changeLocaleApp(Locale? locale) {
    Get.updateLocale(locale!);
  }
}
