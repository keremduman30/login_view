import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/base/view_model/base_view_model.dart';

class GifViewModel extends GetxController implements BaseViewModel {
  var visible = false.obs;

  @override
  late BuildContext context;
  @override
  void init() {}
  @override
  void setContext(BuildContext context) {
    this.context = context;
  }
  void changeVisible(){
    visible.value=!visible.value;
  }
}
