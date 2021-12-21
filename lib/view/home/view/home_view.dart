// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_guide_examples/core/base/view/base_view.dart';
import 'package:flutter_guide_examples/core/constant/app/image_constant.dart';
import 'package:flutter_guide_examples/core/extension/context_extension.dart';
import 'package:flutter_guide_examples/view/home/view_model/home_view_model.dart';
import 'package:flutter_guide_examples/view/register/model/user_model.dart';
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
        appBar: AppBar(
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
        ),
        body: Obx(
          () => viewModel.homeviewLoading.value
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: Feed.values.length,
                  itemBuilder: (context, index) {
                    switch (Feed.values[index]) {
                      case Feed.DASHBOARDCARD:
                        return Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              // decoration: BoxDecoration(color: Colors.blue),
                              height: 250,
                              child: PageView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: viewModel.itemsDahborad.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: context.paddingNormal,
                                    child: Container(
                                      height: 200,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(image: NetworkImage(viewModel.itemsDahborad[index].imageUrl), fit: BoxFit.cover),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            spreadRadius: 3,
                                            blurRadius: 4,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                onPageChanged: (value) {
                                  viewModel.changeIndexPage(value);
                                },
                              ),
                            ),
                          ],
                        );
                      case Feed.TABBAR:
                        return Padding(
                          padding: context.paddingNormal,
                          child: Container(
                            height: 30,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                            width: double.infinity,
                            child: ListView.builder(
                                itemCount: viewModel.tabbars.length,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: context.paddingLowHorizontal,
                                    child: Container(
                                      height: 25,
                                      padding: context.paddingMediumHorizontal,
                                      decoration: BoxDecoration(color: viewModel.colors[index], borderRadius: BorderRadius.circular(20)),
                                      child: Center(
                                        child: Text(
                                          viewModel.tabbars[index],
                                          style: const TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        );
                      case Feed.FEED_CARD:
                        return Container(
                          height: 400,
                          child: ListView.builder(
                            // physics: NeverScrollableScrollPhysics(),
                            // reverse: true,
                            itemCount: 16,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: context.normalPlus, vertical: context.lowValue),
                                child: Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade300,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: Colors.grey.shade400)),
                                ),
                              );
                            },
                          ),
                        );
                      default:
                        return const Text("berwari");
                    }
                  },
                ),
        ),
      ),
    );
  }
}

enum Feed {
  DASHBOARDCARD,
  TABBAR,
  FEED_CARD,
}


/*
ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: viewModel.users.length,
                                itemBuilder: (BuildContext context, int index) {
                                  UserModel userModel = viewModel.users[index];
                                  return Padding(
                                    padding: context.paddingLow,
                                    child: Container(
                                      width: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.blue[100],
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          CircleAvatar(
                                            child: userModel.profilFoto != null
                                                ? Image.network(userModel.profilFoto!)
                                                : Image.asset(ImageConstant.instance.userPng),
                                          ),
                                          Text(userModel.userName.toString()),
                                        ],
                                      ),
                                    ),
                                  );
                                }),


 Container(
                            height: 200,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.grey.shade400)),
                          ),


 */
/**
 Container(
                              height: 300,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  image: DecorationImage(image: NetworkImage(viewModel.itemsDahborad[index].imageUrl), fit: BoxFit.cover)),
                              child: Text(viewModel.itemsDahborad[index].desription),
                            );
 */