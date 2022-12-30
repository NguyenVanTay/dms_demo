// ignore_for_file: override_on_non_overriding_member

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'event_calendar.dart';

class EventDataSource extends CalendarDataSource {
  EventDataSource(List<Event> appointments) {
    this.appointments = appointments;
  }
  Event getEvent(int index) => appointments![index] as Event;


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
    return appointments![index].title;
  }

  //color backgroud
  @override
  Color getColor(int index) {
    return appointments![index].backgroundColor;
  }
  //color backgroud
 


  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
    @override
  String getDescription(int index) {
    return appointments![index].description;
  }


}


