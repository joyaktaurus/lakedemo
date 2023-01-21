import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ScreennDashViews extends StatelessWidget {
  final double width;
  final double height;
  final String text;
//  final String svg;
  final String image;
  final GestureTapCallback? onTap;
  final IconData? icon;

  const ScreennDashViews({
    Key? key,
    required this.width,
    required this.height,
    required this.text,
    required this.onTap,
    // required this.svg,
    required this.image, required this.icon,

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(),
                    Icon(icon, color: Colors.blue[600],size: 40,),
                    Positioned(
                        left: 90, bottom: 2,
                        child: Image.asset(image, color: Colors.blue[600],))] ),

              Text(
                text,
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),],
          ),

        ),
      ),
    );
  }
}
