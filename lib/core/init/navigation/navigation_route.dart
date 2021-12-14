// ignore_for_file: prefer_final_fields

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_guide_examples/core/component/card/not_found_navigator_widget.dart';



class NavigationRoute {
  static NavigationRoute _instace = NavigationRoute._init();
  static NavigationRoute get instance => _instace;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      
    

      default:
        return MaterialPageRoute(builder: (context) => NotFoundNAvigatorWidget());
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}
