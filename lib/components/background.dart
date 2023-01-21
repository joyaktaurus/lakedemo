import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../utils/asset_helper.dart';

class BackGround extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
          top: 0,
          left: 0,
          child: Image.asset(AssetHelper.loginImage),
    );
  }
}
