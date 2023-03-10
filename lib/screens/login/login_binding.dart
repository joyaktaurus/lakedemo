import 'package:get/get.dart';

import 'login_controller.dart';

class LoginViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
  }
}
