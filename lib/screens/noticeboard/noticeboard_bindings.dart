import 'package:get/get.dart';

import 'noticeboard_controller.dart';


class NoticeBoardViewBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NoticeBoardController>(
          () => NoticeBoardController(),
    );
  }
}