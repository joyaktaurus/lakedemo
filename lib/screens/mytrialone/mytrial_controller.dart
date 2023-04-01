import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import '../mytrialtwo/mytrialt_view.dart';
import '../mytrialtwo/mytrialt_view.dart';
import '../mytrialtwo/mytrialt_view.dart';

class ListItem {
  final String newItem;
  final String newItemMsg;
  final String newItemAdrs;
  final double price;
  // final DateTime newItemDate;

  ListItem( {
    required this.newItem,
    required this.newItemMsg,
    required this.newItemAdrs,
     required this.price,
   // required this.newItemDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'newItem': newItem,
      'newItemMsg': newItemMsg,
      'newItemAdrs': newItemAdrs,
      'price': price,
      // 'newItemDate': newItemDate,
    };
  }

  factory ListItem.fromJson(Map<String, dynamic> json) {
    return ListItem(
      newItem: json['newItem'],
      newItemMsg: json['newItemMsg'],
      newItemAdrs: json['newItemAdrs'],
        price: json['price'],
      // newItemDate: json['newItemDate'],
    );
  }
}

class MyOneController extends GetxController {
  final MyListController controllerr = Get.find();
  getCurrentDate() {
    return DateFormat('dd-MM-yyyy').format(DateTime.now());
  }
  choosestartDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: startDate.value,
        firstDate: DateTime(2000),
        lastDate: DateTime(2028),
        // initialEntryMode: DatePickerEntryMode.input,
        // initialDatePickerMode: DatePickerMode.year,
        helpText: 'Select Date',
        cancelText: 'Close',
        confirmText: 'Confirm',
        errorFormatText: 'Enter valid date',
        errorInvalidText: 'Enter valid date range',
        //fieldLabelText: 'DOB',
        fieldHintText: 'Month/Date/Year',
        selectableDayPredicate: disableDate);
    if (pickedDate != null && pickedDate != selectedDate.value) {
      String Convet = DateFormat.yMMMd('en_US').format(pickedDate!);
      selectedDate.value = Convet.toString();
      startDate.value = pickedDate;
    }
  }

  bool disableDate(DateTime day) {
    if ((day.isAfter(DateTime.now().subtract(Duration(days: 1))))) {
      return true;
    }
    return false;
  }
  Rx<String> selectedDate = 'Start Date'.obs;
  final startDate = DateTime.now().obs;

  final TextEditingController textEditingController = TextEditingController();
  final TextEditingController msgEditingController = TextEditingController();
  final TextEditingController adrsEditingController = TextEditingController();
  final TextEditingController pricecontroller = TextEditingController();


  void addToListt() {
    String newItem = textEditingController.text;
    String newItemMsg = msgEditingController.text;
    String newItemAdrs = adrsEditingController.text;
    double price = double.parse(pricecontroller.text);
    // DateTime newItemDate = DateTime(2023);
    if (newItem.isNotEmpty) {
      controllerr.addToList(ListItem(
        newItem: newItem,
        newItemMsg: newItemMsg,
        newItemAdrs: newItemAdrs,
        price: double.tryParse(pricecontroller.text) ?? 0.0,
        // newItemDate: newItemDate,
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