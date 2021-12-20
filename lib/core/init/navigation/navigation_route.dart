// ignore_for_file: prefer_final_fields, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_guide_examples/core/component/card/not_found_navigator_widget.dart';
import 'package:flutter_guide_examples/core/constant/navigation/navigation_constant.dart';
import 'package:flutter_guide_examples/view/home/view/home_view.dart';
import 'package:flutter_guide_examples/view/login/view/login_view.dart';
import 'package:flutter_guide_examples/view/register/view/register_view.dart';

class NavigationRoute {
  static NavigationRoute _instace = NavigationRoute._init();
  static NavigationRoute get instance => _instace;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstant.REGISTER_VIEW:
        return normalNavigate(RegisterView());
      case NavigationConstant.LOGIN_VIEW:
        return normalNavigate(LoginView());
      case NavigationConstant.HOME_VIEW:
        return normalNavigate(HomeView());

      default:
        return MaterialPageRoute(builder: (context) => NotFoundNAvigatorWidget());
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}
