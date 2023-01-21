import 'package:flutter/material.dart';
import 'package:lakeshore/components/background.dart';
import 'package:lakeshore/my_theme.dart';

class DashContainer extends StatelessWidget {
  final Widget child;
  final double height;

  const DashContainer({
    Key? key,
    required this.child,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(60),
            bottomLeft: Radius.circular(60),
          ),
          child: Container(
            height: height,
            child: child,
            //Get.height * 0.45,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromRGBO(76, 178, 229, 1),
                Color.fromRGBO(44, 157, 215, 1)
              ]),
            ),
          ),
        ),
      ],
    );
  }
}