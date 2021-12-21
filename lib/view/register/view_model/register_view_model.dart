// ignore_for_file: overridden_fields, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_guide_examples/core/constant/enum/local_keys.dart';
import 'package:flutter_guide_examples/core/constant/navigation/navigation_constant.dart';
import 'package:flutter_guide_examples/view/register/service/register_service.dart';
import 'package:get/get.dart';
import '../../../core/base/view_model/base_view_model.dart';

class RegisterViewModel extends GetxController with BaseViewModel {
  late TextEditingController email;
  late TextEditingController userName;
  late TextEditingController password;
  late GlobalKey<FormState> formKey;
  var checkPassword = false.obs;
  late RegisterService _service;
  var registerLoading = false.obs;

  @override
  late BuildContext context;
  @override
  void init() {
    email = TextEditingController();
    userName = TextEditingController();
    password = TextEditingController();
    formKey = GlobalKey();
    _service = RegisterService();
  }

  @override
  void setContext(BuildContext context) {
    this.context = context;
  }

  void changeRegisterLoaging() {
    registerLoading.value = !registerLoading.value;
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

  Future<void> fetchRegisterButton() async {
    var isproblems = formKey.currentState?.validate();
    if (isproblems!) {
      changeRegisterLoaging();
      var userModel = await _service.userCreate(userName.text, email.text, password.text);
      if (userModel != null) {
        await localeManager.setBoolValue(LocalKeysPreferencesKeys.login, true);
        _service.registerUserFirestore(userModel.userID!, userModel.toJsonFirestore(userName.text));
        Get.snackbar("uyarı", "kayıt basarılı");
        navigationService.navigatorToPageClear(path: NavigationConstant.HOME_VIEW);
        changeRegisterLoaging();
      }
    }
  }

  void fetchBack() {
    Get.back();
  }

  void changeTextHidden() {
    checkPassword.value = !checkPassword.value;
  }
}
