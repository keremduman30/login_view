import 'package:flutter/material.dart';
import 'package:flutter_guide_examples/core/extension/context_extension.dart';

class ButtonLoginWidget extends StatelessWidget {
  final Color? color;
  final Color? textColor;
  final double? fontSize;
  final String? buttonText;
  final Widget? widget;
  final Function()? onPressed;

  const ButtonLoginWidget({Key? key, this.color, this.textColor, this.fontSize, this.buttonText, this.widget, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.dymaicWidth(0.4),
      height: context.dymaicHeight(0.05),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: color, textStyle: context.textThem.headline6!.copyWith(color: textColor, fontSize: fontSize)),
        onPressed: onPressed,
        child: widget,
      ),
    );
  }
}
