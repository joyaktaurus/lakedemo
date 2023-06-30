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
