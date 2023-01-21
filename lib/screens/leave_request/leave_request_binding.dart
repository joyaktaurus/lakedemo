import 'package:get/get.dart';
import 'package:lakeshore/screens/reset_password/reset_controller.dart';

import 'leave_request_controller.dart';

class LeaveRequestViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LeaveRequestController>(
          () => LeaveRequestController(),
    );
  }
}