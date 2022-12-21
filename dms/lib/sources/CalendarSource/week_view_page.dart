// ignore_for_file: sort_child_properties_last, prefer_const_constructors, use_build_context_synchronously, library_private_types_in_public_api

import 'package:calendar_view/calendar_view.dart';
import 'package:dms/sources/CalendarSource/extension.dart';
import 'package:flutter/material.dart';

import '../../models/event.dart';
import '../../widgets/Calendarwidgets/week_view_widget.dart';
import 'create_event_page.dart';

class WeekViewDemo extends StatefulWidget {
  const WeekViewDemo({Key? key}) : super(key: key);

  @override
  _WeekViewDemoState createState() => _WeekViewDemoState();
}

class _WeekViewDemoState extends State<WeekViewDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        elevation: 8,
        onPressed: _addEvent,
      ),
      body: WeekViewWidget(),
    );
  }

  Future<void> _addEvent() async {
    final event =
        await context.pushRoute<CalendarEventData<Event>>(CreateEventPage(
      withDuration: true,
    ));
    if (event == null) return;
    CalendarControllerProvider.of<Event>(context).controller.add(event);
  }
}
