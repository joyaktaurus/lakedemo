import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../components/app_buttons.dart';
import '../../components/app_dropdown.dart';
import '../../components/background.dart';
import '../../my_theme.dart';
import '../../utils/my_utils.dart';
import 'invoice_controller.dart';

class MyInvoiceView extends GetView<MyInvoiceViewController> {
  const MyInvoiceView({Key? key}) : super(key: key);

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
                    "PaySlip",
                    style: MyTheme.regularTextStyle(
                        color: Colors.blue,
                        textSize: 24,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 200),
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
                    child: Column(children: [
                      Obx(
                        () => dropDownBox(
                            FunctioOnchanged: (String? value) {
                              // This is called when the user selects an item.
                              controller.dropdownText.value = value!;
                            },
                            ListItem: controller.df
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value, style: TextStyle(fontWeight: FontWeight.normal),),
                              );
                            }).toList(),
                            ListValue: controller.dropdownText.value),
                      ),
                      SizedBox(height: Get.height * 0.1),
                      MAButton(
                      //  icon: Icons.arrow_downward_outlined,
                        text: 'Download',
                        buttonPress: () {
                       //   Get.to(MyLeavesdView(),);
                        },
                        isEnabled: true,
                        padding: const EdgeInsets.only(bottom: 5),
                        height: Get.height * 0.07,
                        width: Get.width * 0.9,
                        clipBehavior: 0,
                        radius: 20,
                      ),
                    ]),
                  ),
                ),
              ))
        ])));
  }
}
