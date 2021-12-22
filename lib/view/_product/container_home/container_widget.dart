import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  final double height;
  final double? width;
  final ImageProvider<Object>? image;
  final BorderRadiusGeometry? borderRadius;
  final Color? shadowColor;
  final Color? color;
  final double? spreadRadiusShadow;
  final double? blurRadiusShadow;
  final Widget? containerChild;
  final EdgeInsetsGeometry? icPadding;

  const ContainerWidget(
      {Key? key,
      required this.height,
      this.image,
      this.borderRadius,
      this.shadowColor,
      this.spreadRadiusShadow,
      this.blurRadiusShadow,
      this.width,
      this.containerChild,
      this.icPadding,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width ?? double.infinity,
      padding: icPadding,
      decoration: BoxDecoration(
          color: color,
          image: DecorationImage(image: image ?? const AssetImage(""), fit: BoxFit.cover),
          borderRadius: borderRadius,
          boxShadow: [BoxShadow(color: shadowColor ?? Colors.white, spreadRadius: spreadRadiusShadow ?? 0, blurRadius: blurRadiusShadow ?? 0)]),
      child: containerChild,
    );
  }
}
