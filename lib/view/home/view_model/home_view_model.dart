// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_guide_examples/view/home/model/home_model.dart';
import 'package:flutter_guide_examples/view/home/serrvice/home_service.dart';
import 'package:flutter_guide_examples/view/login/view/login_view.dart';
import 'package:get/get.dart';
import '../../../core/base/view_model/base_view_model.dart';

class HomeViewModel extends GetxController with BaseViewModel {
  late HomeServices _servicesHome;
  List<HomeModel> itemsDahborad = [];
  late List<String> tabbars ;
   List<Color> colors=[Color.fromRGBO(254, 95, 85, 1),Color.fromRGBO(142, 68, 173, 1),Color.fromRGBO(52, 73, 94, 1),Color.fromRGBO(211, 84, 0, 1),Color.fromRGBO(241, 196, 14, 1)];
  var users = [].obs;
  var indexPageBuilder = 0.obs;
  @override
  void init() {
    _servicesHome = HomeServices();
    
    getAllUsers();
    itemsDahborad.add(HomeModel("hakkari de hayat var", "https://i.ytimg.com/vi/REh93DK45BE/maxresdefault.jpg"));
    itemsDahborad.add(
      HomeModel("hakkari de hayat var", "https://3.bp.blogspot.com/-joC8IFPMQJ0/TwjjQRIt7MI/AAAAAAAABcg/gJfPvtxQeRo/s1600/hakkari_ters_lale.jpg"),
    );
    itemsDahborad.add(HomeModel("hakkari de hayat var", "https://cdn-photo.pivol.com/15648/imgs/010520211346311613656.jpg"));
    tabbars = ["photology","trending","politics","movies","culture"];
  }

  var homeviewLoading = false.obs;
  void changeLoading() {
    homeviewLoading.value = !homeviewLoading.value;
  }

  void changeIndexPage(int value) {
    indexPageBuilder.value = value;
  }

  @override
  void setContext(BuildContext context) {
    this.context = context;
  }

  Future<void> quitApp() async {
    changeLoading();
    await _servicesHome.cikisYap();
    Get.to(() => LoginView());
    changeLoading();
  }

  Future getAllUsers() async {
    changeLoading();
    var usersGet = await _servicesHome.getAllUsers();
    users.value = usersGet;
    print("kulancı miktarı " + users.length.toString());
    changeLoading();
  }
}
