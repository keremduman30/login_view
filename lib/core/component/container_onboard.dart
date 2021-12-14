import 'package:flutter/material.dart';

class ContainerOnBoard extends StatelessWidget {
  final String url;

  const ContainerOnBoard({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Image.network(url),
    );
  }
}
