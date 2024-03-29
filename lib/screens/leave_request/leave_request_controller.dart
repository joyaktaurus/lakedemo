import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:lakeshore/screens/my_leaves/myleaves_view.dart';


class LeaveRequest {
  // final int? id;
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
    this.status = "Pending"
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
  Map<String, dynamic> toJson() => {
    'leaveType': leaveType,
    'startDate': startDate,
    'endDate': endDate,
    'leaveDay': leaveDay,
    'deptHead': deptHead,
    'yourReason': yourReason,
    'status': status,
  };
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
/**/
  // late final GetStorage storage;
  // final RxList lrequestt = RxList([]);
  //
  // @override
  // void onInit() {
  //   super.onInit();
  //   storage = GetStorage();
  //   List<dynamic>? storedList = storage.read<List<dynamic>>('myList');
  //   if (storedList != null) {
  //     lrequestt.addAll(storedList.map((item) => LeaveRequest.fromJson(item)));
  //   }
  // }
  //
  // void addToList(LeaveRequest item) {
  //   lrequestt.add(item);
  //   storage.write('myList', lrequestt.toList());
  // }

  /**/

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
    final status = statuss.value;

    addLeaves( leaveType, startDate, endDate, leaveDay, deptHead, yourReason, status);

    dropdownText.value = df.first;
    sdateController.clear();
    edateController.clear();
    ldayController.clear();
    dheadController.clear();
    yreasonController.clear();

    Get.to(MyLeavesdView());
  }

  void deleteContainer() {
    final newContainers = lrequest.where((c) => c.status != "Pending").toList();
    lrequest.value = newContainers;
  }
  /////////////////////////////////
  // int id = 1;
  // final resnCtrl = TextEditingController();

  RxString dropdownText = 'Leave Type '.obs as RxString;
  List<String> df = [
    'Leave Type ',
    'Caual Leave ',
    'Sick Leave',
  ].obs;
  List<bool> Selected = <bool>[true, false].obs;

  // var pending;
  // List<bool> status = <bool>[true, false].obs;

  var start;
  List<bool> startEnable = <bool>[true, false].obs;

  List<Widget> fullDayHalf = <Widget>[Text('Full Day'), Text('Half Day')].obs;
  RxString departmentType = 'Department Head'.obs as RxString;
  List<String> department = [
    'Department Head',
    'Emergency Medicine ',
    'Icu care ',
    'Ward ',
  ].obs;

  var statuss = 'pending'.obs;

  RxBool pending = true.obs;
  // RxString statuss = 'Pending'.obs as RxString;

  void updateStatus(String newStatus) {
    statuss.value = newStatus;
  }

  // List<String> stats = [
  //   'Pending',
  //   'Approved',
  //   'Cancelled',
  // ].obs;

  // var selectedDate = DateTime.now().obs;
  Rx<String> selectedDate = 'Start Date'.obs;
  Rx<String> selecteenddDate = 'End Date'.obs;
  Rx<String> yourReason = ''.obs;

  //var selecteenddDate = DateTime.now().obs;
  final startDate = DateTime.now().obs;
  final endDate = DateTime.now().obs;

  var leaverequest = <LeaveRequest>[].obs;


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

}