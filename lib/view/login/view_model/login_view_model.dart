// ignore_for_file: prefer_const_constructors, overridden_fields

import 'package:flutter/material.dart';
import 'package:flutter_guide_examples/core/constant/enum/local_keys.dart';
import 'package:flutter_guide_examples/core/constant/navigation/navigation_constant.dart';
import 'package:flutter_guide_examples/core/init/cache/local_manager.dart';
import 'package:flutter_guide_examples/core/init/lang/getx/language_manager.dart';
import 'package:get/get.dart';
import '../../../core/base/view_model/base_view_model.dart';

class LoginViewModel extends GetxController with BaseViewModel {
  var checkSelected = false.obs;

  @override
  late BuildContext context;
  @override
  void init() {
    
  }
  @override
  void setContext(BuildContext context) {
    this.context = context;
  }

  void changeCheckedSelected() {
    checkSelected.value = !checkSelected.value;
    if (checkSelected.value) {
      LocaleManager.instance.setStringValue(LocalKeysPreferencesKeys.language, "en");
      LanguageManager.instance.changeLocaleApp(Locale("en"));
    } else {
      LocaleManager.instance.setStringValue(LocalKeysPreferencesKeys.language, "tr");
      LanguageManager.instance.changeLocaleApp(Locale("tr"));
    }
  }

  void selectedLoginButton() async {
    await navigationService.navigatorToPage(path: NavigationConstant.REGISTER_VIEW);
    
  }
}
