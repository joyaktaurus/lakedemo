import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../models/leave_request_model.dart';
import 'contr.dart';

class LeaveRequestController extends GetxController {
  final  reasonCtrl = TextEditingController;

  RxString dropdownText = 'Leave Type '.obs as RxString;
  List<String> df = [
    'Leave Type ',
    'Caual Leave ',
    'Sick Leave',
  ].obs;
  List<bool> Selected = <bool>[true, false].obs;
  List<Widget> fullDayHalf = <Widget>[Text('Full Day'), Text('Half Day')].obs;
  RxString departmentType = 'Department Head'.obs as RxString;
  List<String> department = [
    'Department Head',
    'Emergency Medicine ',
    'Icu care ',
    'Ward ',
  ].obs;

  // var selectedDate = DateTime.now().obs;
  Rx<String> selectedDate = 'Start Date'.obs;
  Rx<String> selecteenddDate = 'End Date'.obs;
  Rx<String> yourReason = ''.obs;

  //var selecteenddDate = DateTime.now().obs;
  final startDate = DateTime.now().obs;
  final endDate = DateTime.now().obs;

  var leaverequest = <LeaveRequest>[].obs;

  @override
  void onInit() {
    super.onInit();
    //fetchRequest();
  }

  void fetchRequest() async {
    await Future.delayed(Duration(seconds: 1));
    var requestResponse = [
      LeaveRequest(
        id: 1,
        leaveType: 'Casual Leave',
        startDate: '11-02-2023',
        endDate: '14-02-2023',
        leaveDay: 'Full day',
        deptHead: 'Ward',
        yourReason: 'bnbvnb',
      ),
      LeaveRequest(
        id: 2,
        leaveType: 'Casual Leave',
        startDate: '21-02-2023',
        endDate: '14-03-2023',
        leaveDay: 'Half day',
        deptHead: 'Icu care',
        yourReason: '4cvbb',
      ),
      LeaveRequest(
        id: 3,
        leaveType: 'Sick Leave',
        startDate: '15-02-2023',
        endDate: '24-02-2023',
        leaveDay: 'Full day',
        deptHead: 'Ward',
        yourReason: 'cbhfghg4',
      ),
    ];
    leaverequest.value = requestResponse;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

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
        fieldLabelText: 'DOB',
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

  chooseendDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: startDate.value,
        firstDate: startDate.value,
        lastDate: DateTime(2028),
        // initialEntryMode: DatePickerEntryMode.input,
        // initialDatePickerMode: DatePickerMode.year,
        helpText: 'Select Date',
        cancelText: 'Close',
        confirmText: 'Confirm',
        errorFormatText: 'Enter valid date',
        errorInvalidText: 'Enter valid date range',
        fieldLabelText: 'DOB',
        fieldHintText: 'Month/Date/Year',
        selectableDayPredicate: disableendDate);
    if (pickedDate != null && pickedDate != selecteenddDate.value) {
      String Convet = DateFormat.yMMMd('en_US').format(pickedDate!);
      selecteenddDate.value = Convet.toString();
    }
  }

  bool disableendDate(DateTime day) {
    if ((day.isAfter(startDate().subtract(Duration(days: 1))))) ;
    {
      return true;
    }
  }

  Rx<String> textController = 'Reason'.obs as RxString;

  RxString controllerText = ''.obs;

  final controller = Get.put(Controller());


}
