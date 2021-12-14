// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_guide_examples/core/component/container_onboard.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import '../../../core/base/view_model/base_view_model.dart';

class LuqitSwipeViewModel extends GetxController implements BaseViewModel {
  late LiquidController liquidController;
  List<Widget> pages = [];

  var index=0.obs;

  @override
  late BuildContext context;
  @override
  void init() {
    liquidController = LiquidController();
    pages.add(ContainerOnBoard(url: "https://my4kwallpapers.com/wp-content/uploads/2021/10/Squid-Game-Wallaper-1080x1920-1.jpg"));
    pages.add(ContainerOnBoard(url: "https://w0.peakpx.com/wallpaper/432/1/HD-wallpaper-el-juego-del-calamar-netflix-squid-game.jpg"));
    pages.add(ContainerOnBoard(url: "https://w0.peakpx.com/wallpaper/114/378/HD-wallpaper-squid-game-netflix-electric-blue-magenta-squid-game.jpg"));
    pages.add(ContainerOnBoard(
        url:
            "https://fsb.zobj.net/crop.php?r=71AngyTpyXhfPVli-wIddS2vviYpIGCVmHX8EkQbAKyEkqH55ohVtsP3jTs0sWamyX5auRdmNOTnvZb0lBvJG9bwdJ8Zi5wZdGo2JLutBDwV3Amcl9RWiMsHFZD1pgdCA8XsPIR-9FWNAXfy7zjd8IvNcU6j1tYROKs5F1iAP8AldI6AmLrv432iiVCGM6kNl3toGH6NzNTQUxKw"));
  }

  @override
  void setContext(BuildContext context) {
    this.context = context;
  }
  void changeindex(value){
    index.value=value;
  }
}
