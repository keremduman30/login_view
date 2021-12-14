// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_guide_examples/core/base/view/base_view.dart';
import 'package:flutter_guide_examples/view/gifview/view_model/gif_view_model.dart';
import 'package:get/get.dart';

class GifView extends StatelessWidget {
  const GifView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<GifViewModel>(
      viewModel: GifViewModel(),
      onModelReady: (viewmodel) {
        viewmodel.init();
        viewmodel.setContext(context);
      },
      onPageBuilder: (BuildContext context, viewModel) => Scaffold(
        backgroundColor: Color(0xfff8ad19),
        body: Obx(() => Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    viewModel.visible.value ? "assets/gif/dancing-man.gif" : "assets/png/stop-man.png",
                    height: 500,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.black,
                        size: 20,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextButton(
                          onPressed: () {
                            viewModel.changeVisible();
                          },
                          child: Text("oynat/durdur"))
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}
