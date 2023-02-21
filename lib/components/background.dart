import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../utils/asset_helper.dart';


import 'package:flutter/material.dart';

class BackGround extends StatelessWidget {
  final Widget child;
  const BackGround({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
       //   alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(AssetHelper.loginImage),
              ),
            Column(children: [
              child]),
          ],
    );
  }
}


// class BackGround extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//         children: [
//           Positioned(
//                 top: 0,
//                 left: 0,
//                 child: Image.asset(AssetHelper.loginImage),
//           ),
//         ],
//     );
//   }
// }
