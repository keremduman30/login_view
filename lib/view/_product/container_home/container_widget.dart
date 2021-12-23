import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  // final double height;
  final double? width;
  final BoxDecoration? boxDecoration;
  final EdgeInsetsGeometry? icPadding;
  final Widget? containerchild;

  const ContainerWidget({Key? key, this.width, this.boxDecoration, this.icPadding, this.containerchild}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: height,
      width: width ?? double.infinity,
      padding: icPadding,
      decoration: boxDecoration,
      child: containerchild,
    );
  }
}
/*
 BoxDecoration(
          color: color,
          image: DecorationImage(image: image?? AssetImage(""), fit: BoxFit.cover),
          borderRadius: borderRadius,
          boxShadow: [BoxShadow(color: shadowColor ?? Colors.white, spreadRadius: spreadRadiusShadow ?? 0, blurRadius: blurRadiusShadow ?? 0)]),
 */
