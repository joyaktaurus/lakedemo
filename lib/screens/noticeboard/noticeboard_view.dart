import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../components/background.dart';
import '../../my_theme.dart';
import '../../utils/my_utils.dart';
import 'noticeboard_controller.dart';

class NoticeBoardView extends GetView<NoticeBoardController> {
  const NoticeBoardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          MyUtils.hideKeyboard();
        },
        child: Scaffold(
            body: Stack(children: [
          BackGround(
          child: Padding(
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
            SizedBox(width: Get.width * 0.15),
            Text(
              "Notice Board",
              style: MyTheme.regularTextStyle(
                  color: Colors.blue,
                  textSize: 24,
                  fontWeight: FontWeight.w500),
            )
              ],
            ),
          ),),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 100),
            child: Expanded(
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
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10, left: 20, right: 20,bottom: 20),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade200,
                                spreadRadius: 0.01,
                                //  blurRadius: 1,
                                offset: Offset(1, 1,), // Shadow position
                              ),
                              BoxShadow(
                                color: Colors.grey.shade300,
                                spreadRadius: 1,
                                blurRadius: 12,
                                //offset: Offset(10, 10,), // Shadow position
                              ),
                            ]),
                        // width: Get.width * 0.9,
                        // height: Get.height * 0.20,
                        child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 20,bottom: 0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Notice Board",
                                    style: TextStyle(
                                        color: Colors.cyan[600],
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.01,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    children: [
                                        Text(
                                             'Posted On : ',
                                            style: TextStyle(
                                                color: Colors.cyan,
                                                fontSize: 14)),
                                        Text(controller.getCurrentDate(),
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 13))
                                    ],
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.015,
                                  ),
                                  Obx(
                                    () => Column(children: [
                                      buildText(
                                          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 200),
                                        child: TextButton(
                                            onPressed: () {
                                              controller.isReadmore.value =
                                                  !controller
                                                      .isReadmore.value;
                                            },
                                            child: Text(
                                              (controller.isReadmore.value
                                                  ? 'Read Less'
                                                  : 'Read More'),
                                              // style: TextStyle(color: Colors.cyan),
                                            )),
                                      )
                                    ]),
                                  ),
                                ]))),
                  );
                },
              ),
            ),
              ),
            ),
          )
        ])));
  }

  Widget buildText(String text) {
    // if read more is false then show only 3 lines from text
    // else show full text
    final lines = controller.isReadmore.value ? null : 2;
    return Text(
      text,
      textAlign: TextAlign.start,
      style: TextStyle(fontSize: 13),
      maxLines: lines,
      // overflow properties is used to show 3 dot in text widget
      // so that user can understand there are few more line to read.
      overflow: controller.isReadmore.value
          ? TextOverflow.visible
          : TextOverflow.ellipsis,
    );
  }
}
