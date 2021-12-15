// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_guide_examples/core/base/view/base_view.dart';
import 'package:flutter_guide_examples/core/constant/app/image_constant.dart';
import 'package:flutter_guide_examples/core/extension/context_extension.dart';
import 'package:flutter_guide_examples/core/init/theme/light/color_sheme_light.dart';
import 'package:flutter_guide_examples/view/_product/button_login/button_login.dart';
import 'package:flutter_guide_examples/view/_product/text_form_field/text_form_field.dart';
import 'package:flutter_guide_examples/view/login/view_model/login_view_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      viewModel: LoginViewModel(),
      onModelReady: (viewmodel) {
        viewmodel.init();
        viewmodel.setContext(context);
      },
      onPageBuilder: (BuildContext context, LoginViewModel viewModel) => Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: context.dymaicHeight(0.05),
              ),
              buildSvg(context),
              Padding(
                padding: EdgeInsets.only(bottom: context.dymaicHeight(0.008)),
                child: buildLoginText(context),
              ),
              buildLoginForm(context, viewModel)
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSvg(BuildContext context) {
    return Padding(
      padding: context.paddingHighHorizontal,
      child: SizedBox(
        width: double.infinity,
        height: context.dymaicHeight(0.3),
        child: SvgPicture.asset(ImageConstant.instance.loginSvg),
      ),
    );
  }

  Widget buildLoginText(BuildContext context) {
    return Text(
      "login".tr,
      style: context.textThem.headline5?.copyWith(fontWeight: FontWeight.bold, color: context.colors.onSecondary.withOpacity(0.6)),
    );
  }

  Form buildLoginForm(BuildContext context, LoginViewModel viewModel) {
    return Form(
        child: Column(
      children: [
        Padding(
          padding: context.paddingNormalHorizontal,
          child: buildEmailFormField(),
        ),
        SizedBox(
          height: context.dymaicHeight(0.05),
        ),
        Padding(
          padding: context.paddingNormalHorizontal,
          child: buildPasswordFormField(),
        ),
        SizedBox(
          height: context.dymaicHeight(0.04),
        ),
        Padding(
          padding: context.paddingNormalHorizontal,
          child: buildCheckBoxRow(viewModel, context),
        ),
        Padding(
          padding: context.paddingMediumHorizontal,
          child: buildLoginButton(context, viewModel),
        ),
        SizedBox(
          height: context.dymaicHeight(0.03),
        ),
        buildCreateTextButton(context),
        buildOrText(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildGoogleButton(context),
            buildFaceButton(context),
          ],
        )
      ],
    ));
  }

  Widget buildEmailFormField() {
    return TextFormFieldWidget(
      hintText: "email".tr,
    );
  }

  Widget buildPasswordFormField() {
    return TextFormFieldWidget(
      hintText: "password".tr,
    );
  }

  Widget buildCheckBoxRow(LoginViewModel viewModel, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Obx(
              () => Checkbox(
                value: viewModel.checkSelected.value,
                onChanged: (value) {
                  viewModel.changeCheckedSelected();
                },
              ),
            ),
            Text(
              "remember".tr,
              style: context.textThem.headline6!.copyWith(color: context.colors.onSecondary),
            ),
          ],
        ),
        Text(
          "forget_password".tr,
          style: context.textThem.headline6!.copyWith(
            color: ColorShemeLight.instance.buttonColor,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }

  Widget buildLoginButton(BuildContext context, LoginViewModel viewModel) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: ColorShemeLight.instance.buttonColor, textStyle: context.textThem.headline6!.copyWith(color: Colors.white, fontSize: 18)),
      onPressed: () {
        viewModel.selectedLoginButton();
      },
      child: Center(
        child: Padding(
          padding: context.paddingLowVertical,
          child: Text(
            "login".tr,
            style: context.textThem.headline5!.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Row buildCreateTextButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("dont_have_account".tr),
        SizedBox(
          width: context.dymaicWidth(0.02),
        ),
        Text(
          "create_app".tr,
          style: context.textThem.headline6!.copyWith(
            color: ColorShemeLight.instance.buttonColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Padding buildOrText(BuildContext context) {
    return Padding(
      padding: context.paddingNormal,
      child: Text(
        "or".tr,
        style:
            context.textThem.headline6!.copyWith(color: context.colors.onSecondary, fontWeight: FontWeight.bold, fontSize: context.dymaicWidth(0.09)),
      ),
    );
  }

  ButtonLoginWidget buildGoogleButton(BuildContext context) {
    return ButtonLoginWidget(
      widget: Container(
        width: double.infinity,
        height: context.dymaicHeight(0.04),
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(ImageConstant.instance.loginGooglePng),
        )),
      ),
      color: ColorShemeLight.instance.white,
      onPressed: () {},
    );
  }

  ButtonLoginWidget buildFaceButton(BuildContext context) {
    return ButtonLoginWidget(
      widget: Container(
        width: double.infinity,
        height: context.dymaicHeight(0.04),
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(
            ImageConstant.instance.loginFaceookPng,
          ),
        )),
      ),
      color: ColorShemeLight.instance.buttonColorIcon,
      onPressed: () {},
    );
  }
}
