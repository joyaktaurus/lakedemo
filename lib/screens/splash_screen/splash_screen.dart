import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lakeshore/screens/login/login_screen.dart';

import '../../app.dart';
import '../../routes.dart';
import '../../services/privilege_services.dart';
import '../../utils/asset_helper.dart';
import '../../utils/err_m.dart';
import '../../utils/local_store.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.bottom,
    ]);
    new Future.delayed(
        const Duration(seconds: 3), () => Get.offNamed(Routes.login));
  }
  // void initState() {
  //   super.initState();
  //     new Future.delayed(
  //         const Duration(seconds: 3), () => Get.offNamed(Routes.login));
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
  //     await FetchDataFromLocalStore().userData();
  //    // await FetchDataFromLocalStore().suborgData();
  //     App.token = App.customer.token ?? '';
  //     log("token>>${App.customer.token}");
  //     errM(() => checkAlreadyLogged());
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[30],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AssetHelper.splashImage),
              SizedBox(height: Get.height * 0.02),
              Image.asset(AssetHelper.splashTwo)
            ],
          ),
        ),
      ),
    );
  }
  Future<void> checkAlreadyLogged() async {
    Future.delayed(
      const Duration(milliseconds: 1400),
          () async {
        if (App.token.isEmpty) {
          Get.offNamed(Routes.login);
        } else {
          // bool val = PrivilegeServices.checkPermission(resource: 'INVENTORY_ITEMS', permission: ['VIEW']);
          // log('checkpermission >>>$val');
          Get.offNamed(Routes.dashBoardPage);
        }
      },
    );
  }
}
