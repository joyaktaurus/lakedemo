import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lakeshore/screens/my_leaves/myleaves_view.dart';

import '../../models/leave_request_model.dart';



class LeaveRequest {
  //  late final int? id;
  final String leaveType;
  final String startDate;
  final String endDate;
  final String leaveDay;
  final String deptHead;
  final String yourReason;
  final String status;

  LeaveRequest({
    //   required this.id,
    required this.leaveType,
    required this.startDate,
    required this.endDate,
    required this.leaveDay,
    required this.deptHead,
    required this.yourReason,
    required this.status
  });

  factory LeaveRequest.fromJson(Map<String, dynamic> json) {
    return LeaveRequest(
      leaveType: json['leaveType'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      leaveDay: json['leaveDay'],
      deptHead: json['deptHead'],
      yourReason: json['yourReason'],
      status: json['status'],
    );
  }
}

class LeaveRequestController extends GetxController {

  var lrequest = <LeaveRequest>[].obs;

  void addLeaves(String leaveType, String startDate, String endDate,
      String leaveDay, String deptHead, String yourReason, String status) {
    lrequest.add(LeaveRequest(
        leaveType: leaveType,
        startDate: startDate,
        endDate: endDate,
        leaveDay: leaveDay,
        deptHead: deptHead,
        yourReason: yourReason,
        status: status
    ));
  }

  List<LeaveRequest> getLeaves() {
    return lrequest.toList();
  }

  ///////////////////////////
  // final reasonCtrl = TextEditingController;

  final TextEditingController ltypeController = TextEditingController();
  final sdateController = TextEditingController();
  final edateController = TextEditingController();
  final ldayController = TextEditingController();
  final TextEditingController dheadController = TextEditingController();
  final yreasonController = TextEditingController();
  final statusController = TextEditingController();

  void submit() {
    final leaveType = dropdownText.value;
    final startDate = selectedDate.value;
    final endDate = selecteenddDate.value;
    final leaveDay = ldayController.text;
    final deptHead = dheadController.text;
    final yourReason = yreasonController.text;
    final status = statusController.text;

    addLeaves( leaveType, startDate, endDate, leaveDay, deptHead, yourReason, status);

    dropdownText.value = df.first;
    sdateController.clear();
    edateController.clear();
    ldayController.clear();
    dheadController.clear();
    yreasonController.clear();

    Get.to(MyLeavesdView());
  }
  /////////////////////////////////
  int id = 1;
 // final resnCtrl = TextEditingController();

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

  // @override
  // void onInit() {
  //   super.onInit();
  //   //fetchRequest();
  // }
  //
  // void fetchRequest() async {
  //   await Future.delayed(Duration(seconds: 1));
  //   var requestResponse = [
  //     LeaveRequest(
  //       id: 1,
  //       leaveType: 'Casual Leave',
  //       startDate: '11-02-2023',
  //       endDate: '14-02-2023',
  //       leaveDay: 'Full day',
  //       deptHead: 'Ward',
  //       yourReason: 'bnbvnb',
  //     ),
  //     LeaveRequest(
  //       id: 2,
  //       leaveType: 'Casual Leave',
  //       startDate: '21-02-2023',
  //       endDate: '14-03-2023',
  //       leaveDay: 'Half day',
  //       deptHead: 'Icu care',
  //       yourReason: '4cvbb',
  //     ),
  //     LeaveRequest(
  //       id: 3,
  //       leaveType: 'Sick Leave',
  //       startDate: '15-02-2023',
  //       endDate: '24-02-2023',
  //       leaveDay: 'Full day',
  //       deptHead: 'Ward',
  //       yourReason: 'cbhfghg4',
  //     ),
  //   ];
  //   leaverequest.value = requestResponse;
  // }

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
        //  fieldLabelText: 'DOB',
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
}