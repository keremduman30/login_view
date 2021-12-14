// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_guide_examples/core/constant/enum/local_keys.dart';
import 'package:flutter_guide_examples/core/init/cache/local_manager.dart';
import 'package:flutter_guide_examples/core/init/lang/getx/language_maps.dart';
import 'package:flutter_guide_examples/core/init/navigation/navigation_route.dart';
import 'package:flutter_guide_examples/core/init/navigation/navigation_service.dart';
import 'package:flutter_guide_examples/core/init/theme/app_theme_light.dart';
import 'package:flutter_guide_examples/view/gifview/view/gif_view.dart';
import 'package:flutter_guide_examples/view/home/view/home_view.dart';
import 'package:flutter_guide_examples/view/liquit_swipe/view/liquit_swipe_view.dart';
import 'package:flutter_guide_examples/view/login/view/login_view.dart';
import 'package:get/get.dart';

void main() async {
  await _init();
  runApp(MyApp());
}

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await EasyLocalization.ensureInitialized();
  await LocaleManager.prefrencesInit();
}

class MyApp extends StatelessWidget {
  final selectedLanguage = LocaleManager.instance.getStringValue(LocalKeysPreferencesKeys.language);
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppThemeLight.instance.theme,
      locale: selectedLanguage.isNotEmpty? selectedLanguage=="tr" ? Locale("tr"):Locale("en"):Locale("tr"),
      translations: Messages(),
       navigatorKey: NavigationService.instance.navigatorKey,
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      home: LoginView(),
    );
  }
}

class Anasayfa extends StatelessWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LiquitSwipeView());
  }
}
