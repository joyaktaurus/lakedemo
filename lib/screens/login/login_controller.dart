import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lakeshore/utils/app_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app.dart';
import '../../models/api_resp.dart';
import '../../models/login_resp.dart';
import '../../routes.dart';
import '../../services/login_services.dart';
import '../../services/privilege_services.dart';
import '../../services/privileges_resp.dart';
import '../../utils/err_m.dart';
import '../../utils/local_store.dart';
import '../../utils/my_utils.dart';

class LoginController extends GetxController {
  bool isChecked = false;

  // final Rx<bool> isChecked = Rx<bool>;

  // void toggleCheckbox() {
  //   isChecked = !isChecked;
  // }

  final TextEditingController userCtrl = TextEditingController(text: '');

  final TextEditingController pswdCtrl = TextEditingController(text: '');

  final FocusNode userCtrlfocusNode = FocusNode();

  final FocusNode pswdCtrlfocusNode = FocusNode();

  RxBool isLoggingProgress = false.obs;

  final userdata = GetStorage().obs;


  void doLogin() async {
    LocalStore.clearData();
    log("do login called");
    isLoggingProgress.value = true;
    final String username = userCtrl.text;
    final String pswd = pswdCtrl.text;
    // Future.delayed(Duration.zero, ()async {
    //   checkIflogged();
    // });

    if (!username.isValidEmail()) {
      userCtrlfocusNode.requestFocus();
      showMsg('Please provide a valid Email/Password', 'Invalid');
      isLoggingProgress.value = false;
    } else if (!pswd.isValidPassword()['isValid']) {
      pswdCtrlfocusNode.requestFocus();
      showMsg(pswd.isValidPassword()['message'], 'Invalid');
      isLoggingProgress.value = false;
    } else {
      final ApiResp resp = await LoginServices.fetchUser(username, pswd);
      if (resp.ok == false) {
        MyUtils.msg(resp.msgs);
        isLoggingProgress.value = false;
        return;
      }

      User user = User.fromJson(resp.rdata);
      user.username = username;
      App.token = user.token ?? '';
      LocalStore.setData('user_id', user.userid);
      LocalStore.setData('token', user.token);
      LocalStore.setData('user_firstname', user.firstname);
      LocalStore.setData('user_lastname', user.lastname);
      LocalStore.setData('user_email_verified', user.emailVerified);
      LocalStore.setData('user_name', username);

      App.user = user;

      if (user.emailVerified == true) {



        Get.offAllNamed(Routes.dashBoardPage);
      } else {
        showMsg("Email not verified", "Failed");
      }
    }
  }

 //  void checkIflogged() {
 // userdata.read('islogged') ? Get.offAll(Routes.dashBoardPage) : Get.offAll(Routes.login);
 //  }
}
