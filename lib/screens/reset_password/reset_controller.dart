import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lakeshore/utils/app_validator.dart';

import '../../app.dart';
import '../../models/api_resp.dart';
import '../../models/login_resp.dart';
import '../../routes.dart';
import '../../services/login_services.dart';
import '../../utils/err_m.dart';
import '../../utils/local_store.dart';
import '../../utils/my_utils.dart';

class ResetController extends GetxController {
  final TextEditingController userCtrl = TextEditingController(text: '');

  final TextEditingController newpswdCtrl = TextEditingController(text: '');

  final TextEditingController newresetCtrl = TextEditingController(text: '');

  final FocusNode userCtrlfocusNode = FocusNode();

  final FocusNode newpswdCtrlfocusNode = FocusNode();

  final FocusNode newresetCtrlfocusNode = FocusNode();

  RxBool isLoggingProgress = false.obs;

  void doSubmit() async {
    LocalStore.clearData();
    log("do login called");
    isLoggingProgress.value = true;
    final String username = userCtrl.text;
    final String pswd = newpswdCtrl.text;
    // Future.delayed(Duration.zero, ()async {
    //   checkIflogged();
    // });

    if (!username.isValidEmail()) {
      userCtrlfocusNode.requestFocus();
      showMsg('Please provide a valid Email/Password', 'Invalid');
      isLoggingProgress.value = false;
    } else if (!pswd.isValidPassword()['isValid']) {
      newpswdCtrlfocusNode.requestFocus();
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
}


