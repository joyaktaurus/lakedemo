import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lakeshore/components/app_buttons.dart';

import '../app.dart';
import '../routes.dart';
import '../screens/dashboard/dashboard_controller.dart';
import '../services/privileges_resp.dart';
import '../utils/local_store.dart';

void MarkCleanAlert(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30))),
          title: Column(
            children: [
              Text("Exit Application"),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MAButton(
                    buttonPress: () {
                      Get.back();
                    },
                    text: 'Cancel',
                    height: Get.height * 0.05,
                    width: Get.width * 0.25,
                    // fixedsize:Size(50,20),
                    radius: 10,
                    clipBehavior: 10,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  MAButton(
                    buttonPress: () {
                      LocalStore.clearData();
                      App.selectedSuborg = SelectedSuborg(id: -1, name: "All");
                      SystemNavigator.pop();
                      //Get.offNamed(Routes.login);
                    },
                    text: 'Logout',
                    height: Get.height * 0.05,
                    width: Get.width * 0.25,
                    // fixedsize:Size(50,20),
                    radius: 10,
                    clipBehavior: 10,
                  ),
                ],
              ),
            ],
          ),
        );
      });
}

void RemoveProfileAlert(BuildContext context) {
  DashboardController dashboardController = Get.put(DashboardController());
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30))),
          title: Column(
            children: [
              Text(
                "Remove profile photo?",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MAButton(
                    buttonPress: () {
                      Get.back();
                    },
                    text: 'Cancel',
                    height: Get.height * 0.05,
                    width: Get.width * 0.25,
                    // fixedsize:Size(50,20),
                    radius: 10,
                    clipBehavior: 10,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  MAButton(
                    buttonPress: () {
                      dashboardController.removeImages();
                    },
                    text: 'Remove',
                    height: Get.height * 0.05,
                    width: Get.width * 0.25,
                    // fixedsize:Size(50,20),
                    radius: 10,
                    clipBehavior: 10,
                  ),
                ],
              ),
            ],
          ),
        );
      });
}
