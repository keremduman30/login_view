// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/base/view_model/base_view_model.dart';

class RegisterViewModel extends GetxController with BaseViewModel {
  @override
  late BuildContext context;
  @override
  void init() {
    
  }
  @override
  void setContext(BuildContext context) {
    this.context = context;
  }
}
