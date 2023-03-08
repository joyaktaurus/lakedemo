
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../components/app_dropdown.dart';
import '../../utils/my_utils.dart';
import 'mytrial_controller.dart';

class MyTrialOne extends GetView<MyOneController> {
  const MyTrialOne({Key? key}) : super(key: key);

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
                    // Obx(
                    //       () => Padding(
                    //     padding: const EdgeInsets.only(
                    //       left: 0,
                    //       right: 0,
                    //     ),
                    //     child: dropDownBox(
                    //       ListValue: controller.departmentType.value,
                    //       ListItem: controller.department
                    //           .map<DropdownMenuItem<String>>(
                    //               (String value) {
                    //             return DropdownMenuItem<String>(
                    //               value: value,
                    //               child: Text(value, style: TextStyle(fontWeight: FontWeight.normal),),
                    //             );
                    //           }).toList(),
                    //       FunctioOnchanged: (String? value) {
                    //         //            This is called when the user selects an item.
                    //         controller.departmentType.value = value!;
                    //       },
                    //     ),
                    //   ),
                    // ),
                    ElevatedButton(onPressed: () => controller.submit(), child: Text('Submit')),

                  ],
                ),
              ),
            ])));
  }
}