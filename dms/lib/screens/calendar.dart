// ignore_for_file: use_key_in_widget_constructors, unused_element, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_calendar/horizontal_calendar.dart';

final DateTime _now = DateTime.now();

class Calendar extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CalendarControllerProvider(
      controller: EventController(),
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
        home: SafeArea(
          child: Scaffold(
            //appBar: AppBar(),
            floatingActionButton: CircleAvatar(
              child: IconButton(
                icon: Icon(Icons.add),
                onPressed: () {},
              ),
            ),
            body: Column(
              children: [
                // HorizontalCalendar(
                //   date: DateTime.now().add(const Duration(days: 1)),
                //   initialDate: DateTime.now().subtract(const Duration(days: 2)),
                //   textColor: Colors.black,
                //   backgroundColor: Colors.white,
                //   selectedColor: Colors.orange,
                //   showMonth: true,
                //   onDateSelected: (date) {
                //     if (kDebugMode) {
                //       print(date.toString());
                //     }
                //   },
                // ),
                Expanded(child: DayView()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



// List<CalendarEventData<Event>> _events = [
//   CalendarEventData(
//     date: _now,
//     event: Event(title: "Joe's Birthday"),
//     title: "Project meeting",
//     description: "Today is project meeting.",
//     startTime: DateTime(_now.year, _now.month, _now.day, 18, 30),
//     endTime: DateTime(_now.year, _now.month, _now.day, 22),
//   ),
//   CalendarEventData(
//     date: _now.add(Duration(days: 1)),
//     startTime: DateTime(_now.year, _now.month, _now.day, 18),
//     endTime: DateTime(_now.year, _now.month, _now.day, 19),
//     event: Event(title: "Wedding anniversary"),
//     title: "Wedding anniversary",
//     description: "Attend uncle's wedding anniversary.",
//   ),
//   CalendarEventData(
//     date: _now,
//     startTime: DateTime(_now.year, _now.month, _now.day, 14),
//     endTime: DateTime(_now.year, _now.month, _now.day, 17),
//     event: Event(title: "Football Tournament"),
//     title: "Football Tournament",
//     description: "Go to football tournament.",
//   ),
//   CalendarEventData(
//     date: _now.add(Duration(days: 3)),
//     startTime: DateTime(_now.add(Duration(days: 3)).year,
//         _now.add(Duration(days: 3)).month, _now.add(Duration(days: 3)).day, 10),
//     endTime: DateTime(_now.add(Duration(days: 3)).year,
//         _now.add(Duration(days: 3)).month, _now.add(Duration(days: 3)).day, 14),
//     event: Event(title: "Sprint Meeting."),
//     title: "Sprint Meeting.",
//     description: "Last day of project submission for last year.",
//   ),
//   CalendarEventData(
//     date: _now.subtract(Duration(days: 2)),
//     startTime: DateTime(
//         _now.subtract(Duration(days: 2)).year,
//         _now.subtract(Duration(days: 2)).month,
//         _now.subtract(Duration(days: 2)).day,
//         14),
//     endTime: DateTime(
//         _now.subtract(Duration(days: 2)).year,
//         _now.subtract(Duration(days: 2)).month,
//         _now.subtract(Duration(days: 2)).day,
//         16),
//     event: Event(title: "Team Meeting"),
//     title: "Team Meeting",
//     description: "Team Meeting",
//   ),
//   CalendarEventData(
//     date: _now.subtract(Duration(days: 2)),
//     startTime: DateTime(
//         _now.subtract(Duration(days: 2)).year,
//         _now.subtract(Duration(days: 2)).month,
//         _now.subtract(Duration(days: 2)).day,
//         10),
//     endTime: DateTime(
//         _now.subtract(Duration(days: 2)).year,
//         _now.subtract(Duration(days: 2)).month,
//         _now.subtract(Duration(days: 2)).day,
//         12),
//     event: Event(title: "Chemistry Viva"),
//     title: "Chemistry Viva",
//     description: "Today is Joe's birthday.",
//   ),
// ];

