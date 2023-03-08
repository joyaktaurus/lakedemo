
import 'dart:math';

import 'package:cell_calendar/cell_calendar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';


class MyAttendController extends GetxController {

  final cellCalendarPageController = CellCalendarPageController();
//  var _sampleEvents = sampleEvents();
  late Map<DateTime, List<Appointment>> _dataCollection;

  @override
  void initState() {
    _dataCollection = getAppointments();
  //  _calendarDataSource = MeetingDataSource(<Appointment>[]);
   initState();
  }

  Map<DateTime, List<Appointment>> getAppointments() {
    final List<String> _subjectCollection = <String>[];
    _subjectCollection.add('L');
    _subjectCollection.add('HD');
    _subjectCollection.add('FD');
    _subjectCollection.add('A');
    _subjectCollection.add('CL');
    _subjectCollection.add('SL');
    _subjectCollection.add('Scrum');
    _subjectCollection.add('Project Completion');
    _subjectCollection.add('Release updates');
    _subjectCollection.add('Performance Check');

    final List<Color> _colorCollection = <Color>[];
    _colorCollection.add(const Color(0xFF0F8644));
    _colorCollection.add(const Color(0xFF8B1FA9));
    _colorCollection.add(const Color(0xFFD20100));
    _colorCollection.add(const Color(0xFFFC571D));
    _colorCollection.add(const Color(0xFF36B37B));
    // _colorCollection.add(const Color(0xFF01A1EF));
    // _colorCollection.add(const Color(0xFF3D4FB5));
    // _colorCollection.add(const Color(0xFFE47C73));
    // _colorCollection.add(const Color(0xFF636363));
    // _colorCollection.add(const Color(0xFF0A8043));

    final Random random = Random();
    var _dataCollection = <DateTime, List<Appointment>>{};
    final DateTime today = DateTime.now();
    final DateTime rangeStartDate = DateTime(today.year, today.month, today.day)
        .add(const Duration(days: -1000));
    final DateTime rangeEndDate = DateTime(today.year, today.month, today.day)
        .add(const Duration(days: 1000));
    for (DateTime i = rangeStartDate;
    i.isBefore(rangeEndDate);
    i = i.add(Duration(days: 1 + random.nextInt(2)))) {
      final DateTime date = i;
      final int count = 1 ;
      for (int j = 0; j < count; j++) {
        final DateTime startDate = DateTime(
            date.year, date.month, date.day, 8 + random.nextInt(8), 0, 0);
        final int duration = random.nextInt(3);
        final Appointment meeting = Appointment(
            subject: _subjectCollection[random.nextInt(4)],
            startTime: startDate,
            endTime:
            startDate.add(Duration(hours: duration == 0 ? 1 : duration)),
            color: _colorCollection[random.nextInt(4)],
            isAllDay: false);

        if (_dataCollection.containsKey(date)) {
          final List<Appointment> meetings = _dataCollection[date]!;
          meetings.add(meeting);
          _dataCollection[date] = meetings;
        } else {
          _dataCollection[date] = [meeting];
        }
      }
    }
    return _dataCollection;
  }

  List<CalendarEvent> sampleEvents() {
    final today = DateTime.now();
    final eventTextStyle = TextStyle(
      fontSize: 9,
      color: Colors.white,
    );
    final sampleEvents = [
      CalendarEvent(
        eventName: "A",
        eventDate: today.add(Duration(days: -42)),
        eventBackgroundColor: Colors.red,
        // eventTextStyle: eventTextStyle,
      ),
      CalendarEvent(
        eventName: "Writing test",
        eventDate: today.add(Duration(days: -30)),
        eventBackgroundColor: Colors.deepOrange,
        // eventTextStyle: eventTextStyle,
      ),
      CalendarEvent(
        eventName: "L",
        eventDate: today.add(Duration(days: -7)),
        eventBackgroundColor: Colors.greenAccent,
        //  eventTextStyle: eventTextStyle,
      ),

      //    eventTextStyle: eventTextStyle,
      //   ),
      //   CalendarEvent(
      //     eventName: "Walk around the park",
      //     eventDate: today.add(Duration(days: -7)),
      //     eventBackgroundColor: Colors.deepOrange,
      //  //   eventTextStyle: eventTextStyle,
      //   ),
      //   CalendarEvent(
      //     eventName: "Buy a present for Rebecca",
      //     eventDate: today.add(Duration(days: -7)),
      //     eventBackgroundColor: Colors.pink,
      // //    eventTextStyle: eventTextStyle,
      // //   ),
      //   CalendarEvent(
      //     eventName: "Firebase",
      //     eventDate: today.add(
      //       Duration(days: -7),
      //     ),
      //     eventTextStyle: eventTextStyle,

      CalendarEvent(
        eventName: "Task deadline",
        eventDate: today,
        //    eventTextStyle: eventTextStyle,
      ),
      CalendarEvent(
        eventName: "Jon's Birthday",
        eventDate: today.add(
          Duration(days: 3),
        ),
        eventBackgroundColor: Colors.green,
        //    eventTextStyle: eventTextStyle,
      ),
      CalendarEvent(
        eventName: "Date with Rebecca",
        eventDate: today.add(Duration(days: 7)),
        eventBackgroundColor: Colors.pink,
        //    eventTextStyle: eventTextStyle,
      ),
      CalendarEvent(
        eventName: "Start to study Spanish",
        eventDate: today.add(
          Duration(days: 13),
        ),
        //  eventTextStyle: eventTextStyle,
      ),
      // CalendarEvent(
      //   eventName: "Have lunch with Mike",
      //   eventDate: today.add(Duration(days: 13)),
      //   eventBackgroundColor: Colors.green,
      //   //    eventTextStyle: eventTextStyle,
      // ),
      // CalendarEvent(
      //   eventName: "Buy new Play Station software",
      //   eventDate: today.add(Duration(days: 13)),
      //   eventBackgroundColor: Colors.indigoAccent,
      //   //     eventTextStyle: eventTextStyle,
      // ),
      // CalendarEvent(
      //   eventName: "Update my flutter package",
      //   eventDate: today.add(
      //     Duration(days: 13),
      //   ),
      //   //   eventTextStyle: eventTextStyle,
      // ),
      CalendarEvent(
        eventName: "Watch movies in my house",
        eventDate: today.add(
          Duration(days: 21),
        ),
        //   eventTextStyle: eventTextStyle,
      ),
      CalendarEvent(
        eventName: "Medical Checkup",
        eventDate: today.add(Duration(days: 30)),
        eventBackgroundColor: Colors.red,
        //   eventTextStyle: eventTextStyle,
      ),
      CalendarEvent(
        eventName: "Gym",
        eventDate: today.add(Duration(days: 42)),
        eventBackgroundColor: Colors.indigoAccent,
        //    eventTextStyle: eventTextStyle,
      ),
    ];
    return sampleEvents;
  }
}