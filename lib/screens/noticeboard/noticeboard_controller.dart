
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';


class NoticeBoardController extends GetxController {

  var isReadmore = false.obs;

  getCurrentDate() {
    return DateFormat('dd-MM-yyyy').format(DateTime.now());
  }
}