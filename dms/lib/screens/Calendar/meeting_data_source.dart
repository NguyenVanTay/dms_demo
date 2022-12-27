// ignore_for_file: override_on_non_overriding_member

import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'meeting.dart';

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }
  // start Date (time)
  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  // end Date (time)
  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  //subject
  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  //color backgroud
  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }


}
