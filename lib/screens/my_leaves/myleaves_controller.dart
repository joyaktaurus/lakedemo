
import 'package:get/get.dart';
import 'package:lakeshore/models/leave_request_model.dart';
import 'package:lakeshore/screens/leave_request/leave_request_controller.dart';

import '../leave_request/contr.dart';


class MyLeavesController extends GetxController {
  RxString description = ''.obs as RxString;
 // var myLeaves = <LeaveRequest>[].obs;

  //var leaverequest = <LeaveRequest>[].obs;
  RxList<LeaveRequest> leaverequest = <LeaveRequest>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchRequest();
  }

  void fetchRequest() async {
    await Future.delayed(Duration(seconds: 1));
    var requestResponse = [
      LeaveRequest(
        id: 1,
        leaveType: 'Casual Leave',
        startDate:
        '11-02-2023',
        endDate: '14-02-2023',
        leaveDay: 'Full day',
        deptHead: 'Ward',
        yourReason: 'Going For a Trip',
      ),
      LeaveRequest(
        id: 2,
        leaveType: 'Casual Leave',
        startDate:
        '21-02-2023',
        endDate: '14-03-2023',
        leaveDay: 'Half day',
        deptHead: 'Icu care',
        yourReason: 'Fever',
      ),
      LeaveRequest(
        id: 3,
        leaveType: 'Sick Leave',
        startDate:
        '15-02-2023',
        endDate: '24-02-2023',
        leaveDay: 'Full day',
        deptHead: 'Ward',
        yourReason: 'Party',
      ),
    ];
    leaverequest.value = requestResponse;
  }

  removeDecsription() {
    description.close();
  }

}