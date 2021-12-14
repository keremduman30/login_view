// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_guide_examples/core/base/view/base_view.dart';
import 'package:flutter_guide_examples/core/extension/context_extension.dart';
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
        onPageBuilder: (BuildContext context, HomeViewModel viewModel) => Scaffold(backgroundColor: Color(0xfff1f3f8), body: Container()));
  }
}
