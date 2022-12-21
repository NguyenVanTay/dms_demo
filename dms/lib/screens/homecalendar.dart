// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:dms/sources/CalendarSource/extension.dart';
import 'package:flutter/material.dart';

import '../sources/CalendarSource/day_view_page.dart';
import '../sources/CalendarSource/month_view_page.dart';
import '../sources/CalendarSource/week_view_page.dart';

class HomeCalendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () => context.pushRoute(MonthViewPageDemo()),
              child: Text("View month with Calendar"),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () => context.pushRoute(DayViewPageDemo()),
              child: Text("View day with Calendar"),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () => context.pushRoute(WeekViewDemo()),
              child: Text("View week with Calendar"),
            ),
          ],
        ),
      ),
    );
  }
}
