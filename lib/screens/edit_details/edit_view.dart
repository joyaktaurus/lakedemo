import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:lakeshore/components/request_container.dart';

import '../../components/background.dart';
import '../../my_theme.dart';
import '../../routes.dart';
import '../../utils/my_utils.dart';
import 'edit_controller.dart';

class EditView extends GetView<EditViewController> {
  const EditView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          MyUtils.hideKeyboard();
        },
        child: Scaffold(
            body: Stack(children: [
          BackGround(),
          Column(
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
                          color: Colors.blue,
                          size: 35,
                        )),
                    SizedBox(width: Get.width * 0.20),
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.blue,
                    )
                  ],
                ),
              ),
              ]
          ),

              Padding(
                padding: const EdgeInsets.only(top: 130),
                child: Column(
                  children: [
                    RequestContainer(
                      width: Get.width * 0.9,
                      height: Get.height * 0.31,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Profile Details",
                              style: MyTheme.regularTextStyle(
                                  color: Colors.black,
                                  textSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                            Divider(
                              thickness: 2,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Employee ID : ",
                                  style: MyTheme.regularTextStyle(
                                      color: Colors.black,
                                      textSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "XXX XXX XX",
                                  style: MyTheme.regularTextStyle(
                                      color: Colors.black,
                                      textSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Name : ",
                                  style: MyTheme.regularTextStyle(
                                      color: Colors.black,
                                      textSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "Amilia",
                                  style: MyTheme.regularTextStyle(
                                      color: Colors.black,
                                      textSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Gender : ",
                                  style: MyTheme.regularTextStyle(
                                      color: Colors.black,
                                      textSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "Female",
                                  style: MyTheme.regularTextStyle(
                                      color: Colors.black,
                                      textSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "E-mail : ",
                                  style: MyTheme.regularTextStyle(
                                      color: Colors.black,
                                      textSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "abcd@gmail.com",
                                  style: MyTheme.regularTextStyle(
                                      color: Colors.black,
                                      textSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Gender : ",
                                  style: MyTheme.regularTextStyle(
                                      color: Colors.black,
                                      textSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "Female",
                                  style: MyTheme.regularTextStyle(
                                      color: Colors.black,
                                      textSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Date of Birth : ",
                                  style: MyTheme.regularTextStyle(
                                      color: Colors.black,
                                      textSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "11-08-2000",
                                  style: MyTheme.regularTextStyle(
                                      color: Colors.black,
                                      textSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Phone Number : ",
                                  style: MyTheme.regularTextStyle(
                                      color: Colors.black,
                                      textSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "1234567890",
                                  style: MyTheme.regularTextStyle(
                                      color: Colors.black,
                                      textSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Qualification : ",
                                  style: MyTheme.regularTextStyle(
                                      color: Colors.black,
                                      textSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "GNM",
                                  style: MyTheme.regularTextStyle(
                                      color: Colors.black,
                                      textSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Marital Status : ",
                                  style: MyTheme.regularTextStyle(
                                      color: Colors.black,
                                      textSize: 13,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "Married",
                                  style: MyTheme.regularTextStyle(
                                      color: Colors.black,
                                      textSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                RequestContainer(
                    width: Get.width * 0.9,
                    height: Get.height * 0.19,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Job Details",
                            style: MyTheme.regularTextStyle(
                                color: Colors.black,
                                textSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          Divider(
                            thickness: 2,
                          ),
                          Row(
                            children: [
                              Text(
                                "Branch : ",
                                style: MyTheme.regularTextStyle(
                                    color: Colors.black,
                                    textSize: 13,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "Kochi",
                                style: MyTheme.regularTextStyle(
                                    color: Colors.black,
                                    textSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Category : ",
                                style: MyTheme.regularTextStyle(
                                    color: Colors.black,
                                    textSize: 13,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "Nurse",
                                style: MyTheme.regularTextStyle(
                                    color: Colors.black,
                                    textSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Designation : ",
                                style: MyTheme.regularTextStyle(
                                    color: Colors.black,
                                    textSize: 13,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "GNM",
                                style: MyTheme.regularTextStyle(
                                    color: Colors.black,
                                    textSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Date of Joining : ",
                                style: MyTheme.regularTextStyle(
                                    color: Colors.black,
                                    textSize: 13,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "13-01-2011",
                                style: MyTheme.regularTextStyle(
                                    color: Colors.black,
                                    textSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
                RequestContainer(
                    width: Get.width * 0.9,
                    height: Get.height * 0.21,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Bank Details",
                            style: MyTheme.regularTextStyle(
                                color: Colors.black,
                                textSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          Divider(
                            thickness: 2,
                          ),
                          Row(
                            children: [
                              Text(
                                "Account Holder Name : ",
                                style: MyTheme.regularTextStyle(
                                    color: Colors.black,
                                    textSize: 13,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "Amilia",
                                style: MyTheme.regularTextStyle(
                                    color: Colors.black,
                                    textSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Account Number : ",
                                style: MyTheme.regularTextStyle(
                                    color: Colors.black,
                                    textSize: 13,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "xxxx xxxx xxxx",
                                style: MyTheme.regularTextStyle(
                                    color: Colors.black,
                                    textSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Bank Name : ",
                                style: MyTheme.regularTextStyle(
                                    color: Colors.black,
                                    textSize: 13,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "The Federal Bank LTD",
                                style: MyTheme.regularTextStyle(
                                    color: Colors.black,
                                    textSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "IFSC Code : ",
                                style: MyTheme.regularTextStyle(
                                    color: Colors.black,
                                    textSize: 13,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "xx xx xx",
                                style: MyTheme.regularTextStyle(
                                    color: Colors.black,
                                    textSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Branch : ",
                                style: MyTheme.regularTextStyle(
                                    color: Colors.black,
                                    textSize: 13,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "Kizhakkambalam",
                                style: MyTheme.regularTextStyle(
                                    color: Colors.black,
                                    textSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                )
                  ],
                ),
              ),
            ],

          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.toNamed(Routes.editFormViewPage);
            },
            tooltip: 'Increment',
            child: const Icon(Icons.edit),
          ),
        )
    );
  }
}
