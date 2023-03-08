import 'package:cell_calendar/cell_calendar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:lakeshore/calendersf.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import '../../components/background.dart';
import '../../components/rounded_loader.dart';
import '../../my_theme.dart';
import '../../utils/my_utils.dart';
import 'myattendence_controller.dart';

class MyAttendView extends GetView<MyAttendController> {
  MyAttendView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          MyUtils.hideKeyboard();
        },
        child: Scaffold(
          body: Stack(children: [
            BackGround(
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        splashColor: Colors.grey[300],
                        splashRadius: 40,
                        icon: Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.blue,
                          size: 35,
                        )),
                    SizedBox(width: Get.width * 0.15),
                    Text(
                      "My Attendence",
                      style: MyTheme.regularTextStyle(
                          color: Colors.blue,
                          textSize: 24,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 200, bottom: 100),
              child: Container(
               // width: Get.width * 0.99,
                child: MyCalenderPage(),
              ),
            ),
          ]),
        ));
  }
}
// class MeetingDataSource extends CalendarDataSource {
//   MeetingDataSource(List<Appointment> source) {
//     appointments = source;
//   }
//
//   @override
//   Future<void> handleLoadMore(DateTime startDate, DateTime endDate) async {
//     await Future.delayed(Duration(seconds: 1));
//     final List<Appointment> meetings = <Appointment>[];
//     DateTime appStartDate = startDate;
//     DateTime appEndDate = endDate;
//
//     while (appStartDate.isBefore(appEndDate)) {
//       final List<Appointment>? data = _dataCollection[appStartDate];
//       if (data == null) {
//         appStartDate = appStartDate.add(Duration(days: 1));
//         continue;
//       }
//       for (final Appointment meeting in data) {
//         if (appointments!.contains(meeting)) {
//           continue;
//         }
//         meetings.add(meeting);
//       }
//       appStartDate = appStartDate.add(Duration(days: 1));
//     }
//     appointments!.addAll(meetings);
//     notifyListeners(CalendarDataSourceAction.add, meetings);
//   }
// }