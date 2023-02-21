import 'dart:math';
import 'package:flutter/material.dart';
import 'package:lakeshore/components/rounded_loader.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

late Map<DateTime, List<Appointment>> _dataCollection;

class _MyHomePageState extends State<MyHomePage> {
  late var _calendarDataSource;

  @override
  void initState() {
    _dataCollection = getAppointments();
    _calendarDataSource = MeetingDataSource(<Appointment>[]);
    super.initState();
  }
  Color _cellBorderColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 200,bottom: 100),
        child: SfCalendar(
        //  monthCellBuilder: monthCellBuilder,
          cellEndPadding: 15,
          showDatePickerButton: true,
          showNavigationArrow: true,
          cellBorderColor: _cellBorderColor,
          view: CalendarView.month,
          monthViewSettings: MonthViewSettings(
           // agendaItemHeight: 500,
            showTrailingAndLeadingDates: false,
              appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
          ),
          dataSource: _calendarDataSource,
          loadMoreWidgetBuilder:
              (BuildContext context, LoadMoreCallback loadMoreAppointments) {
            return FutureBuilder(
              future: loadMoreAppointments(),
              builder: (context, snapShot) {
                return Container(
                  alignment: Alignment.center,
                  child: RoundedLoader(),
                  // CircularProgressIndicator(
                  //   valueColor: AlwaysStoppedAnimation(Colors.blue),
                  // ),
                );
              },
            );
          },
        ),
      ),
    );
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
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> source) {
    appointments = source;
  }

  @override
  Future<void> handleLoadMore(DateTime startDate, DateTime endDate) async {
    await Future.delayed(Duration(seconds: 1));
    final List<Appointment> meetings = <Appointment>[];
    DateTime appStartDate = startDate;
    DateTime appEndDate = endDate;

    while (appStartDate.isBefore(appEndDate)) {
      final List<Appointment>? data = _dataCollection[appStartDate];
      if (data == null) {
        appStartDate = appStartDate.add(Duration(days: 1));
        continue;
      }
      for (final Appointment meeting in data) {
        if (appointments!.contains(meeting)) {
          continue;
        }
        meetings.add(meeting);
      }
      appStartDate = appStartDate.add(Duration(days: 1));
    }
    appointments!.addAll(meetings);
    notifyListeners(CalendarDataSourceAction.add, meetings);
  }
}


// Widget monthCellBuilder(BuildContext context, MonthCellDetails details) {
//   var mid = details.visibleDates.length ~/ 1.toInt();
//   var midDate = details.visibleDates[0].add(Duration(days: mid));
//
//   if (details.date.month != midDate.month) {
//     return Container(
//       color: Colors.white,
//       child: Center(
//         child: Text(
//           details.date.day.toString(),
//         ),
//       ),
//     );
//   } else {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//        // color: Colors.green,
//         child: Center(
//           child: Text(
//             details.date.day.toString(),
//           ),
//         ),
//       ),
//     );
//   }
// }




























// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:lakeshore/routes.dart';
//
// final rememberMeController = Get.put(RememberMeController());
//
// class RememberMeController extends GetxController {
//   final _rememberMe = false.obs;
//   final _getStorage = GetStorage();
//
//   get rememberMe => this._rememberMe.value;
//   set rememberMe(value) => this._rememberMe.value = value;
//
//   @override
//   void onInit() {
//     // Check if remember me is true in storage
//     if (_getStorage.hasData("remember_me")) {
//       _rememberMe.value = _getStorage.read("remember_me");
//     }
//   }
//
//   void toggleRememberMe(bool newValue) {
//     _rememberMe.value = newValue;
//     _getStorage.write("remember_me", _rememberMe.value);
//   }
// }
//
// class LoginPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               decoration: InputDecoration(labelText: "Email"),
//             ),
//             TextField(
//               decoration: InputDecoration(labelText: "Password"),
//               obscureText: true,
//             ),
//             Checkbox(
//               activeColor: Colors.red,
//               checkColor: Colors.green,
//               value: rememberMeController.rememberMe,
//               onChanged: (value) {
//                 if (value != null)
//                   rememberMeController.toggleRememberMe(value);
//
//                 // Checkbox(
//                 //   value: rememberMeController.rememberMe,
//                 //   onChanged: (value) => rememberMeController.toggleRememberMe(value!),
//               }),
//             Text("Remember me"),
//             ElevatedButton(
//               child: Text("Log In"),
//               onPressed: () {
//                 Get.toNamed(Routes.dashBoardPage);
//                 // Handle login
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(MaterialApp(
//     home: LoginPage(),
//   ));
// }