import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:lakeshore/components/background.dart';
import 'package:lakeshore/components/checkbox_widget.dart';

import '../../app.dart';
import '../../components/app_buttons.dart';
import '../../components/rounded_loader.dart';
import '../../my_theme.dart';
import '../../routes.dart';
import '../../services/privileges_resp.dart';
import '../../utils/asset_helper.dart';
import '../../utils/err_m.dart';
import '../../utils/local_store.dart';
import '../../utils/my_utils.dart';
import 'login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          MyUtils.hideKeyboard();
        },
        child: Scaffold(
          body: Stack(children: [
            BackGround(),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 200, left: 40, right: 40),
                child: Column(children: [
                  Image.asset(AssetHelper.lakeSmall),
                  SizedBox(height: Get.height * 0.02),
                  Text(
                    "Login",
                    style: TextStyle(fontSize: 24),
                  ),
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 350),
              child: SingleChildScrollView(
                child: Stack(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Form(
                      // key: controller.formkey,
                      child: Column(
                        children: [
                          TextFormField(
                            toolbarOptions: ToolbarOptions(
                              copy: true,
                              cut: true,
                              selectAll: true,
                              paste: true,
                            ),
                            controller: controller.userCtrl,
                            focusNode: controller.userCtrlfocusNode,
                            decoration: textBoxDecoration('Email'),
                            textInputAction: TextInputAction.next,
                          ),
                          SizedBox(
                            height: Get.height * 0.03,
                          ),
                          TextFormField(
                            toolbarOptions: ToolbarOptions(
                              copy: true,
                              cut: true,
                              selectAll: true,
                              paste: true,
                            ),
                            obscureText: true,
                            obscuringCharacter: '*',
                            controller: controller.pswdCtrl,
                            focusNode: controller.pswdCtrlfocusNode,
                            decoration: passBoxDecoration(
                              'Password',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 500),
              child: SingleChildScrollView(
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CheckBoxWidget(onChanged: (value) {
                                controller.rememberMe.value!.toString();
                                   // userdata.write('islogged', true);
                                   // userdata.write('username',username);
                                   controller.isChecked = !controller.isChecked;
                                },
                                ),
                            Text("Remember me"),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.resetPassPage);
                          },
                          child: Text(
                            "Forgot Password",
                            style: TextStyle(color: Colors.blue, fontSize: 14),
                          ),
                        )
                      ],
                    ),
                  ),
                  Obx(() => controller.isLoggingProgress.value == true
                      ? const RoundedLoader()
                      : FittedBox(
                          child: MAButton(
                            text: 'Login',
                            buttonPress: () {
                              MyUtils.hideKeyboard();
                              errM(() => controller.doLogin());
                              // .............................
                              // final isValidate = controller
                              //     .formkey.currentState!
                              //     .validate();
                              // if (!isValidate) {
                              //   print('Not Valid Form');
                              // } else {
                              //  Get.toNamed(Routes.resetPassPage);
                              // }
                              //
                              //  Get.offNamed(Routes.resetPassPage);
                            },
                            isEnabled: true,
                            padding: const EdgeInsets.all(30),
                            height: Get.height * 0.07,
                            width: Get.width * 0.4,
                            clipBehavior: 0,
                            radius: 30,
                          ),
                        )),
                ]),
              ),
            )
          ]),
        ));
  }
}

InputDecoration textBoxDecoration(hintText) {
  return InputDecoration(
    hintText: hintText,
    prefixIcon: Image.asset(
      AssetHelper.email,
      width: 15,
      height: 15,
    ),
    //isDense: true,
    // contentPadding: EdgeInsets.fromLTRB(5, 5, 5, 0),
    //constraints: BoxConstraints(maxHeight: 60),
    filled: true,
    fillColor: Colors.white,
    hintStyle: MyTheme.regularTextStyle(textSize: 14, color: Colors.black),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: Colors.grey)),
    disabledBorder: InputBorder.none,
  );
}

InputDecoration passBoxDecoration(hintText) {
  return InputDecoration(
    hintText: hintText,
    prefixIcon: Image.asset(
      AssetHelper.password,
      width: 15,
      height: 15,
    ),
    // isDense: true,
    // contentPadding: EdgeInsets.fromLTRB(5, 5, 5, 0),
    hintStyle: MyTheme.regularTextStyle(textSize: 14, color: Colors.black),
    fillColor: Colors.white,
    filled: true,
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: Colors.grey)),
    disabledBorder: InputBorder.none,
  );
}
// RememberMe(isChecked: true,
// iconSize: 15,
// selectedColor: Colors.cyan,
// iconColor: Colors.cyan,
// borderColor: Colors.cyan),
