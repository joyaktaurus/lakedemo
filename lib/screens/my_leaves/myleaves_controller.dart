
import 'package:get/get.dart';
import 'package:lakeshore/models/leave_request_model.dart';
import 'package:lakeshore/screens/leave_request/leave_request_controller.dart';


class MyLeavesController extends GetxController {
  RxString description = ''.obs as RxString;
  var myLeaves = <LeaveRequest>[].obs;



  removeDecsription() {
    description.close();
  }

}