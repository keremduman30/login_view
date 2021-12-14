import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/base/view_model/base_view_model.dart';

class HomeViewModel extends GetxController implements BaseViewModel {
  @override
  late BuildContext context;
  @override
  void init() {}
  @override
  void setContext(BuildContext context) {
    this.context = context;
  }
}
