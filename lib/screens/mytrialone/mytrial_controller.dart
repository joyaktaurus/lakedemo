import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import '../mytrialtwo/mytrialt_view.dart';

class ListItem {
  final String newItem;
  final String newItemMsg;
  final String newItemAdrs;
  final double price;

  ListItem({
    required this.newItem,
    required this.newItemMsg,
    required this.newItemAdrs,
    required this.price,
  });

  Map<String, dynamic> toJson() {
    return {
      'newItem': newItem,
      'newItemMsg': newItemMsg,
      'newItemAdrs': newItemAdrs,
      'price': price,
    };
  }

  factory ListItem.fromJson(Map<String, dynamic> json) {
    return ListItem(
      newItem: json['newItem'],
      newItemMsg: json['newItemMsg'],
      newItemAdrs: json['newItemAdrs'],
      price: (json['price'] ?? 0.0).toDouble(),
    );
  }
}

class MyOneController extends GetxController {
  final MyListController controllerr = Get.find();
  getCurrentDate() {
    return DateFormat('dd-MM-yyyy').format(DateTime.now());
  }

  final TextEditingController textEditingController = TextEditingController();
  final TextEditingController msgEditingController = TextEditingController();
  final TextEditingController adrsEditingController = TextEditingController();
  final TextEditingController pricecontroller = TextEditingController();

  void addToListt() {
    String newItem = textEditingController.text;
    String newItemMsg = msgEditingController.text;
    String newItemAdrs = adrsEditingController.text;
    double price = double.tryParse(pricecontroller.text) ?? 0.0;
    if (newItem.isNotEmpty) {
      controllerr.addToList(ListItem(
        newItem: newItem,
        newItemMsg: newItemMsg,
        newItemAdrs: newItemAdrs,
        price: price,
      ));
      Get.back();
    }
  }
}

class MyListController extends GetxController {
  late final GetStorage storage;
  final RxList<ListItem> myList = (List<ListItem>.of([])).obs;

  double get totalPrice => myList.fold(
    0,
        (sum, item) => sum + item.price,
  );

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