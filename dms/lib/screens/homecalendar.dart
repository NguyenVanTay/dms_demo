// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unnecessary_new

import 'package:dms/sources/CalendarSource/extension.dart';
import 'package:flutter/material.dart';
import '../sources/CalendarSource/day_view_page.dart';
import '../sources/CalendarSource/month_view_page.dart';
import '../sources/CalendarSource/week_view_page.dart';

class HomeCalendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Calendar",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.arrow_back_outlined),
          splashColor: Colors.grey,
          onPressed: () {},
        ),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.grey[50],
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert),
              color: Colors.black,
            ),
          )
        ],
        backgroundColor: Colors.white,
      ),
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
