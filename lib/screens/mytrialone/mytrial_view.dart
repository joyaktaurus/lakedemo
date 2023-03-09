import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../components/app_dropdown.dart';
import '../../components/my_tog_app.dart';
import '../../components/request_container.dart';
import '../../utils/my_utils.dart';
import 'mytrial_controller.dart';


class MyTrialOne extends GetView<MyOneController> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          MyUtils.hideKeyboard();
        },
        child: Scaffold(
            body: Stack(children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextField(controller: controller.nameController, decoration: InputDecoration(labelText: 'Name')),
                    TextField(controller: controller.addressController, decoration: InputDecoration(labelText: 'Address')),
                    Obx(
                          () => Padding(
                        padding: const EdgeInsets.only(
                          left: 0,
                          right: 0,
                        ),
                        child: dropDownBox(
                          controller: controller.departmentController,
                          ListValue: controller.selectedDepartment.value,
                          ListItem: controller.departmentt
                              .map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value, style: TextStyle(fontWeight: FontWeight.normal),),
                                );
                              }).toList(),
                          FunctioOnchanged: controller.onDepartmentChange,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Obx( () =>
                      MyTogButton(
                        controller: controller.toggleButtonController,
                          items: controller.items,
                          child:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              controller.items.length,
                                  (index) => InkWell(
                                onTap: () => controller.selectIndex(index),
                                child:
                                //child,
                                Container(
                                  width: 170,
                                  height: 50,
                                  alignment: Alignment.center,
                                  // padding: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: controller.selectedIndex.value == index
                                        ? Colors.blue
                                        : Colors.grey[300],
                                  ),
                                  child: Text(
                                    controller.items[index],
                                    style: TextStyle(
                                      color: controller.selectedIndex.value == index
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(onPressed: () => controller.submit(), child: Text('Submit')),
                  ],
                ),
              ),
            ])));
  }
}


