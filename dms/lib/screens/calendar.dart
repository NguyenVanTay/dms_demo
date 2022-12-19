// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, use_build_context_synchronously

import 'package:calendar_view/calendar_view.dart';
import 'package:dms/sources/extension.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../models/event.dart';
import '../sources/create_event_page.dart';
import '../sources/day_view_page.dart';

final DateTime _now = DateTime.now();

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return CalendarControllerProvider<Event>(
      controller: EventController<Event>()..addAll(_events),
      child: MaterialApp(
        title: 'Flutter Calendar Page Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        scrollBehavior: ScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.trackpad,
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
          },
        ),
        home: Scaffold(
          //appBar: AppBar(),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            elevation: 8,
            onPressed: () async {
              final event = await context
                  .pushRoute<CalendarEventData<Event>>(CreateEventPage(
                withDuration: true,
              ));
              if (event == null) return;

              CalendarControllerProvider.of<Event>(context)
                  .controller
                  .add(event);
            },
          ),
          body: DayViewPageDemo(),
        ),
      ),
    );
  }
}

List<CalendarEventData<Event>> _events = [
  // CalendarEventData(
  //   date: _now,
  //   event: Event(title: "Joe's Birthday"),
  //   title: "Project meeting",
  //   description: "Today is project meeting.",
  //   startTime: DateTime(_now.year, _now.month, _now.day, 18, 30),
  //   endTime: DateTime(_now.year, _now.month, _now.day, 22),
  // ),
  // CalendarEventData(
  //   date: _now.add(Duration(days: 1)),
  //   startTime: DateTime(_now.year, _now.month, _now.day, 18),
  //   endTime: DateTime(_now.year, _now.month, _now.day, 19),
  //   event: Event(title: "Wedding anniversary"),
  //   title: "Wedding anniversary",
  //   description: "Attend uncle's wedding anniversary.",
  // ),
  // CalendarEventData(
  //   date: _now,
  //   startTime: DateTime(_now.year, _now.month, _now.day, 14),
  //   endTime: DateTime(_now.year, _now.month, _now.day, 17),
  //   event: Event(title: "Football Tournament"),
  //   title: "Football Tournament",
  //   description: "Go to football tournament.",
  // ),
  // CalendarEventData(
  //   date: _now.add(Duration(days: 3)),
  //   startTime: DateTime(_now.add(Duration(days: 3)).year,
  //       _now.add(Duration(days: 3)).month, _now.add(Duration(days: 3)).day, 10),
  //   endTime: DateTime(_now.add(Duration(days: 3)).year,
  //       _now.add(Duration(days: 3)).month, _now.add(Duration(days: 3)).day, 14),
  //   event: Event(title: "Sprint Meeting."),
  //   title: "Sprint Meeting.",
  //   description: "Last day of project submission for last year.",
  // ),
  // CalendarEventData(
  //   date: _now.subtract(Duration(days: 2)),
  //   startTime: DateTime(
  //       _now.subtract(Duration(days: 2)).year,
  //       _now.subtract(Duration(days: 2)).month,
  //       _now.subtract(Duration(days: 2)).day,
  //       14),
  //   endTime: DateTime(
  //       _now.subtract(Duration(days: 2)).year,
  //       _now.subtract(Duration(days: 2)).month,
  //       _now.subtract(Duration(days: 2)).day,
  //       16),
  //   event: Event(title: "Team Meeting"),
  //   title: "Team Meeting",
  //   description: "Team Meeting",
  // ),
  // CalendarEventData(
  //   date: _now.subtract(Duration(days: 2)),
  //   startTime: DateTime(
  //       _now.subtract(Duration(days: 2)).year,
  //       _now.subtract(Duration(days: 2)).month,
  //       _now.subtract(Duration(days: 2)).day,
  //       10),
  //   endTime: DateTime(
  //       _now.subtract(Duration(days: 2)).year,
  //       _now.subtract(Duration(days: 2)).month,
  //       _now.subtract(Duration(days: 2)).day,
  //       12),
  //   event: Event(title: "Chemistry Viva"),
  //   title: "Chemistry Viva",
  //   description: "Today is Joe's birthday.",
  // ),
];
