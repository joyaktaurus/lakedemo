import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lakeshore/screens/mytrialone/mytrial_view.dart';
import '../../components/request_container.dart';
import '../../utils/my_utils.dart';
import '../mytrialone/mytrial_controller.dart';
import '../mytrialtwo/mytrialt_view.dart';



class MyTrialOne extends GetView<MyListController> {
  final MyListController controllerrr = Get.find();
  final MyOneController controollerr = Get.put(MyOneController());
  @override
  Widget build(BuildContext context) {
   final MyOneController controllerr = Get.find();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            TextField(
              controller:controllerr.textEditingController,
              decoration: InputDecoration(hintText: 'Enter item name'),
            ),
            TextField(
              controller: controllerr.msgEditingController,
              decoration: InputDecoration(hintText: 'Enter msg name'),
            ),
            TextField(
              controller: controllerr.adrsEditingController,
              decoration: InputDecoration(hintText: 'Enter adrs name'),
            ),
            TextField(
              controller: controllerr.pricecontroller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Price',
                border: OutlineInputBorder(),
              ),
            ),
            // TextField(
            //   controller: controllerr.sdateEditingController, // new field
            //   onTap: () async {
            //     final DateTime? picked = await showDatePicker(
            //       context: context,
            //       initialDate: DateTime.now(),
            //       firstDate: DateTime(1900),
            //       lastDate: DateTime(2100),
            //     );
            //     if (picked != null) {
            //       controollerr.sdateEditingController.text = picked.toString();
            //     }
            //   },
            //   decoration: InputDecoration(hintText: 'Enter date'), // new field
            // ),
            // RequestContainer(
            //   controller: controollerr.sdateEditingController,
            //   width: Get.width * 0.4,
            //   height: Get.height * 0.07,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       IconButton(
            //           onPressed: () {
            //             controollerr.choosestartDate();
            //           },
            //           icon: Icon(Icons.calendar_month,
            //               color: Colors.blue)),
            //        Text(
            //           controollerr.selectedDate.value
            //               .toString(),
            //           style: TextStyle(fontSize: 16),
            //         ),
            //
            //     ],
            //   ),
            // ),
            TextButton(
              child: Text('CANCEL'),
              onPressed: () {
                Get.back();
              },
            ),
            ElevatedButton(
              child: Text('ADD'),
              onPressed: () {
              controllerr.addToListt();
               showDialog(
                 context: context,
                 builder: (_) => MyTrialTwo(),
               );
              },
            ),
          ],
        ),
      ),
    );
  }
}
