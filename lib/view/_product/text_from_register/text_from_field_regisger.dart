// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class TextFormFieldRegister extends StatelessWidget {
 
  final TextEditingController? controller;
  final String? Function(String? validator)? validator;

  TextFormFieldRegister({Key? key, this.controller, this.validator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: InputBorder.none,
        contentPadding: EdgeInsets.only(left: 12),
        enabled: true,
      ),
      validator: validator,
    );
  }
}


/*
TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: InputBorder.none,
        contentPadding: EdgeInsets.only(left: 12),
        enabled: true,
      ),
      validator: validator,
    );
 */