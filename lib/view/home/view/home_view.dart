import 'package:flutter/material.dart';
import 'package:flutter_guide_examples/core/base/view/base_view.dart';
import 'package:flutter_guide_examples/view/home/view_model/home_view_model.dart';
import 'package:get/get.dart';

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
          viewModel.quitApp();
        },
        child: Obx(() => viewModel.homeviewLoading.value ? const CircularProgressIndicator() : const Center(child: Text("merhaba anasayfa"))),
      )),
    );
  }
}
