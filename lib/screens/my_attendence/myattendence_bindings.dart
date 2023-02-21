import 'package:get/get.dart';

import 'myattendence_controller.dart';


class MyAttendViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyAttendController>(
          () => MyAttendController(),
    );
  }
}