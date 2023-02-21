import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lakeshore/components/screen_dash_views.dart';
import 'package:lakeshore/screens/dashboard/dashboard_controller.dart';
import 'package:lakeshore/screens/leave_request/leave_request_view.dart';
import '../../app.dart';
import '../../components/app_alertbox.dart';
import '../../components/dash_container.dart';
import '../../components/screenn_dash_views.dart';
import '../../my_theme.dart';
import '../../routes.dart';
import '../../services/privileges_resp.dart';
import '../../utils/asset_helper.dart';
import '../../utils/local_store.dart';
import '../../utils/my_utils.dart';
import '../profile_image_show/profile_image_view.dart';

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
            height: Get.height * 0.43,
            child: Stack(children: [
              Image.asset(AssetHelper.loginImage),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 100, top: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Dash Board",
                          style: MyTheme.regularTextStyle(
                              color: Colors.white,
                              textSize: 24,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(width: Get.width * 0.15),
                        IconButton(
                            onPressed: () {
                              LocalStore.clearData();
                              App.selectedSuborg =
                                  SelectedSuborg(id: -1, name: "All");
                              SystemNavigator.pop();
                            },
                            icon: Icon(
                              Icons.logout,
                              color: Colors.white,
                            ))
                      ],
                    ),
                  ),
                  SizedBox(height: Get.height * 0.01),
                  SizedBox(
                    child: CircleAvatar(
                      radius: 60.0,
                      backgroundColor: Colors.white,
                      child: Obx(
                        () => GestureDetector(
                          onTap: () {
                            Get.to(ProfileImageView(), arguments: {
                              "image": controller.pickedfile.value,
                            });
                          },
                          child: Hero(
                            tag: 'my-hero-animation-tag',
                            child: CircleAvatar(
                              // foregroundImage: AssetImage(AssetHelper.lakeSmall),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: GestureDetector(
                                  onTap: () async {
                                    await Get.bottomSheet(
                                      Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(10),
                                              topLeft: Radius.circular(10),
                                            )),
                                        height: 170,
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
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
                                                    "Profile Photo",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  IconButton(
                                                      onPressed: () {
                                                        controller.removeImages();
                                                        // RemoveProfileAlert(
                                                        //     context);
                                                      },
                                                      icon: Icon(Icons.delete))
                                                ],
                                              ),
                                              SizedBox(
                                                height: Get.height * 0.02,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      CircleAvatar(
                                                        backgroundColor:
                                                            Colors.blue,
                                                        child: Center(
                                                          child: IconButton(
                                                              onPressed: () {
                                                                //controller.imageFromCamera();
                                                                controller.takePhoto(
                                                                    ImageSource
                                                                        .camera);
                                                                Get.back();
                                                              },
                                                              icon: Icon(
                                                                Icons
                                                                    .camera_alt,
                                                                color: Colors
                                                                    .white,
                                                                size: 25,
                                                              )),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          height: Get.height *
                                                              0.01),
                                                      Text(
                                                        "Camera",
                                                        style: TextStyle(
                                                            fontSize: 18),
                                                      )
                                                    ],
                                                  ),
                                                  GestureDetector(
                                                    child: Column(
                                                      children: [
                                                        CircleAvatar(
                                                          backgroundColor:
                                                              Colors.blue,
                                                          child: Center(
                                                            child: IconButton(
                                                                onPressed: () {
                                                                  controller.Photogallery(
                                                                      ImageSource
                                                                          .gallery);
                                                                  Get.back();
                                                                  // print(controller.pickedfile.value);
                                                                },
                                                                icon: Icon(
                                                                  Icons.image,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 25,
                                                                )),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                            height: Get.height *
                                                                0.01),
                                                        Text(
                                                          "Gallery",
                                                          style: TextStyle(
                                                              fontSize: 18),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 20.0,
                                    child: Icon(
                                      Icons.camera_alt,
                                      size: 30.0,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ),
                              radius: 59.0,
                              backgroundImage: Image.file(
                                controller.pickedfile.value!,
                                width: 130,
                                height: 130,
                                fit: BoxFit.cover,
                              ).image,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("  \  "
                        "Amelia",
                        style: MyTheme.regularTextStyle(
                            color: Colors.white,
                            textSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      IconButton(
                          onPressed: () {
                            Get.toNamed(Routes.editViewPage);
                          },
                          icon: Icon(Icons.edit, color: Colors.white))
                    ],
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
                  ),
                ],
              ),
            ]),
          ),
          SizedBox(height: Get.height * 0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FittedBox(
                child: ScreennDashViews(
                  width: Get.width * 0.4,
                  height: Get.height * 0.15,
                  text: "My Profile",
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
                  text: "My Attendence",
                  onTap: () {
                    Get.toNamed(Routes.myAttendViewPage);
                  },
                  image: AssetHelper.noticeBoard,
                  //  svg: 'assets/svg/🦆 icon _Alternate Calendar_.svg',
                ),
              )
            ],
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
                    // Get.to(LeaveRequestView(),
                    //     arguments: {"Profile": controller.pickedfile.value});
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
        ]),
      ])),
    );
  }
}
