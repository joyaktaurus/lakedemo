import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lakeshore/components/request_container.dart';
import '../../components/background.dart';
import '../../components/dash_container.dart';
import '../../my_theme.dart';
import '../../utils/asset_helper.dart';
import '../../utils/my_utils.dart';

import 'myshift_controller.dart';

class MyShiftView extends GetView<MyShiftController> {
  const MyShiftView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return GestureDetector(
        onTap: () {
          MyUtils.hideKeyboard();
        },
        child: Scaffold(
            body: Stack(children: [
       //   BackGround(),
          Column(children: [
            DashContainer(
              height: Get.height * 0.28,
              child: Stack(children: [
                  Image.asset(AssetHelper.loginImage), Column(
            children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 50),
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          splashColor: Colors.grey[300],
                          splashRadius: 40,
                          icon: Icon(
                            Icons.arrow_back_rounded,
                            color: Colors.white,
                            size: 35,
                          )),
                      SizedBox(width: Get.width * 0.15),
                      Text(
                        "My Shift",
                        style: MyTheme.regularTextStyle(
                            color: Colors.white,
                            textSize: 24,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
                SizedBox(height: Get.height * 0.03),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(AssetHelper.lakeSmall),
                      ),
                      SizedBox(width: Get.width * 0.03),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Amelia",
                            style: MyTheme.regularTextStyle(
                                color: Colors.white,
                                textSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "Emp-Id: 1234 5678",
                            style: MyTheme.regularTextStyle(
                              color: Colors.white,
                              textSize: 14,
                            ),
                          ),

                        ],
                      )
                    ],
                  ),
                ),
            ],
                ),
             ] ),
            ),

            Expanded(
              child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (OverscrollIndicatorNotification overscroll) {
              overscroll.disallowIndicator();
              return true;
            },
            child: RefreshIndicator(
              onRefresh: () {
                return Future.delayed(Duration(seconds: 1));
              },
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return RequestContainer(
                      width: Get.width * 0.9,
                      height: Get.height * 0.18,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Shift 1",
                              style: TextStyle(
                                  color: Colors.cyan[600],
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: Get.height * 0.01,
                            ),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                    text: const TextSpan(children: [
                                  TextSpan(
                                      text: 'Start Date : ',
                                      style: TextStyle(
                                          color: Colors.cyan,
                                          fontSize: 14)),
                                  TextSpan(
                                      text: 'Dec 21, 2022',
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 13))
                                ])),
                                RichText(
                                    text: const TextSpan(children: [
                                  TextSpan(
                                      text: 'End Date : ',
                                      style: TextStyle(
                                          color: Colors.cyan,
                                          fontSize: 14)),
                                  TextSpan(
                                      text: 'Dec 21, 2022',
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 13))
                                ])),
                              ],
                            ),
                            SizedBox(
                              height: Get.height * 0.01,
                            ),
                            RichText(
                                text: const TextSpan(children: [
                              TextSpan(
                                  text: 'Time : ',
                                  style: TextStyle(
                                      color: Colors.cyan, fontSize: 14)),
                              TextSpan(
                                  text: '9 am to 6 pm',
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 13))
                            ])),
                            SizedBox(
                              height: Get.height * 0.01,
                            ),
                            RichText(
                                text: const TextSpan(children: [
                              TextSpan(
                                  text: 'Department : ',
                                  style: TextStyle(
                                      color: Colors.cyan, fontSize: 14)),
                              TextSpan(
                                  text: 'Emergency Medicine',
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 13))
                            ])),
                          ],
                        ),
                      ));
                },
              ),
            ),
              ),
            )
          ])
        ])));
  }
}
