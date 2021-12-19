// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_guide_examples/core/base/view/base_view.dart';
import 'package:flutter_guide_examples/view/home/view_model/home_view_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (viewmodel) {
        viewmodel.init();
        viewmodel.setContext(context);
      },
      onPageBuilder: (BuildContext context, HomeViewModel viewModel) => Scaffold(
        body: GestureDetector(
          onTap: () {
            print("cıkıs yapıldı");
            viewModel.quitApp();
          },
          child: Container(
            // ignore: prefer_const_constructors
            child: Center(child: Text("merhaba anasayfa")),
          ),
        ),
      ),
    );
  }
}
