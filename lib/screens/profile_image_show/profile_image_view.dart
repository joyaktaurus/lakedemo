import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:lakeshore/screens/profile_image_show/profile_image_controller.dart';

import '../../utils/my_utils.dart';

class ProfileImageView extends GetView<ProfileImageController> {
  const ProfileImageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
      MyUtils.hideKeyboard();
    },
    child: Scaffold(
    body: Center(
      child: Hero(
        tag: 'my-hero-animation-tag',
        child: Container(
            child: Image.file(Get.arguments["image"]))
      ),
    )
    )
    );
  }
}