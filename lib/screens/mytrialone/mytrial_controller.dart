
import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../mytrialtwo/mytrialt_view.dart';

class Person {
  String name;
  String address;
  String drop;
  String toggles;

  Person({required this.name, required this.address, required this.drop, required this.toggles});
}

class MyOneController extends GetxController {

  List<Person> persons = <Person>[].obs;

  void addPerson(String name, String address, String drop, String toggles) {
    persons.add(Person(name: name, address: address, drop: drop, toggles: toggles));
  }

  List<Person> getPersons() {
    return persons.toList();
  }

  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final departmentController = TextEditingController();
  final toggleButtonController = TextEditingController();

  void submit() {
    final name = nameController.text;
    final address = addressController.text;
    final drop = selectedDepartment.value;
    final toggles = toggleButtonController.text;

    addPerson(name, address, drop, toggles);

    nameController.clear();
    addressController.clear();
    selectedDepartment.value = departmentt.first;
    toggleButtonController.clear();

    Get.to(MyTrialTwo());
  }

  List<String> departmentt = ["Department Headd","Department1", "Department2", "Department3"].obs;

  RxString selectedDepartment = "Department Headd".obs as RxString;

  void onDepartmentChange(String? value) {
    selectedDepartment.value = value!;
  }
    List<String> items = ['Full Day', 'Half Day'].obs;
     RxInt selectedIndex =  0.obs as RxInt;
  //
  // void selectIndex(int index) {
  //   selectedIndex.value = index;
  // }
  // var selectedIndex = 0.obs;

  void selectIndex(int index) {
    selectedIndex.value = index!;
  }
}




