import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lakeshore/models/leave_request_model.dart';
import 'package:lakeshore/routes.dart';
import 'package:lakeshore/screens/leave_request/leave_request_controller.dart';
import '../../components/background.dart';
import '../../components/dash_container.dart';
import '../../components/request_container.dart';
import '../../components/rounded_loader.dart';
import '../../my_theme.dart';
import '../../utils/asset_helper.dart';
import '../../utils/my_utils.dart';

import 'myleaves_controller.dart';

class MyLeavesdView extends GetView<MyLeavesController> {
  const MyLeavesdView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LeaveRequestController ccontroller = Get.put(LeaveRequestController());
   // final MyLeavesController controller = Get.put(MyLeavesController());
    return GestureDetector(
      onTap: () {
        MyUtils.hideKeyboard();
      },
      child: Scaffold(
        body: Stack(
          children: [
            //  BackGround(),
            Column(
              children: [
                DashContainer(
                  height: Get.height * 0.33,
                  child: Stack(children: [
                    Image.asset(AssetHelper.loginImage),
                    Stack(children: [
                      Image.asset(AssetHelper.loginImage),
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
                                      color: Colors.white,
                                      size: 35,
                                    )),
                                SizedBox(width: Get.width * 0.15),
                                Text(
                                  "My Leaves",
                                  style: MyTheme.regularTextStyle(
                                      color: Colors.white,
                                      textSize: 24,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: Get.height * 0.01),
                          Padding(
                            padding: const EdgeInsets.only(left: 40),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage:
                                  AssetImage(AssetHelper.lakeSmall),
                                ),
                                SizedBox(width: Get.width * 0.02),
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
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: Get.height * 0.001),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 10),
                            child: Container(
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: [
                                  Image.asset(AssetHelper.briefcase),
                                  SizedBox(width: Get.width * 0.02),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "30",
                                          style: MyTheme.regularTextStyle(
                                              color: Colors.white,
                                              textSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Total Leave",
                                          style: MyTheme.regularTextStyle(
                                            color: Colors.white,
                                            textSize: 14,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Image.asset(AssetHelper.briefcase),
                                  SizedBox(width: Get.width * 0.02),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "12",
                                          style: MyTheme.regularTextStyle(
                                              color: Colors.white,
                                              textSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Sick Leave",
                                          style: MyTheme.regularTextStyle(
                                            color: Colors.white,
                                            textSize: 14,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Image.asset(AssetHelper.briefcase),
                                  SizedBox(width: Get.width * 0.02),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "18",
                                          style: MyTheme.regularTextStyle(
                                              color: Colors.white,
                                              textSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Casual Leave",
                                          style: MyTheme.regularTextStyle(
                                            color: Colors.white,
                                            textSize: 14,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
                  ]),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        ccontroller.updateStatus("Approved");
                      },
                      child: Container(
                        height: 30,
                        width: 100,
                        color: Colors.green[200],
                        child: Center(child: Text("Approved")),
                      ),
                    ),
                   SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        ccontroller.updateStatus("Cancelled");
                      },
                      child: Container(
                        height: 30,
                        width: 100,
                        color: Colors.green[200],
                        child: Center(child: Text("Cancelled")),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () {
                      return Future.delayed(Duration(seconds: 1));
                    },
                    child:
                    NotificationListener<OverscrollIndicatorNotification>(
                      onNotification:
                          (OverscrollIndicatorNotification overscroll) {
                        overscroll.disallowIndicator();
                        return true;
                      },
                      child:
                      Obx(() =>
                              ListView.builder(
                                  itemCount: ccontroller.lrequest.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    final lperson = ccontroller.lrequest[index];
                                    return Column(
                                children: [
                                  // if(ccontroller.statuss == ccontroller.pending)true?
                                  RequestContainer(
                                      width: Get.width * 0.9,
                                      height: Get.height * 0.23,
                                      child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, right: 20),
                                          child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    Text(
                                                      // Get.arguments[ "reason"],
                                                      "Going for a trip",
                                                      style: TextStyle(
                                                          fontSize: 15),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .only(
                                                          top: 5),
                                                      child: SizedBox(
                                                        width: 132,
                                                        child: ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                              shape:
                                                              RoundedRectangleBorder(
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      10)),
                                                              backgroundColor:
                                                              Colors
                                                                  .orange[100],
                                                              foregroundColor:
                                                              Colors.orange),
                                                          onPressed: () {},
                                                          child: Wrap(
                                                            children: <Widget>[
                                                              Row(
                                                                children: [
                                                                  Image.asset(
                                                                    AssetHelper
                                                                        .clock,
                                                                    color: Colors
                                                                        .orange[500],),

                                                                  SizedBox(
                                                                    width: Get
                                                                        .width *
                                                                        0.02,
                                                                  ),
                                                                  Obx( () =>
                                                                   Text(ccontroller.statuss.value,
                                                                       // "Pending",
                                                                        style: TextStyle(
                                                                            fontSize: 16)),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Text(lperson.leaveType,
                                                 //"ghjg",
                                                  //  Get.arguments["LeaveType"],
                                                  style:
                                                  TextStyle(color: Colors.grey),
                                                ),
                                                SizedBox(
                                                  height: Get.height * 0.01,
                                                ),
                                                Row(
                                                  children: [
                                                    Image.asset(
                                                        AssetHelper.calender),
                                                    SizedBox(
                                                      width: Get.width * 0.03,
                                                    ),
                                                    Row(children: [
                                                      Text(
                                                          'Leave from : ',
                                                          style: TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 14,
                                                          )),
                                                      Text(lperson.startDate,
                                                        // Get
                                                        //     .arguments[ "StartDate"],
                                                          //'Dec 21, 2022',
                                                          style: const TextStyle(
                                                              color: Colors
                                                                  .black,
                                                              fontSize: 13,
                                                              fontWeight:
                                                              FontWeight.w500)),
                                                      Text(" - "),
                                                      Text(lperson.endDate,
                                                          //'Dec 21, 2022',
                                                          // Get
                                                          //     .arguments[ "EndDate"],
                                                          style: const TextStyle(
                                                              color: Colors
                                                                  .black,
                                                              fontSize: 13,
                                                              fontWeight:
                                                              FontWeight.w500)),
                                                    ]),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: Get.height * 0.02,
                                                ),
                                                if(ccontroller.statuss == "pending")
                                                  Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    Container(
                                                      height: Get.height * 0.07,
                                                      width: Get.width * 0.5,
                                                      child: Padding(
                                                        padding: const EdgeInsets
                                                            .only(bottom: 5),
                                                        child: SingleChildScrollView(
                                                          child:
                                                         //  (ccontroller.startEnable.length)
                                                         // ?
                                                          Text(
                                                            lperson.yourReason,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .grey,
                                                                fontSize: 11,
                                                                fontStyle:
                                                                FontStyle
                                                                    .italic),
                                                          )
                                                              // : Text("Reason for leave",
                                                              // style: TextStyle(
                                                              // color: Colors
                                                              //     .grey,
                                                              // fontSize: 11,
                                                              // fontStyle:
                                                              // FontStyle
                                                              // .italic),)
                                                        ),
                                                      ),
                                                    ),
                                                    IconButton(
                                                        onPressed: () {
                                                          Get.offNamed(Routes
                                                              .leaveRequestPage);
                                                        },
                                                        icon: Icon(
                                                          Icons.edit,
                                                          color: Colors.blue,
                                                          size: 18,
                                                        )),

                                                    IconButton(
                                                      onPressed: () {
                                                        ccontroller.deleteContainer();
                                                      },
                                                      icon: const Icon(
                                                        Icons.delete_outline,
                                                        color: Colors.blue,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ]
                                          )
                                      )),
                                  // RequestContainer(
                                  //     width: Get.width * 0.9,
                                  //     height: Get.height * 0.15,
                                  //     child: Padding(
                                  //         padding: const EdgeInsets.only(
                                  //             left: 20, right: 20),
                                  //         child: Column(
                                  //             crossAxisAlignment:
                                  //             CrossAxisAlignment.start,
                                  //             children: [
                                  //               Row(
                                  //                 mainAxisAlignment:
                                  //                 MainAxisAlignment
                                  //                     .spaceBetween,
                                  //                 children: [
                                  //                   Text(
                                  //                     // Get.arguments[ "reason"],
                                  //                     "Going for a trip",
                                  //                     style: TextStyle(
                                  //                         fontSize: 15),
                                  //                   ),
                                  //                   Padding(
                                  //                     padding: const EdgeInsets
                                  //                         .only(
                                  //                         top: 5),
                                  //                     child: ElevatedButton(
                                  //                       style: ElevatedButton
                                  //                           .styleFrom(
                                  //                           shape:
                                  //                           RoundedRectangleBorder(
                                  //                               borderRadius:
                                  //                               BorderRadius
                                  //                                   .circular(
                                  //                                   10)),
                                  //                           backgroundColor:
                                  //                           Colors.green[100],
                                  //                           foregroundColor:
                                  //                           Colors.orange),
                                  //                       onPressed: () {},
                                  //                       child: Wrap(
                                  //                         children: <Widget>[
                                  //                           Row(
                                  //                             children: [
                                  //                               Image.asset(
                                  //                                   AssetHelper
                                  //                                       .clock,
                                  //                                   color: Colors
                                  //                                       .green),
                                  //
                                  //                               SizedBox(
                                  //                                 width: Get
                                  //                                     .width *
                                  //                                     0.02,
                                  //                               ),
                                  //                               Text("Approved",
                                  //                                   style: TextStyle(
                                  //                                     fontSize: 16,
                                  //                                     color:
                                  //                                     Colors
                                  //                                         .green,)),
                                  //                             ],
                                  //                           ),
                                  //                         ],
                                  //                       ),
                                  //                     ),
                                  //                   ),
                                  //                 ],
                                  //               ),
                                  //               Text(
                                  //                 'fhgcfhd',
                                  //                 //  Get.arguments["LeaveType"],
                                  //                 style:
                                  //                 TextStyle(color: Colors.grey),
                                  //               ),
                                  //               SizedBox(
                                  //                 height: Get.height * 0.01,
                                  //               ),
                                  //               Row(
                                  //                 children: [
                                  //                   Image.asset(
                                  //                       AssetHelper.calender),
                                  //                   SizedBox(
                                  //                     width: Get.width * 0.03,
                                  //                   ),
                                  //                   Row(children: [
                                  //                     Text('Leave from : ',
                                  //                         style: TextStyle(
                                  //                           color: Colors.grey,
                                  //                           fontSize: 14,
                                  //                         )),
                                  //                     Text(
                                  //                       // Get
                                  //                       //     .arguments[ "StartDate"],
                                  //                         'Dec 21, 2022',
                                  //                         style: const TextStyle(
                                  //                             color: Colors
                                  //                                 .black,
                                  //                             fontSize: 13,
                                  //                             fontWeight:
                                  //                             FontWeight.w500)),
                                  //                     Text(" - "),
                                  //                     Text('Dec 21, 2022',
                                  //                         // Get
                                  //                         //     .arguments[ "EndDate"],
                                  //                         style: const TextStyle(
                                  //                             color: Colors
                                  //                                 .black,
                                  //                             fontSize: 13,
                                  //                             fontWeight:
                                  //                             FontWeight.w500)),
                                  //                   ]),
                                  //                 ],
                                  //               ),
                                  //             ]))),
                                  // RequestContainer(
                                  //     width: Get.width * 0.9,
                                  //     height: Get.height * 0.15,
                                  //     child: Padding(
                                  //         padding: const EdgeInsets.only(
                                  //             left: 20, right: 20),
                                  //         child: Column(
                                  //             crossAxisAlignment:
                                  //             CrossAxisAlignment.start,
                                  //             children: [
                                  //               Row(
                                  //                 mainAxisAlignment:
                                  //                 MainAxisAlignment
                                  //                     .spaceBetween,
                                  //                 children: [
                                  //                   Text(
                                  //                     // Get.arguments[ "reason"],
                                  //                     "Going for a trip",
                                  //                     style: TextStyle(
                                  //                         fontSize: 15),
                                  //                   ),
                                  //                   Padding(
                                  //                     padding: const EdgeInsets
                                  //                         .only(
                                  //                         top: 5),
                                  //                     child: ElevatedButton(
                                  //                       style: ElevatedButton
                                  //                           .styleFrom(
                                  //                           shape:
                                  //                           RoundedRectangleBorder(
                                  //                               borderRadius:
                                  //                               BorderRadius
                                  //                                   .circular(
                                  //                                   10)),
                                  //                           backgroundColor:
                                  //                           Colors.red[100],
                                  //                           foregroundColor:
                                  //                           Colors.orange),
                                  //                       onPressed: () {},
                                  //                       child: Wrap(
                                  //                         children: <Widget>[
                                  //                           Row(
                                  //                             children: [
                                  //                               Image.asset(
                                  //                                   AssetHelper
                                  //                                       .clock,
                                  //                                   color: Colors
                                  //                                       .red),
                                  //                               SizedBox(
                                  //                                 width: Get
                                  //                                     .width *
                                  //                                     0.02,
                                  //                               ),
                                  //                               Text(
                                  //                                   "Cancelled",
                                  //                                   style: TextStyle(
                                  //                                     fontSize: 16,
                                  //                                     color:
                                  //                                     Colors
                                  //                                         .red,)),
                                  //                             ],
                                  //                           ),
                                  //                         ],
                                  //                       ),
                                  //                     ),
                                  //                   ),
                                  //                 ],
                                  //               ),
                                  //               Text(
                                  //                 'fhgcfhd',
                                  //                 //  Get.arguments["LeaveType"],
                                  //                 style:
                                  //                 TextStyle(color: Colors.grey),
                                  //               ),
                                  //               SizedBox(
                                  //                 height: Get.height * 0.01,
                                  //               ),
                                  //               Row(
                                  //                 children: [
                                  //                   Image.asset(
                                  //                       AssetHelper.calender),
                                  //                   SizedBox(
                                  //                     width: Get.width * 0.03,
                                  //                   ),
                                  //                   Row(children: [
                                  //                     Text('Leave from : ',
                                  //                         style: TextStyle(
                                  //                           color: Colors.grey,
                                  //                           fontSize: 14,
                                  //                         )),
                                  //                     Text(
                                  //                       // Get
                                  //                       //     .arguments[ "StartDate"],
                                  //                         'Dec 21, 2022',
                                  //                         style: const TextStyle(
                                  //                             color: Colors
                                  //                                 .black,
                                  //                             fontSize: 13,
                                  //                             fontWeight:
                                  //                             FontWeight.w500)),
                                  //                     Text(" - "),
                                  //                     Text('Dec 21, 2022',
                                  //                         // Get
                                  //                         //     .arguments[ "EndDate"],
                                  //                         style: const TextStyle(
                                  //                             color: Colors
                                  //                                 .black,
                                  //                             fontSize: 13,
                                  //                             fontWeight:
                                  //                             FontWeight.w500)),
                                  //                   ]),
                                  //                 ],
                                  //               ),
                                  //             ]))),
                                ],
                              );

                                }

                            )
                            ),
                          ),
                  ),
                ),
                 ],
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(Routes.leaveRequestPage);
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}