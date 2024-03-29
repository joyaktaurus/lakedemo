import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lakeshore/components/request_container.dart';
import 'package:lakeshore/screens/my_leaves/myleaves_view.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../components/app_buttons.dart';
import '../../components/app_dropdown.dart';
import '../../components/app_togg_days.dart';
import '../../components/dash_container.dart';
import '../../my_theme.dart';
import '../../utils/asset_helper.dart';
import '../../utils/my_utils.dart';
import '../my_leaves/myleaves_controller.dart';
import 'leave_request_controller.dart';

class LeaveRequestView extends GetView<LeaveRequestController> {
  LeaveRequestView({Key? key}) : super(key: key);
  final  myLeavesController = Get.put<MyLeavesController>.obs;
  final LeaveRequestController leaveRequestController = Get.put(LeaveRequestController());
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        MyUtils.hideKeyboard();
      },
      child: Scaffold(

        body: Stack(
          children: [
            //  BackGround(),
            DashContainer(
              height: Get.height * 0.28,
              child: Stack(
                  children: [
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
                                  "Leave Request",
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
                                SizedBox(width: Get.width * 0.05),
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
                    ]  ),
                  ] ),
            ),
            //  SizedBox(height: Get.height * 0.02),
            Padding(
              padding: const EdgeInsets.only(top: 250),
              child: NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (OverscrollIndicatorNotification overscroll) {
                  overscroll.disallowIndicator();
                  return true;
                },
                child: SingleChildScrollView(
                  child: RefreshIndicator(
                    onRefresh: () {
                      return Future.delayed(Duration(seconds: 1));
                    },
                    child: Column(
                      children: [
                        Obx(
                              () =>
                          dropDownBox(
                              controller: controller.ltypeController,
                              FunctioOnchanged: (String? value) {
                                // This is called when the user selects an item.
                                controller.dropdownText.value = value!;
                              },
                              ListItem: controller.df
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value, style: TextStyle(fontWeight: FontWeight.normal),),
                                    );
                                  }).toList(),
                              ListValue: controller.dropdownText.value),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FittedBox(
                              child: RequestContainer(
                                controller: controller.sdateController,
                                width: Get.width * 0.4,
                                height: Get.height * 0.07,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          controller.choosestartDate();
                                        },
                                        icon: Icon(Icons.calendar_month,
                                            color: Colors.blue)),
                                    Obx(
                                          () => Text(
                                        controller.selectedDate.value
                                            .toString(),
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            FittedBox(
                              child: RequestContainer(
                                controller: controller.edateController,
                                width: Get.width * 0.4,
                                height: Get.height * 0.07,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          controller.chooseendDate();
                                        },
                                        icon: Icon(Icons.calendar_month,
                                            color: Colors.blue)),
                                    Obx(
                                          () => Text(
                                        controller.selecteenddDate.value
                                            .toString(),
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        FittedBox(
                          child: RequestContainer(
                            controller: controller.ldayController,
                            width: Get.width * 0.91,
                            height: Get.height * 0.07,
                            child: ToggleSwitch(
                              radiusStyle: true,
                              minWidth: 185,
                              minHeight: 60,
                              cornerRadius: 15,
                              fontSize: 16,
                              activeBgColors: [
                                [Colors.blue],
                                [Colors.blue],
                              ],
                              activeFgColor: Colors.white,
                              inactiveBgColor: Colors.white,
                              inactiveFgColor: Colors.blue,
                              totalSwitches: 2,
                              labels: ['Full Day', 'Half Day'],
                              onToggle: (index) {
                                print('Selected item Position: $index');
                              },
                            ),
                          ),
                        ),

                        Obx(
                              () => Padding(
                            padding: const EdgeInsets.only(
                              left: 0,
                              right: 0,
                            ),
                            child: dropDownBox(
                              controller: controller.dheadController,
                              ListValue: controller.departmentType.value,
                              ListItem: controller.department
                                  .map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value, style: TextStyle(fontWeight: FontWeight.normal),),
                                    );
                                  }).toList(),
                              FunctioOnchanged: (String? value) {
                                //            This is called when the user selects an item.
                                controller.departmentType.value = value!;
                              },
                            ),
                          ),
                        ),
                        RequestContainer(
                          width: Get.width * 0.9,
                          height: Get.height * 0.13,
                          child: Container(
                            width: Get.width * 0.9,
                            height: Get.height * 0.13,
                            child: TextFormField(
                              controller: controller.yreasonController,
                              maxLines: 100,
                              decoration: new InputDecoration(
                                border: InputBorder.none,
                                filled: false,
                                contentPadding: new EdgeInsets.only(
                                    left: 10.0,
                                    top: 10.0,
                                    bottom: 10.0,
                                    right: 10.0),
                                hintText: 'hfhf',
                                hintStyle: new TextStyle(
                                  color: Colors.grey.shade500,
                                  fontSize: 12.0,
                                  fontFamily: 'helvetica_neue_light',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 730),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    FittedBox(
                      child: MAButton(
                        text: 'Submit Request',
                        buttonPress: () {
                          controller.submit();
                        },
                        isEnabled: true,
                        padding: const EdgeInsets.only(bottom: 5),
                        height: Get.height * 0.07,
                        width: Get.width * 0.6,
                        clipBehavior: 0,
                        radius: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}