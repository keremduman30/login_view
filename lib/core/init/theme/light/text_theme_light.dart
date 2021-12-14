// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextThemeLight {
  static TextThemeLight? _instace;
  static TextThemeLight get instance {
    
    if (_instace != null)  _instace!;
   return _instace = TextThemeLight._init();
  }

  TextThemeLight._init();
  final TextStyle headline1 =
      TextStyle(fontSize: 96, fontWeight: FontWeight.w300, letterSpacing: -1.5,color: Colors.black);
  final TextStyle headline2 =
      TextStyle(fontSize: 60, fontWeight: FontWeight.w300, letterSpacing: -0.5,color: Colors.black);
  final TextStyle headline3 =
      TextStyle(fontSize: 48, fontWeight: FontWeight.w400,color: Colors.black);
  final TextStyle headline4 =
      TextStyle(fontSize: 34, fontWeight: FontWeight.w400, letterSpacing: 0.25,color: Colors.black);
  final TextStyle headline5 =
      TextStyle(fontSize: 24, fontWeight: FontWeight.w400,color: Colors.black);
  final TextStyle headline6 =
      TextStyle(fontSize: 12,fontWeight: FontWeight.w300, letterSpacing: 0.15,color: Colors.black);
}
