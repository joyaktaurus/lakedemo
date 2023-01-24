import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lakeshore/models/leave_request_model.dart';
import 'package:lakeshore/routes.dart';
import '../../components/background.dart';
import '../../components/dash_container.dart';
import '../../components/request_container.dart';
import '../../my_theme.dart';
import '../../utils/asset_helper.dart';
import '../../utils/my_utils.dart';
import '../leave_request/contr.dart';
import 'myleaves_controller.dart';

class MyLeavesdView extends GetView<MyLeavesController> {
  const MyLeavesdView({Key? key,}) :

        super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<Controller>();
    return GestureDetector(
      onTap: () {
        MyUtils.hideKeyboard();
      },

      child: Scaffold(
        body: Stack(
          children: [
            BackGround(),
            Column(
              children: [
                DashContainer(
                  height: Get.height * 0.33,
                  child: Stack(children: [
                      Image.asset(AssetHelper.loginImage),
                  Stack(children: [
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
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                ]  ),
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
                        ListView.builder(
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: RequestContainer(
                                        width: Get.width * 0.9,
                                        height: Get.height * 0.25,
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

                                                   Text(controller.textController.value.toString(),
                         //'${controller.leaverequest[index].leaveType}',
                                                          //  "Going for a trip",
                                                            style: TextStyle(
                                                                fontSize: 15),
                                                          ),


                                                      Padding(
                                                        padding:
                                                        const EdgeInsets.only(
                                                            top: 5),
                                                        child: ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                      10)),
                                                              backgroundColor:
                                                              Colors.orange[
                                                              100],
                                                              foregroundColor:
                                                              Colors.orange),
                                                          onPressed: () {},
                                                          child: Wrap(
                                                            children: <Widget>[
                                                              Icon(
                                                                Icons.lock_clock,
                                                                color: Colors
                                                                    .orangeAccent,
                                                                size: 24.0,
                                                              ),
                                                              SizedBox(
                                                                width: Get.width *
                                                                    0.02,
                                                              ),
                                                              Text("Pending",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                      20)),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),

                                                  Text(
                                                    "Casual Leave",
                                                    style: TextStyle(
                                                        color: Colors.grey),
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
                                                      RichText(
                                                          text: const TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                    text:
                                                                    'Leave from : ',
                                                                    style: TextStyle(
                                                                      color:
                                                                      Colors.grey,
                                                                      fontSize: 14,
                                                                    )),
                                                                TextSpan(
                                                                    text:
                                                                    'Dec 21, 2022 - ',
                                                                    style: const TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize: 15,
                                                                        fontWeight:
                                                                        FontWeight
                                                                            .w500)),
                                                                TextSpan(
                                                                    text:
                                                                    'Dec 21, 2022',
                                                                    style: const TextStyle(
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize: 15,
                                                                        fontWeight:
                                                                        FontWeight
                                                                            .w500)),
                                                              ])),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: Get.height * 0.03,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Container(
                                                          height:
                                                          Get.height * 0.05,
                                                          width: Get.width * 0.5,
                                                          child:
                                                          SingleChildScrollView(
                                                            child: Text(
                                                              " i am going for a trip to goa, i am going for a trip to goa",
                                                              maxLines: 100,
                                                              overflow:
                                                              TextOverflow
                                                                  .ellipsis,
                                                              style: TextStyle(
                                                                  color:
                                                                  Colors.grey,
                                                                  fontSize: 11,
                                                                  fontStyle:
                                                                  FontStyle
                                                                      .italic),
                                                            ),
                                                          )),
                                                      Row(
                                                        //mainAxisAlignment: MainAxisAlignment.start,
                                                        children: [
                                                          IconButton(
                                                              onPressed: () {},
                                                              icon: Icon(
                                                                Icons.edit,
                                                                color:
                                                                Colors.blue,
                                                                size: 18,
                                                              )),
                                                          IconButton(
                                                            onPressed: () {
                                                              // controller
                                                              //     .removeDecsription();
                                                            },
                                                            icon: const Icon(
                                                              Icons
                                                                  .delete_outline,
                                                              color: Colors.blue,
                                                            ),
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  )
                                                ]))));

                        }),
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
