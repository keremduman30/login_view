// ignore_for_file: prefer_function_declarations_over_variables

import 'package:flutter/cupertino.dart';

import 'INavigationService.dart';

class NavigationService extends INavigationService {
  static final NavigationService _instace = NavigationService._init();
  static NavigationService get instance => _instace;

  NavigationService._init();

  //burda bir sınıftan diger sınıflara gecmek için navigator key kullanacaz
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  final removeAllOldRoutes = (Route<dynamic> route) => false;

  @override
  Future<void> navigatorToPage({String? path, Object? data}) async {
    //path gidilecek yer string ile data sınıf objesi
    await navigatorKey.currentState!.pushNamed(path!, arguments: data);
  }

  @override
  Future<void> navigatorToPageClear({String? path, Object? data}) async {
    await navigatorKey.currentState!.pushNamedAndRemoveUntil(path!, removeAllOldRoutes, arguments: data);
  }
  /*
  @override
  Future<void> navigateToPage({String? path, Object? data}) async {
    await navigatorKey.currentState!.pushNamed(path!, arguments: data);
  }

  @override
  Future<void> navigateToPageClear({String? path, Object? data}) async {
    await navigatorKey.currentState!.pushNamedAndRemoveUntil(path!, removeAllOldRoutes, arguments: data);
  }
   */
}
