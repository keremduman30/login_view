import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  final String icon;
  final void Function()? onpressed;

  const IconButtonWidget({Key? key, required this.icon,  this.onpressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onpressed,
      icon: Image.asset(
        icon,
        color: Colors.grey[700],
        width: 300,
      ),
    );
  }
}
