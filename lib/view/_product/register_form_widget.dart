// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_guide_examples/core/extension/context_extension.dart';
import 'package:flutter_guide_examples/core/init/theme/light/color_sheme_light.dart';

class RegisterFormWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final TextEditingController controller;

  const RegisterFormWidget({Key? key, required this.icon, required this.label, required this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.paddingNormal,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Icon(
                icon,
                color: ColorShemeLight.instance.buttonColor,
              ),
              SizedBox(
                width: 10,
              ),
              Text(label),
            ],
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: label,
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 12),
              enabled: true,
            ),
          ),
        ],
      ),
    );
  }
}
