import 'package:flutter/material.dart';
import 'package:flutter_guide_examples/core/extension/context_extension.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String hintText;

  const TextFormFieldWidget({Key? key, required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
        contentPadding: context.paddingLow,
        enabled: true,
        // disabledBorder: InputBorder.none,
      ),
    );
  }
}
