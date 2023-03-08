import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lakeshore/models/leave_request_model.dart';
import 'package:lakeshore/screens/leave_request/leave_request_controller.dart';



class MyLeavesController extends GetxController {
  // int idFromFirstController = Get.find<LeaveRequestController>().id;
  final LeaveRequestController controllerl = Get.put(LeaveRequestController());

  @override
  void onInit() {
    super.onInit();
    //  debugPrint('$idFromFirstController'); // prints 1
  }


  // final count = 0.obs;
  // increment() => count.value++;
  RxBool status = false.obs;


  RxList<LeaveRequest> myleavess = <LeaveRequest>[].obs;
  RxString description = ''.obs as RxString;
  var myLeaves = <LeaveRequest>[].obs;

  // var leaverequest = <LeaveRequest>[].obs;

  // addtoSubmit(LeaveRequest leaverequest) {
  //   myLeaves.add(leaverequest);
  // }

  // @override
  // void onInit() {
  //   super.onInit();
  //   //fetchRequest();
  // }

  void fetchRequest() async {
    await Future.delayed(Duration(seconds: 1));
    var requestResponse = [
      LeaveRequest(
        // id: 1,
        leaveType: 'Casual Leave',
        startDate: '11-02-2023',
        endDate: '14-02-2023',
        leaveDay: 'Full day',
        deptHead: 'Ward',
        yourReason: 'bnbvnb',
      ),
      LeaveRequest(
        //   id: 2,
        leaveType: 'Casual Leave',
        startDate: '21-02-2023',
        endDate: '14-03-2023',
        leaveDay: 'Half day',
        deptHead: 'Icu care',
        yourReason: '4cvbb',
      ),
      LeaveRequest(
        //   id: 3,
        leaveType: 'Sick Leave',
        startDate: '15-02-2023',
        endDate: '24-02-2023',
        leaveDay: 'Full day',
        deptHead: 'Ward',
        yourReason: 'cbhfghg4',
      ),
    ];
    myLeaves.value = requestResponse;
  }



}