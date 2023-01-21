import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ScreenDashViews extends StatelessWidget {
  final double width;
  final double height;
  final String text;
//  final String svg;
  final String image;
  final GestureTapCallback? onTap;

  const ScreenDashViews({
    Key? key,
    required this.width,
    required this.height,
    required this.text,
    required this.onTap,
   // required this.svg,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(15), boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            spreadRadius: 0.01,
            //  blurRadius: 1,
            offset: Offset(
              1,
              1,
            ), // Shadow position
          ),
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 1,
            blurRadius: 12,
            //offset: Offset(10, 10,), // Shadow position
          ),
        ]),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          height: height,
          width: width,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(image),
                SizedBox(height: Get.height*0.01),
                Text(
                  text,
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
