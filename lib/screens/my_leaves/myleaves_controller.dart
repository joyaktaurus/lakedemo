import 'package:get/get.dart';
import 'package:lakeshore/models/leave_request_model.dart';
import 'package:lakeshore/screens/leave_request/leave_request_controller.dart';

import '../leave_request/contr.dart';

class MyLeavesController extends GetxController {
  // final count = 0.obs;
  // increment() => count.value++;

  RxList<LeaveRequest> myleavess = <LeaveRequest>[].obs;
  RxString description = ''.obs as RxString;
  var myLeaves = <LeaveRequest>[].obs;

  var leaverequest = <LeaveRequest>[].obs;

  addtoSubmit(LeaveRequest leaverequest) {
    myLeaves.add(leaverequest);
  }
}
