import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lakeshore/components/app_buttons.dart';
import 'package:lakeshore/components/request_container.dart';

import '../../components/app_dropdown.dart';
import '../../components/background.dart';
import '../../my_theme.dart';
import '../../utils/asset_helper.dart';
import '../../utils/my_utils.dart';
import 'edit_form_controller.dart';

class EditFormView extends GetView<EditFormViewController> {
  const EditFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          MyUtils.hideKeyboard();
        },
        child: Scaffold(
            body: Stack(children: [
          BackGround(),
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
          Padding(
            padding: const EdgeInsets.only(top: 150),
            child: RequestContainer(
                width: Get.width * 0.9,
                height: Get.height * 0.7,
                child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SingleChildScrollView(
                      child: Column(children: [
                        Text(
                          "Updation Form",
                          style: MyTheme.regularTextStyle(
                              color: Colors.blue,
                              textSize: 23,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: Get.height * 0.03),
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              TextFormField(
                                toolbarOptions: ToolbarOptions(
                                  copy: true,
                                  cut: true,
                                  selectAll: true,
                                  paste: true,
                                ),
                                controller: controller.phoneCtrl,
                                focusNode: controller.phoneCtrlfocusNode,
                                decoration: textBoxDecoration(
                                    'New Phone Number',
                                    Icon(
                                      Icons.phone,
                                      color: Colors.blue,
                                    )),
                                textInputAction: TextInputAction.next,
                              ),
                              SizedBox(
                                height: Get.height * 0.03,
                              ),
                              TextFormField(
                                toolbarOptions: ToolbarOptions(
                                  copy: true,
                                  cut: true,
                                  selectAll: true,
                                  paste: true,
                                ),
                                obscureText: true,
                                obscuringCharacter: '*',
                                controller: controller.userCtrl,
                                focusNode: controller.userCtrlfocusNode,
                                decoration: textBoxDecoration(
                                    'New Email ID',
                                    Icon(
                                      Icons.email_outlined,
                                      color: Colors.blue,
                                    )),
                                textInputAction: TextInputAction.next,
                              ),
                              Obx(
                                () => Padding(
                                  padding: const EdgeInsets.only(
                                    left: 0,
                                    right: 0,
                                  ),
                                  child: dropDownBox2(
                                    ListValue:
                                        controller.maritalStatus.value,
                                    ListItem: controller.mstatus
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    FunctioOnchanged: (String? value) {
                                      //            This is called when the user selects an item.
                                      controller.maritalStatus.value =
                                          value!;
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(height: Get.height * 0.01),
                              Row(
                                children: [
                                  Text(
                                    "Attachment if any",
                                    style: MyTheme.regularTextStyle(
                                      color: Colors.black,
                                      textSize: 16,
                                      // fontWeight: FontWeight.w500
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {

                                      },
                                      icon:
                                          Icon(Icons.attach_file_outlined))
                                ],
                              ),
                              SizedBox(height: Get.height * 0.01),
                              Container(
                                decoration: BoxDecoration(border: Border.all(color: Colors.black45),borderRadius: BorderRadius.circular(15) ),
                                width: Get.width * 0.9,
                                height: Get.height * 0.13,
                                child: TextFormField(
                                  maxLines: 100,
                                  decoration: new InputDecoration(
                                    border: InputBorder.none,
                                    filled: false,
                                    contentPadding: new EdgeInsets.only(
                                        left: 10.0,
                                        top: 10.0,
                                        bottom: 10.0,
                                        right: 10.0),
                                    hintText: 'Reason',
                                    hintStyle: new TextStyle(
                                      color: Colors.grey.shade500,
                                      fontSize: 12.0,
                                      fontFamily: 'helvetica_neue_light',
                                    ),
                                  ),
                                ),
                              ),
                              MAButton(text: "Submit Request",
                                height: Get.height * 0.06,
                                width: Get.width * 0.8,
                                clipBehavior: 0,
                                radius: 30,
                                padding: EdgeInsets.only(top: 30),
                              )
                            ],
                          ),
                        ),
                      ]),
                    ))),
          ),
        ])));
  }
}

InputDecoration textBoxDecoration(hintText, prefixIcon) {
  return InputDecoration(
    hintText: hintText,
    prefixIcon: prefixIcon,
    //isDense: true,
    contentPadding: EdgeInsets.fromLTRB(5, 5, 5, 0),
    filled: true,
    fillColor: Colors.white,
    hintStyle: MyTheme.regularTextStyle(textSize: 14, color: Colors.black),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: Colors.grey)),
    disabledBorder: InputBorder.none,
  );
}
