import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../mytrialtwo/mytrialt_view.dart';

class Person {
  String name;
  String address;
  String drop;

  Person({required this.name, required this.address, required this.drop});
}

class MyOneController extends GetxController {

  var persons = <Person>[].obs;

  void addPerson(String name, String address, String drop) {
    persons.add(Person(name: name, address: address, drop: drop));
  }

  List<Person> getPersons() {
    return persons.toList();
  }

  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final dropController = TextEditingController();
 // final MyOneController _personController = Get.put(MyOneController());

  void submit() {
    final name = nameController.text;
    final address = addressController.text;
    final drop = dropController.text;

    addPerson(name, address, drop);

    nameController.clear();
    addressController.clear();
    dropController.clear();


    Get.to(MyTrialTwo());
  }
  RxString departmentType = 'Department Head'.obs as RxString;
  List<String> department = [
    'Department Head',
    'Emergency Medicine ',
    'Icu care ',
    'Ward ',
  ].obs;
  // var selectedDepartment = "".obs;
  //
  // List<String> departmentt = ["Department1", "Department2", "Department3"];
  //
  // void onDepartmentChange(String? value) {
  //   selectedDepartment.value = value!;
  // }

  RxString selectedDepartment = "Department Headd".obs as RxString;

  List<String> departmentt = ["Department Headd","Department1", "Department2", "Department3"].obs;

  void onDepartmentChange(String? value) {
  selectedDepartment.value = value!;
}
}