
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class EditFormViewController extends GetxController {

  final TextEditingController phoneCtrl = TextEditingController(text: '');

  final TextEditingController userCtrl = TextEditingController(text: '');

  final FocusNode userCtrlfocusNode = FocusNode();

  final FocusNode phoneCtrlfocusNode = FocusNode();



  RxString maritalStatus = 'Marital Status '.obs as RxString;
  List<String> mstatus = [
    'Marital Status ',
    'Single ',
    'Married',
  ].obs;

}