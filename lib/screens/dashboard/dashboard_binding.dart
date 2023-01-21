import 'package:get/get.dart';
import 'package:lakeshore/screens/reset_password/reset_controller.dart';

import 'dashboard_controller.dart';



class DashboardViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(
          () => DashboardController(),
    );
  }
}
