// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorShemeLight {
static ColorShemeLight? _instace;
static ColorShemeLight get instance {
if (_instace != null) return _instace!;

return  ColorShemeLight._init();

}
ColorShemeLight._init();
  final Color brown=Color(0xffa87e6f);
  final Color red=Color(0xffc10e0e);
  final Color white=Color(0xffffffff);
  final Color buttonColor=Color.fromRGBO(3, 127, 242, 1);
  final Color buttonColorIcon=Color.fromRGBO(60, 90, 154, 1);
  
 
  

}