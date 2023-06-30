import 'package:get/get.dart';
import 'package:lakeshore/screens/reset_password/reset_controller.dart';
import 'mytrial_controller.dart';

class MyOneBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyListController>(
          () => MyListController(),
    );
  }
}