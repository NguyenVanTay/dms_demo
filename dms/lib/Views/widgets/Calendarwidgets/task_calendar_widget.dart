// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, curly_braces_in_flow_control_structures

import 'package:dms/models/event_calendar.dart';
import 'package:dms/models/event_data_source.dart';
import 'package:dms/Views/screens/Calendar/event_viewing_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../../controllers/providers/event_provider.dart';

class TaskCalendarWidget extends StatefulWidget {
  @override
  State<TaskCalendarWidget> createState() => _TaskCalendarWidgetState();
}

class _TaskCalendarWidgetState extends State<TaskCalendarWidget> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EventProvider>(context);
   
      return SfCalendar(
        view: CalendarView.timelineDay,
        dataSource: EventDataSource(provider.events),
        initialDisplayDate: provider.selectedDate,
        initialSelectedDate: provider.selectedDate,
        appointmentBuilder: appointmentBuider,
        todayHighlightColor: Colors.teal,
        onTap: (details) {
          if (details.appointments == null) return;
          final event = details.appointments!.first;
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => EventViewingScreen(event: event)));
        },
      );
  }
}

Widget appointmentBuider(
    BuildContext context, CalendarAppointmentDetails details) {
  final event = details.appointments.first;
  return Container(
    width: details.bounds.width,
    height: details.bounds.height,
    decoration: BoxDecoration(color: event.backgroundColor),
    child: Center(
      child: Text(
        event.title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
      ),
    ),
  );
}
