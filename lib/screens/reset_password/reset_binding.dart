import 'package:get/get.dart';
import 'package:lakeshore/screens/reset_password/reset_controller.dart';



class ResetViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResetController>(
          () => ResetController(),
    );
  }
}
