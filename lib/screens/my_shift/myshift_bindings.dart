import 'package:get/get.dart';
import 'package:lakeshore/screens/reset_password/reset_controller.dart';

import 'myshift_controller.dart';


class MyShiftViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyShiftController>(
          () => MyShiftController(),
    );
  }
}
