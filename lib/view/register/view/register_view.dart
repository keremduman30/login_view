// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_unnecessary_containers, avoid_print

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_guide_examples/core/base/view/base_view.dart';
import 'package:flutter_guide_examples/core/extension/context_extension.dart';
import 'package:flutter_guide_examples/core/init/theme/light/color_sheme_light.dart';
import 'package:flutter_guide_examples/view/_product/register_form_widget.dart';
import 'package:flutter_guide_examples/view/register/view_model/register_view_model.dart';
import 'package:get/get.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return BaseView<RegisterViewModel>(
      viewModel: RegisterViewModel(),
      onModelReady: (viewmodel) {
        viewmodel.init();
        viewmodel.setContext(context);
      },
      onPageBuilder: (BuildContext context, RegisterViewModel viewModel) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              viewModel.fetchBack();
            },
            icon: Icon(
              Icons.keyboard_arrow_left,
              size: context.mediumValue,
              color: Colors.black,
            ),
          ),
        ),
        body: Obx(
          () => SingleChildScrollView(
            child: viewModel.registerLoading.value
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Padding(
                    padding: context.paddingMedium,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: context.dymaicWidth(0.001)),
                        buildTextTitle(context),
                        SizedBox(height: context.dymaicHeight(0.03)),
                        buildDescriptionText(),
                        SizedBox(height: context.dymaicHeight(0.05)),
                        Container(
                          child: buildForm(controller, context, viewModel),
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  Text buildTextTitle(BuildContext context) {
    return Text(
      "Register",
      style: context.textThem.headline5!.copyWith(
        fontWeight: FontWeight.bold,
        color: Colors.black.withOpacity(0.7),
      ),
    );
  }

  AutoSizeText buildDescriptionText() {
    return AutoSizeText(
      'Create your new account.We are glad that you joined us',
      overflow: TextOverflow.ellipsis,
      presetFontSizes: [22, 20, 32],
      maxLines: 4,
      style: TextStyle(color: Colors.grey),
    );
  }

  Form buildForm(TextEditingController controller, BuildContext context, RegisterViewModel viewModel) {
    return Form(
      key: viewModel.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RegisterFormWidget(
            textHidden: false,
            icon: Icons.email,
            label: "email",
            controller: viewModel.email,
            validator: viewModel.fetchEmailValidator,
          ),
          SizedBox(height: context.dymaicHeight(0.03)),
          RegisterFormWidget(
            textHidden: false,
            icon: Icons.person,
            label: "user name",
            controller: viewModel.userName,
            validator: viewModel.fetchValidator,
          ),
          SizedBox(height: context.dymaicHeight(0.03)),
          Obx(
            () => RegisterFormWidget(
                textHidden: viewModel.checkPassword.value ? false : true,
                icon: Icons.lock,
                label: "password",
                controller: viewModel.password,
                validator: viewModel.fetchValidator,
                suffixIcon: IconButton(
                  icon: Icon(viewModel.checkPassword.value ? Icons.lock_open : Icons.lock),
                  onPressed: () {
                    viewModel.changeTextHidden();
                  },
                )),
          ),
          SizedBox(
            height: context.dymaicHeight(0.08),
          ),
          GestureDetector(
            onTap: () {
              print("tıklanıldı");
            },
            child: buildRegisterButton(context, viewModel),
          ),
        ],
      ),
    );
  }

  Container buildRegisterButton(BuildContext context, RegisterViewModel viewModel) {
    return Container(
      width: double.infinity,
      height: context.dymaicWidth(0.12),
      decoration: BoxDecoration(
        color: ColorShemeLight.instance.buttonColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: ColorShemeLight.instance.buttonColor),
        onPressed: () {
          viewModel.fetchRegisterButton();
        },
        child: Text(
          "Register",
          style: context.textThem.headline6!.copyWith(color: Colors.white, fontSize: 19),
        ),
      ),
    );
  }
}
