import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../mytrialone/mytrial_controller.dart';


class MyTwoController extends GetxController {
 //  final MyListController controllerr = Get.find();
  getCurrentDate() {
    return DateFormat('dd-MM-yyyy').format(DateTime.now());
  }
}