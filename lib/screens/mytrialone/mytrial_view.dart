import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lakeshore/screens/mytrialone/mytrial_view.dart';
import '../../utils/my_utils.dart';
import '../mytrialone/mytrial_controller.dart';


class MyTrialOne extends GetView<MyListController> {
  final TextEditingController textEditingController = TextEditingController();
  final TextEditingController msgEditingController = TextEditingController();
  final TextEditingController adrsEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final MyOneController controllerr = Get.find();
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: controllerr.textEditingController,
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
          TextButton(
            child: Text('CANCEL'),
            onPressed: () {
              Get.back();
            },
          ),
          ElevatedButton(
            child: Text('ADD'),
            onPressed: () {
              controllerr.addToList();
            },
          ),
        ],
      ),
    );
  }
}
