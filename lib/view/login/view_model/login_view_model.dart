// ignore_for_file: prefer_const_constructors, overridden_fields, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_guide_examples/core/constant/enum/local_keys.dart';
import 'package:flutter_guide_examples/core/constant/navigation/navigation_constant.dart';
import 'package:flutter_guide_examples/core/init/cache/local_manager.dart';
import 'package:flutter_guide_examples/core/init/lang/getx/language_manager.dart';
import 'package:flutter_guide_examples/view/login/service/login_service.dart';
import 'package:flutter_guide_examples/view/register/view/register_view.dart';
import 'package:get/get.dart';
import '../../../core/base/view_model/base_view_model.dart';

class LoginViewModel extends GetxController with BaseViewModel {
  var checkSelected = false.obs;
  late TextEditingController email;
  late TextEditingController password;
  late GlobalKey<FormState> formkey;
  var passwordCheck=false.obs;
  late LoginService _service;
  var loginLoading = false.obs;

  @override
  late BuildContext context;
  @override
  void init() {
    email = TextEditingController();
    password = TextEditingController();
    formkey = GlobalKey();
    _service=LoginService();
  }

  @override
  void setContext(BuildContext context) {
    this.context = context;
  }
   void changeRegisterLoaging() {
    loginLoading.value = !loginLoading.value;
  }

  String? fetchValidator(String? value) {
    if (value!.isEmpty) {
      return "please dont empty enter";
    } else if (value.length < 5) {
      return "please min >10 chareckter";
    } else {
      return null;
    }
  }

  String? fetchEmailValidator(String? value) {
    if (value!.isEmpty) {
      return "please dont empty enter";
    } else if (!value.contains("@")) {
      return "pleasee enter email format";
    }
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

  void selectedCreateTextButton() async {
    Get.to(RegisterView());
  }

  void selectedLoginButton() async {
    var isThereProblem = formkey.currentState!.validate();
    if (isThereProblem) {
      var isProblemService=await _service.signInLogin(email.text, password.text);
      if (isProblemService!) {
         changeRegisterLoaging();
         await localeManager.setBoolValue(LocalKeysPreferencesKeys.login, true);
        Get.snackbar("uyarı", "giriş basarılı");
        navigationService.navigatorToPageClear(path: NavigationConstant.HOME_VIEW);
        changeRegisterLoaging();
      }
    }
  }
  void chancePasswordCheck(){
    passwordCheck.value=!passwordCheck.value;
  }
}
