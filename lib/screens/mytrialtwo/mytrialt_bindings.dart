import 'package:get/get.dart';
import 'package:lakeshore/screens/reset_password/reset_controller.dart';
import 'mytrialt_controller.dart';

class MyTwoBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyTwoController>(
          () => MyTwoController(),
    );
  }
}