import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../mytrialtwo/mytrialt_view.dart';

class ListItem {
  final String newItem;
  final String newItemMsg;
  final String newItemAdrs;

  ListItem({
    required this.newItem,
    required this.newItemMsg,
    required this.newItemAdrs,
  });

  Map<String, dynamic> toJson() {
    return {
      'newItem': newItem,
      'newItemMsg': newItemMsg,
      'newItemAdrs': newItemAdrs,
    };
  }

  factory ListItem.fromJson(Map<String, dynamic> json) {
    return ListItem(
      newItem: json['newItem'],
      newItemMsg: json['newItemMsg'],
      newItemAdrs: json['newItemAdrs'],
    );
  }
}

class MyOneController extends GetxController {
  final MyListController controllerr = Get.find();

  final TextEditingController textEditingController =
  TextEditingController();
  final TextEditingController msgEditingController = TextEditingController();
  final TextEditingController adrsEditingController =
  TextEditingController();

  void addToList() {
    String newItem = textEditingController.text;
    String newItemMsg = msgEditingController.text;
    String newItemAdrs = adrsEditingController.text;
    if (newItem.isNotEmpty) {
      controllerr.addToList(ListItem(
        newItem: newItem,
        newItemMsg: newItemMsg,
        newItemAdrs: newItemAdrs,
      ));
      Get.back();
    }
  }
}

class MyListController extends GetxController {
  late final GetStorage storage;
  final RxList<ListItem> myList = RxList<ListItem>([]);

  @override
  void onInit() {
    super.onInit();
    storage = GetStorage();
    List<dynamic>? storedList = storage.read<List<dynamic>>('myList');
    if (storedList != null) {
      myList.addAll(storedList.map((item) => ListItem.fromJson(item)));
    }
  }

  void addToList(ListItem item) {
    myList.add(item);
    storage.write('myList', myList.toList());
  }

  void removeFromList(int index) {
    myList.removeAt(index);
    storage.write('myList', myList.toList());
  }
}