// ignore_for_file: prefer_const_constructors, duplicate_ignore, prefer_conditional_assignment

import 'package:flutter/material.dart';

import 'app_theme.dart';
import 'light/light_theme_interface.dart';

class AppThemeLight extends AppTheme with ILightTheme {
  static AppThemeLight? _instace;
  static AppThemeLight get instance {
    if (_instace == null) _instace = AppThemeLight._init();
    return _instace!;
  }

  AppThemeLight._init();

  @override
  ThemeData get theme => ThemeData.light().copyWith(
      textTheme: textTheme(),
      scaffoldBackgroundColor: Color.fromRGBO(245, 246, 248, 1),
      //
      // ignore: prefer_const_constructors
     /*  inputDecorationTheme: InputDecorationTheme(
        focusColor: Colors.black,
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.zero,
        labelStyle: TextStyle(color: Colors.black, fontSize: 12),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 0.3)),
        border: OutlineInputBorder(borderSide: BorderSide(width: 0.3)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 0.3)),
      ), */
      appBarTheme: ThemeData.light().appBarTheme.copyWith(
            color: Colors.transparent,
            elevation: 0,
            brightness: Brightness.light,
            iconTheme: IconThemeData(color: Colors.black87, size: 21),
          ),
      tabBarTheme: TabBarTheme(
        labelColor: colorScheme.onSecondary,
        labelStyle: TextStyle(fontSize: 15),
        unselectedLabelColor: colorScheme.onSecondary.withOpacity(0.8),
        unselectedLabelStyle: textThemeLight.headline6.copyWith(color: colorShemeLight.red),
      ),
      buttonTheme: ThemeData.light().buttonTheme.copyWith(
            colorScheme: ColorScheme.light(onError: Color(0xffFF2D55)),
          ),
      colorScheme: colorScheme);

  ColorScheme get colorScheme => ColorScheme(
        primary: colorShemeLight.brown,
        primaryVariant: Colors.white,
        secondary: Colors.green,
        secondaryVariant: Colors.green.shade100,
        surface: Color(0xffffc93c),
        background: Color(0xfff6f9fc),
        error: colorShemeLight.red,
        onPrimary: Colors.greenAccent,
        onSecondary: Colors.black,
        onSurface: Colors.white30,
        onBackground: Colors.black12,
        onError: Colors.orange,
        brightness: Brightness.light,
        
      );

  TextTheme textTheme() {
    return ThemeData.light().textTheme.copyWith(
          headline1: textThemeLight.headline1,
          headline2: textThemeLight.headline2,
          headline5: textThemeLight.headline5,
          headline6: textThemeLight.headline6,
        );
  }
}
