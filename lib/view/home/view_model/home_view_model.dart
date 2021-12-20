// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_guide_examples/view/home/serrvice/home_service.dart';
import 'package:flutter_guide_examples/view/login/view/login_view.dart';
import 'package:get/get.dart';
import '../../../core/base/view_model/base_view_model.dart';

class HomeViewModel extends GetxController with BaseViewModel {
  late HomeServices _services;
  @override
  void init() {}

  var homeviewLoading = false.obs;
  void changeLoading() {
    homeviewLoading.value = !homeviewLoading.value;
  }

  @override
  void setContext(BuildContext context) {
    this.context = context;
    _services = HomeServices();
  }

  Future<void> quitApp() async {
    changeLoading();
    await _services.cikisYap();
    Get.to(() => LoginView());
    changeLoading();
  }
}
