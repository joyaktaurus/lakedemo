import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ResetController extends GetxController {



  final TextEditingController userCtrl = TextEditingController(text: '');

  final TextEditingController pswdCtrl = TextEditingController(text: '');

  final TextEditingController resetCtrl = TextEditingController(text: '');

  final FocusNode userCtrlfocusNode = FocusNode();

  final FocusNode pswdCtrlfocusNode = FocusNode();

  final FocusNode resetCtrlfocusNode = FocusNode();

  RxBool isLoggingProgress = false.obs;



// void doLogin() async {
//   LocalStore.clearData();
//   log("do login called");
//   isLoggingProgress.value = true;
//   final String username = userCtrl.text;
//   final String pswd = pswdCtrl.text;
//
//   if (!username.isValidEmail()) {
//     userCtrlfocusNode.requestFocus();
//     showMsg('Please provide a valid User Name', 'Invalid');
//     isLoggingProgress.value = false;
//   } else if (!pswd.isValidPassword()['isValid']) {
//     pswdCtrlfocusNode.requestFocus();
//     showMsg(pswd.isValidPassword()['message'], 'Invalid');
//     isLoggingProgress.value = false;
//   } else {
//     final ApiResp resp = await LoginServices.fetchUser(username, pswd);
//     if (resp.ok == false) {
//       MyUtils.msg(resp.msgs);
//       isLoggingProgress.value = false;
//       return;
//     }
//
//     User user = User.fromJson(resp.rdata);
//     user.username = username;
//     App.token = user.token ?? '';
//
//     LocalStore.setData('user_id', user.userid);
//     LocalStore.setData('token', user.token);
//     LocalStore.setData('user_firstname', user.firstname);
//     LocalStore.setData('user_lastname', user.lastname);
//     LocalStore.setData('user_email_verified', user.emailVerified);
//     LocalStore.setData('user_two_factor_required', user.twoFactorRequired);
//     LocalStore.setData('user_rolename', user.rolename);
//     LocalStore.setData('user_cust_id', user.custid);
//     LocalStore.setData('user_cust_name', user.custname);
//     LocalStore.setData('user_root', user.root);
//     LocalStore.setData('user_role_id', user.roleid);
//     LocalStore.setData('user_name', username);
//
//     App.user = user;
//
//     // isLoggingProgress.value = false;
//
//     if (App.token.isEmpty && user.twoFactorRequired == false) {
//       Get.snackbar("Failed", "Login failed", backgroundColor: Colors.red);
//       isLoggingProgress.value = false;
//       return;
//     }
//
//     if (App.token.isNotEmpty) {
//       final ApiResp privilegesResp =
//           await PrivilegeServices.fetchCurrentUserPrivileges();
//       if (privilegesResp.ok == false) {
//         isLoggingProgress.value = false;
//         return;
//       }
//
//       UserPrivileges privileges =
//           UserPrivileges.fromJson(privilegesResp.rdata);
//       List<dynamic> subOrgsEncoded = privileges.suborgs ??
//           [].map((subOrg) => jsonEncode(subOrg.toJson())).toList();
//       List<dynamic> resourcePrivilegesEncoded = privileges
//               .resourcePrivileges ??
//           [].map((privileges) => jsonEncode(privileges.toJson())).toList();
//       List<dynamic> userGridViews = privileges.gridViews ??
//           [].map((gridViews) => jsonEncode(gridViews.toJson())).toList();
//
//       LocalStore.setData('sub_orgs', subOrgsEncoded);
//       LocalStore.setData('resource_privilege', resourcePrivilegesEncoded);
//       LocalStore.setData('grid_views', userGridViews);
//
//       App.subOrgs = privileges.suborgs ?? [];
//       App.resourcePrivilege = privileges.resourcePrivileges ?? [];
//       App.gridView = privileges.gridViews ?? [];
//
//       for (var element in App.subOrgs) {
//         App.suborgDropdown.add(
//           SelectedSuborg(id: element.id, name: element.name),
//         );
//       }
//     }
//
//     if (user.emailVerified == true) {
//       if (user.twoFactorRequired == true) {
//         isLoggingProgress.value = false;
//         Get.toNamed(Routes.twoFactorAuthPage);
//       } else {
//         Get.offAllNamed(Routes.homePage);
//       }
//     } else {
//       showMsg("Email not verified", "Failed");
//     }
//   }
// }
}
