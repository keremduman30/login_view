// ignore_for_file: constant_identifier_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_guide_examples/core/base/view/base_view.dart';
import 'package:flutter_guide_examples/core/constant/app/image_constant.dart';
import 'package:flutter_guide_examples/core/extension/context_extension.dart';
import 'package:flutter_guide_examples/view/_product/container_home/container_widget.dart';
import 'package:flutter_guide_examples/view/_product/icon_button/icon_buton.dart';
import 'package:flutter_guide_examples/view/home/view_model/home_view_model.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
        appBar: buildAppar(context),
        body: Obx(
          () => viewModel.homeviewLoading.value ? const Center(child: CircularProgressIndicator()) : bodyListviewBuilder(viewModel, context),
        ),
      ),
    );
  }

  AppBar buildAppar(BuildContext context) {
    return AppBar(
      leading: const Icon(Icons.menu),
      title: const Text("Feed",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
          )),
      centerTitle: true,
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: context.paddingLowHorizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(Icons.notification_important),
                  SizedBox(
                    width: 20,
                  ),
                  Icon(Icons.search)
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}

ListView bodyListviewBuilder(HomeViewModel viewModel, BuildContext context) {
  return ListView.builder(
    shrinkWrap: true,
    itemCount: Feed.values.length,
    itemBuilder: (context, index) {
      switch (Feed.values[index]) {
        case Feed.DASHBOARDCARD:
          return buildDashboardImage(context, viewModel);
        case Feed.TABBAR:
          return buildTabbar(context, viewModel);
        case Feed.FEED_CARD:
          return buildFeedCard(viewModel);

        default:
          return const Text("berwari");
      }
    },
  );
}

Column buildDashboardImage(BuildContext context, HomeViewModel viewModel) {
  return Column(
    children: [
      SizedBox(
        width: double.infinity,
        height: context.dymaicHeight(context.lowValue / 25),
        child: PageView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: viewModel.itemsDahborad.length,
          itemBuilder: (context, index) {
            return Padding(
                padding: context.paddingNormal,
                child: ContainerWidget(
                  height: context.dymaicHeight(context.lowValue / 25),
                  width: double.infinity,
                  borderRadius: BorderRadius.circular(15),
                  image: AssetImage(viewModel.itemsDahborad[index].imageUrl),
                  shadowColor: Colors.grey.withOpacity(0.2),
                  spreadRadiusShadow: 3,
                  blurRadiusShadow: 4,
                ));
          },
          onPageChanged: (value) {
            viewModel.changeIndexPage(value);
          },
        ),
      ),
    ],
  );
}

Padding buildTabbar(BuildContext context, HomeViewModel viewModel) {
  return Padding(
      padding: context.paddingNormal,
      child: ContainerWidget(
        height: context.dymaicWidth(0.090),
        borderRadius: BorderRadius.circular(20),
        containerChild: buildTabbarList(viewModel),
      ));
}

ListView buildTabbarList(HomeViewModel viewModel) {
  return ListView.builder(
      itemCount: viewModel.tabbars.length,
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
            padding: context.paddingLowHorizontal,
            child: Container(
              height: context.dymaicWidth(0.090),
              padding: context.paddingMediumHorizontal,
              decoration: BoxDecoration(color: viewModel.colors[index], borderRadius: BorderRadius.circular(20)),
              child: Center(
                child: Text(
                  viewModel.tabbars[index],
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ));
      });
}

ListView buildFeedCard(HomeViewModel viewModel) {
  return ListView.builder(
    physics: const NeverScrollableScrollPhysics(),
    // reverse: true,
    shrinkWrap: true,
    itemCount: 3,
    itemBuilder: (context, index) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: context.normalPlus, vertical: context.lowValue),
        child: Container(
            height: context.dymaicHeight(context.lowValue / 35),
            decoration:
                BoxDecoration(color: Colors.grey.shade300, borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.grey.shade400)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildFeedRowImage(context, viewModel, index),
                Expanded(
                  child: buildFeedColumnDesription(),
                )
              ],
            )),
      );
    },
  );
}

Column buildFeedColumnDesription() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      AutoSizeText(
        "hakkari dogal guzelliklerini  korumak ve saygı duymak ",
        style: GoogleFonts.poppins(letterSpacing: 1, fontSize: 12),
      ),
      AutoSizeText(
        "hakkari dogal guzelliklerini korumak ve saygı duymak",
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.poppins(color: Colors.grey[600]),
        maxLines: 1,
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButtonWidget(
            icon: ImageConstant.instance.security,
          ),
          const Spacer(),
          IconButtonWidget(
            icon: ImageConstant.instance.message,
          ),
          const Spacer(),
          IconButtonWidget(
            icon: ImageConstant.instance.share,
          ),
          const Spacer(),
        ],
      )
    ],
  );
}

Padding buildFeedRowImage(BuildContext context, HomeViewModel viewModel, int index) {
  return Padding(
    padding: EdgeInsets.only(right: context.lowValue),
    child: Container(
      height: context.dymaicHeight(context.lowValue / 35),
      width: context.dymaicWidth(context.lowValue / 22),
      decoration: BoxDecoration(
          // color: Colors.blue,
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(image: AssetImage(viewModel.itemsDahborad[index].imageUrl), fit: BoxFit.cover)),
    ),
  );
}

enum Feed { DASHBOARDCARD, TABBAR, FEED_CARD }
