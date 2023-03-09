import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lakeshore/components/request_container.dart';

class AnimatedToggle extends StatefulWidget {
  final List<String> values;
  final ValueChanged onToggleCallback;
  final Color backgroundColor;
  final Color buttonColor;
  final Color textColor;
//  final TextEditingController textController;

  AnimatedToggle({
    required this.values,
    required this.onToggleCallback,
    this.backgroundColor = Colors.blue,
    this.buttonColor = Colors.blue,
    this.textColor = Colors.blue,
   // required this.textController
  });
  @override
  _AnimatedToggleState createState() => _AnimatedToggleState();
}

class _AnimatedToggleState extends State<AnimatedToggle> {
  bool initialPosition = true;
  @override
  Widget build(BuildContext context) {
    return RequestContainer(
      width: Get.width * 0.9,
      height: Get.width * 0.15,
     // margin: EdgeInsets.all(20),
      child: Stack(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              initialPosition = !initialPosition;
              var index = 0;
              if (!initialPosition) {
                index = 1;
              }
              widget.onToggleCallback(index);
              setState(() {});
            },
            child: Container(
              width: Get.width * 0.9,
              height: Get.height * 0.18,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  widget.values.length,
                      (index) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: Get.width * 0.09),
                    child: Center(
                      child: Text(
                        widget.values[index],
                        style: TextStyle(
                          color: Colors.blue, fontSize: 17
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          AnimatedAlign(
            duration: const Duration(milliseconds: 250),
            curve: Curves.decelerate,
            alignment:
            initialPosition ? Alignment.centerLeft : Alignment.centerRight,
            child: Container(
              width: Get.width * 0.45,
              height: Get.height * 0.10,
              decoration: ShapeDecoration(
                color: widget.buttonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
               initialPosition ? widget.values[0] : widget.values[1],
                style: TextStyle(
                  fontSize: Get.width * 0.045,
                  color:Colors.white
                ),
              ),
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }
}