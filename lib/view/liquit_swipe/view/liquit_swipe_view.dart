// ignore_for_file: avoid_print, prefer_const_constructors, unused_import, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_guide_examples/core/base/view/base_view.dart';
import 'package:flutter_guide_examples/core/component/container_onboard.dart';
import 'package:flutter_guide_examples/view/gifview/view/gif_view.dart';
import 'package:flutter_guide_examples/view/liquit_swipe/view_model/liquit_swipe_view_model.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class LiquitSwipeView extends StatelessWidget {
  const LiquitSwipeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LuqitSwipeViewModel>(
        viewModel: LuqitSwipeViewModel(),
        onModelReady: (viewmodel) {
          viewmodel.init();
          viewmodel.setContext(context);
        },
        onPageBuilder: (BuildContext context, LuqitSwipeViewModel viewModel) => Scaffold(
                body: Column(
              children: [
                Expanded(
                  flex: 5,
                  child: Builder(
                    builder: (context) {
                      return LiquidSwipe(
                        liquidController: viewModel.liquidController,
                        pages: viewModel.pages,
                        fullTransitionValue: 800,
                        waveType: WaveType.circularReveal,
                        slideIconWidget: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        positionSlideIcon: 0.8,
                        onPageChangeCallback: (value) {
                          viewModel.changeindex(value);
                          if (value == 3) {
                            Get.to(GifView());
                          }
                        },
                      );
                    },
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: viewModel.pages.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.all(10),
                            child: Obx(() => CircleAvatar(
                                  radius: viewModel.index == index ? 8 : 5,
                                  backgroundColor: viewModel.index == index ? Colors.orange : Colors.green,
                                )),
                          );
                        }))
              ],
            )));
  }
}
/* 
 Builder(
                    builder: (context) {
                      return LiquidSwipe(
                        liquidController: viewModel.liquidController,
                        pages: viewModel.pages,
                        fullTransitionValue: 800,
                        waveType: WaveType.circularReveal,
                        slideIconWidget: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        positionSlideIcon: 0.8,
                        onPageChangeCallback: (value) {
                          if (value == 3) {
                            Get.to(GifView());
                          }
                        },
                      );
                    },
                  ),
 */