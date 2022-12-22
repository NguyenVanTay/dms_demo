// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, use_build_context_synchronously, unused_import

import 'package:calendar_view/calendar_view.dart';
import 'package:dms/screens/homecalendar.dart';
import 'package:dms/sources/CalendarSource/extension.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../models/event.dart';

import 'day_view_page.dart';
import 'month_view_page.dart';
import 'week_view_page.dart';

DateTime get _now => DateTime.now();

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return CalendarControllerProvider<Event>(
      controller: EventController<Event>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        scrollBehavior: ScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.trackpad,
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
          },
        ),
        home: HomeCalendar(),
      ),
    );
  }
}
