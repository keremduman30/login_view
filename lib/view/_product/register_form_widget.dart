// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_guide_examples/core/extension/context_extension.dart';
import 'package:flutter_guide_examples/core/init/theme/light/color_sheme_light.dart';

class RegisterFormWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final TextEditingController controller;
  final String? Function(String? validator) validator;
  final bool textHidden;
  final Widget? suffixIcon;

  const RegisterFormWidget({
    Key? key,
    required this.icon,
    required this.label,
    required this.controller,
    required this.validator,
    required this.textHidden,
    this.suffixIcon,
  }) : super(key: key);
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
            controller: controller,
            obscureText: textHidden,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              hintText: label,
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(left: 12),
              enabled: true,
              suffixIcon: suffixIcon,
             
            ),
            validator: validator,
          ),
        ],
      ),
    );
  }
}
