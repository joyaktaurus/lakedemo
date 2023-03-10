import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTogButton extends StatelessWidget {
  final List<String> items;
  final TextEditingController controller;
  final GestureTapCallback? onTap;
  final Widget child;
  MyTogButton({
    required this.items,
    this.onTap,
    required this.child,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.4,
      height: Get.height * 0.07,
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
      child: child,
    );
  }
}








// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
//
//
//
// class ToggleButton extends StatelessWidget {
//   final List<String> items;
//   final TextEditingController controller;
//   // final Color color;
//   // final Color textColor;
//  final GestureTapCallback? onTap;
//
//   ToggleButton({
//     required this.items,
//     required this.controller,
//     this.onTap,
//     required Row child,
//     //required int currentIndex, required Null Function(int index) onChanged,
//     // required this.color,
//     // required this.textColor,
//
//   });
//   var selectedIndex = 0.obs;
//
//   void selectIndex(int index) {
//     selectedIndex.value = index;
//   }
//   @override
//   Widget build(BuildContext context) {
//     return
//       Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: List.generate(
//           items.length,
//               (index) => InkWell(
//             onTap: onTap,
//             child: Container(
//               alignment: Alignment.center,
//               padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 color: selectedIndex.value == index
//                 ? Colors.blue
//                 : Colors.grey[300],
//               ),
//               child: Text(
//                 items[index],
//                 style: TextStyle(
//                   color: selectedIndex.value == index
//                       ? Colors.white
//                       : Colors.black,
//                 ),
//               ),
//             ),
//           ),
//         ),
//
//     );
//   }
// }