import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lakeshore/components/screen_dash_views.dart';
import 'package:lakeshore/screens/dashboard/dashboard_controller.dart';
import 'package:lakeshore/screens/leave_request/leave_request_view.dart';
import '../../app.dart';
import '../../components/background.dart';
import '../../components/dash_container.dart';
import '../../components/screenn_dash_views.dart';
import '../../my_theme.dart';
import '../../routes.dart';
import '../../services/privileges_resp.dart';
import '../../utils/asset_helper.dart';
import '../../utils/local_store.dart';
import '../../utils/my_utils.dart';

class DashBoardView extends GetView<DashboardController> {
  const DashBoardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        MyUtils.hideKeyboard();
      },
      child: Scaffold(
          body: Stack(children: [
            Column(children: [
              DashContainer(
                height: Get.height * 0.45,
                child:  Stack(children: [
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
                              "Dash Board",
                              style: MyTheme.regularTextStyle(
                                  color: Colors.white,
                                  textSize: 24,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: Get.height * 0.03),
                      GestureDetector(
                        onTap: () async {
                          await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return SimpleDialog(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                    title: Center(
                                        child: Text(
                                      "Pick image from",
                                      style: TextStyle(fontSize: 18),
                                    )),
                                    children: [
                                      Container(height: 100,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [

                                               Column(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                               IconButton(
                                                        onPressed: () {
                                                          controller.takePhoto(ImageSource.camera);
                                                          Get.back();
                                                          // print(controller.pickedfile.value);
                                                        //  controller.imageFromCamera();
                                                          },
                                                        icon: Icon(
                                                          Icons.camera_alt,
                                                          color: Colors.blue,
                                                          size: 50,
                                                        )),

                                                  SizedBox(height: Get.height * 0.01),
                                                  Text("Camera", style: TextStyle(fontSize: 18),)
                                                ],
                                                      ),

                                            GestureDetector(
                                              child: Column(
                                                children: [
                                                  IconButton(
                                                      onPressed: () {
                                                        controller.Photogallery(ImageSource.gallery);
                                                        Get.back();
                                                        // print(controller.pickedfile.value);
                                                      },
                                                      icon: Icon(
                                                        Icons.image,
                                                        color: Colors.blue,
                                                        size: 50,
                                                      )),
                                                  SizedBox(height: Get.height * 0.01),
                                                  Text("Gallery", style: TextStyle(fontSize: 18),)
                                                ],
                                              ),
                                              onTap: () {
                                               // takePhoto(ImageSource.camera);
                                              },
                                            ),
                                          ],
                                        ),
                                      )
                                    ]);
                              });
                        },
                        child:
                        Obx( () =>
                            CircleAvatar(
                              maxRadius: 60,
                              child: ClipOval(
                                child:
                                Image.file(controller.pickedfile.value!,
                                    width: 130,
                                    height: 130,
                                    fit: BoxFit.cover
                                ),
                              ),
                            )
                        ),
                        // Obx( () =>
                        //     CircleAvatar(
                        //       maxRadius: 60,
                        //       child: ClipOval(
                        //         child:
                        //         Image.file(controller.pickedfile.value!,
                        //             width: 130,
                        //           height: 130,
                        //             fit: BoxFit.cover
                        //         ),
                        //       ),
                        //     )
                        // ),
                      ),
                      SizedBox(height: Get.height * 0.03),
                      Text(
                        "Amelia",
                        style: MyTheme.regularTextStyle(
                            color: Colors.white,
                            textSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Registered Nurse",
                        style: MyTheme.regularTextStyle(
                            color: Colors.white,
                            textSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Emp-Id: 1234 5678",
                        style: MyTheme.regularTextStyle(
                            color: Colors.white,
                            textSize: 16,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ]),
              ),
              SizedBox(height: Get.height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FittedBox(
                    child: ScreenDashViews(
                      width: Get.width * 0.4,
                      height: Get.height * 0.15,
                      text: "My Leaves",
                      onTap: () {
                        Get.toNamed(Routes.myLeavesPage);
                      },
                      image: AssetHelper.document,
                      //  svg: 'assets/svg/🦆 icon _File Signature_.svg',
                    ),
                  ),
                  FittedBox(
                    child: ScreenDashViews(
                      width: Get.width * 0.4,
                      height: Get.height * 0.15,
                      text: "Leave Request",
                      onTap: () {
                        Get.to(LeaveRequestView(),
                        arguments: {
                          "Profile" : controller.pickedfile.value
                        });
                      },
                      image: AssetHelper.leaveRequest,
                      // svg: 'assets/svg/🦆 icon _File Signature_.svg',
                    ),
                  )
                ],
              ),
              SizedBox(height: Get.height * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FittedBox(
                    child: ScreennDashViews(
                      width: Get.width * 0.4,
                      height: Get.height * 0.15,
                      text: "My Shift",
                      onTap: () {
                        Get.toNamed(Routes.myShiftPage);
                      },
                      image: AssetHelper.user,
                      icon: Icons.calendar_month,
                      //svg: 'assets/svg/🦆 icon _Alternate Calendar_.svg',
                    ),
                  ),
                  FittedBox(
                    child: ScreenDashViews(
                      width: Get.width * 0.4,
                      height: Get.height * 0.15,
                      text: "Notice Board",
                      onTap: () {
                        Get.toNamed(Routes.noticeBoardPage);
                      },
                      image: AssetHelper.noticeBoard,
                      //  svg: 'assets/svg/🦆 icon _Alternate Calendar_.svg',
                    ),
                  )
                ],
              ),
              SizedBox(height: 40,),
              GestureDetector(
                onTap: () {
                  LocalStore.clearData();
                  App.selectedSuborg =
                      SelectedSuborg(id: -1, name: "All");
                  Get.offNamed(Routes.login);
                },
                child: Container(
                  width: 100,
                  height: 30,
                  child: Center(child: Text("Log out", style: TextStyle(color: Colors.white),)),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.green),),
              )
            ]),
          ])),
    );
  }
}
