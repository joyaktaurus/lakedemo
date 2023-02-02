import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lakeshore/components/request_container.dart';

Widget dropDownBox({
  FunctioOnchanged,
  ListItem,
  ListValue,
}) {
  return RequestContainer(
    width: Get.width * 0.9,
    height: Get.height * 0.07,
    child: Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
            value: ListValue,
            //controller.dropdownText.value,
            icon: Icon(
              Icons.keyboard_arrow_down_outlined,
            ),
            hint: Text('Leave Type'),
            elevation: 10,
            onChanged:
                // This is called when the user selects an item.
                FunctioOnchanged,
            items: ListItem //controller.df
            ),
      ),
    ),
  );
}


Widget dropDownBox2({
  FunctioOnchanged,
  ListItem,
  ListValue,
}) {
  return Padding(
    padding: const EdgeInsets.only(top: 25),
    child: Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.black45),borderRadius: BorderRadius.circular(15) ),
      width: Get.width * 0.9,
      height: Get.height * 0.06,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
              value: ListValue,
              //controller.dropdownText.value,
              icon: Icon(
                Icons.keyboard_arrow_down_outlined,
              ),
              hint: Text('Leave Type', style: TextStyle(fontWeight: FontWeight.normal),),
             // elevation: 10,
              onChanged:
              // This is called when the user selects an item.
              FunctioOnchanged,
              items: ListItem //controller.df
          ),
        ),
      ),
    ),
  );
}
