import 'package:get/get.dart';
import 'package:lakeshore/screens/leave_request/leave_request_controller.dart';
import 'package:lakeshore/screens/reset_password/reset_controller.dart';
import 'myleaves_controller.dart';

class MyleavesViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyLeavesController>(
          () => MyLeavesController(),
    );
  }
}
