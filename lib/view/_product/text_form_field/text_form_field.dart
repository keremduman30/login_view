import 'package:flutter/material.dart';
import 'package:flutter_guide_examples/core/extension/context_extension.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String hintText;
  final String? Function(String? value) validator;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final bool textHidden;

  const TextFormFieldWidget(
      {Key? key, required this.hintText, required this.validator, required this.controller, this.suffixIcon, required this.textHidden})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: textHidden,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        border: InputBorder.none,
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
        contentPadding: context.paddingLow,
        enabled: true,
        // disabledBorder: InputBorder.none,
      ),
      validator: validator,
    );
  }
}
