import 'package:get/get.dart';


class MyInvoiceViewController extends GetxController {
  RxString dropdownText = 'Select Month '.obs as RxString;
  List<String> df = [
    'Select Month ',
    'January 2023 ',
    'February 2023',
    'March 2023',
    'April 2023',
    'May 2023',
    'June 2023',
    'July 2023',
    'August 2023',
    'September 2023',
    'October 2023',
    'November 2023',
    'December 2023',
  ].obs;
}