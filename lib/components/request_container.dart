import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RequestContainer extends StatelessWidget {
  final double width;
  final double? height;
  final Widget child;
  final TextEditingController? controller;

  const RequestContainer({
    Key? key,
    required this.width,
    required this.child,
    this.controller,
    this.height,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Container(
        width: width,
        height: height,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              spreadRadius: 0.01,
            //  blurRadius: 1,
               offset: Offset(1, 1,), // Shadow position
            ),
            BoxShadow(
              color: Colors.grey.shade300,
              spreadRadius: 1,
              blurRadius: 12,
              //offset: Offset(10, 10,), // Shadow position
            ),
          ]),
          child: child),
    );
  }
}
