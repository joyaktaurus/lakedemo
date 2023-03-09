import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lakeshore/components/request_container.dart';

import 'app_toggle.dart';

class ToggleDays extends StatefulWidget {

  @override
  _ToggleDaysState createState() => _ToggleDaysState();
}

class _ToggleDaysState extends State<ToggleDays> {
  int _toggleValue = 0;

  @override
  Widget build(BuildContext context) {
    return AnimatedToggle(

      values: ['Full Day', 'Half Day'],
      onToggleCallback: (value) {
        setState(() {
          _toggleValue = value;
        });
      },
      buttonColor: Colors.blue,
      backgroundColor: Colors.blue,
      textColor: Colors.blue,

    );
  }
}
