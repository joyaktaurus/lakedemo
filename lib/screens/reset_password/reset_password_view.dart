import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:lakeshore/components/background.dart';
import 'package:lakeshore/screens/reset_password/reset_controller.dart';
import '../../components/app_buttons.dart';
import '../../my_theme.dart';
import '../../routes.dart';
import '../../utils/asset_helper.dart';
import '../../utils/my_utils.dart';


class ResetPassView extends GetView<ResetController> {
  const ResetPassView({Key? key}) : super(key: key);

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
                  SizedBox(height: Get.height * 0.03),
                  Text(
                    "Reset Password",
                    style: TextStyle(fontSize: 24),
                  ),
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 350),
              child: Container(
                child: Stack(children: [
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: controller.userCtrl,
                            focusNode: controller.userCtrlfocusNode,
                            decoration: textBoxDecoration(
                                'Email',),
                            textInputAction: TextInputAction.next,
                          ),
                        SizedBox(
                          height: Get.height * 0.03,
                          ),
                          TextFormField(
                            obscureText: true,
                            obscuringCharacter: '*',
                            controller: controller.pswdCtrl,
                            focusNode: controller.pswdCtrlfocusNode,
                            decoration: passBoxDecoration(
                              'New Password',
                            ),
                          ),
                         SizedBox(
                           height: Get.height * 0.03,
                          ),
                          TextFormField(
                            obscureText: true,
                            obscuringCharacter: '*',
                            controller: controller.resetCtrl,
                            focusNode: controller.resetCtrlfocusNode,
                            decoration: passBoxDecoration(
                              'Confirm Password',
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
              child: Expanded(
                child: Center(
                  child: Column(children: [
                    MAButton(
                      text: 'Submit',
                      buttonPress: () {
                        Get.offNamed(Routes.dashBoardPage);
                      },
                      isEnabled: true,
                      padding: const EdgeInsets.only(top: 120),
                      height: Get.height * 0.07,
                      width: Get.width * 0.4,
                      clipBehavior: 0,
                      radius: 30,
                    ),
                  ]),
                ),
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
      // width: 15,
      // height: 15,
    ),
    hintStyle: MyTheme.regularTextStyle(textSize: 14, color: Colors.black),
    fillColor: Colors.white,
    filled: true,
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
      // width: 15,
      // height: 15,
    ),
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
