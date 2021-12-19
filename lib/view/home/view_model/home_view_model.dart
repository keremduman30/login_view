// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_guide_examples/core/constant/navigation/navigation_constant.dart';
import 'package:flutter_guide_examples/view/home/serrvice/home_service.dart';
import 'package:flutter_guide_examples/view/login/view/login_view.dart';
import 'package:get/get.dart';
import '../../../core/base/view_model/base_view_model.dart';

class HomeViewModel extends GetxController with BaseViewModel {
  late HomeServices _services;
  @override
  void init() {}
  @override
  void setContext(BuildContext context) {
    this.context = context;
    _services = HomeServices();
  }

  Future<void> quitApp() async {
    await _services.cikisYap();
    Get.to(()=>LoginView());
  }
}
