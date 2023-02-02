
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:lakeshore/screens/profile_image_show/profile_image_controller.dart';

class ProfileImageViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileImageController>(
          () => ProfileImageController(),
    );
  }
}