import 'package:cell_calendar/cell_calendar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../components/background.dart';
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
                      "Notice Board",
                      style: MyTheme.regularTextStyle(
                          color: Colors.blue,
                          textSize: 24,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
               // width: Get.width * 0.99,
                height: Get.height* 0.7,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CellCalendar(
                    cellCalendarPageController: controller.cellCalendarPageController,
                    events: controller.sampleEvents(),
                    daysOfTheWeekBuilder: (dayIndex) {
                      final labels = ["S", "M", "T", "W", "T", "F", "S"];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: Text(
                          labels[dayIndex],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      );
                    },
                    monthYearLabelBuilder: (datetime) {
                      final year = datetime?.year.toString();
                      final month = datetime?.month.monthName;
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        child: Row(
                          children: [
                            const SizedBox(width: 16),
                            Text(
                              "$month  $year",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              padding: EdgeInsets.zero,
                              icon: Icon(Icons.calendar_today),
                              onPressed: () {
                                controller.cellCalendarPageController.animateToDate(
                                  DateTime.now(),
                                  curve: Curves.linear,
                                  duration: Duration(milliseconds: 300),
                                );
                              },
                            )
                          ],
                        ),
                      );
                    },
                    onCellTapped: (date) {
                      final eventsOnTheDate =
                          controller.sampleEvents().where((event) {
                        final eventDate = event.eventDate;
                        return eventDate.year == date.year &&
                            eventDate.month == date.month &&
                            eventDate.day == date.day;
                      }).toList();
                      showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                                title: Text(
                                    date.month.monthName + " " + date.day.toString()),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: eventsOnTheDate
                                      .map(
                                        (event) => Container(
                                          width: double.infinity,
                                          padding: EdgeInsets.all(4),
                                          margin: EdgeInsets.only(bottom: 12),
                                          color: event.eventBackgroundColor,
                                          child: Text(
                                            event.eventName,
                                            //style: event.eventTextStyle,
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                              ));
                    },
                    onPageChanged: (firstDate, lastDate) {
                      /// Called when the page was changed
                      /// Fetch additional events by using the range between [firstDate] and [lastDate] if you want
                    },
                  ),
                ),
              ),
            ),
          ]),
        ));
  }
}
