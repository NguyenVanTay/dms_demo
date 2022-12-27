// ignore_for_file: file_names, prefer_const_constructors

import 'package:dms/screens/Calendar/meeting.dart';
import 'package:flutter/material.dart';

class MeetingProvider extends ChangeNotifier {
  List<Meeting> meetings = [
    Meeting("conference", DateTime(2022, 12, 27, 16, 0, 0),
        DateTime(2022, 12, 27, 18, 0, 0), Colors.green, false),
    Meeting("conference", DateTime(2022, 12, 28, 16, 0, 0),
        DateTime(2022, 12, 28, 18, 0, 0), Colors.red, false),
    Meeting("set up project and tool dms", DateTime(2022, 12, 27, 16, 21, 10),
        DateTime(2023, 1, 1, 16, 21, 10), Colors.grey, false),
  ];
  //add meeting

}
