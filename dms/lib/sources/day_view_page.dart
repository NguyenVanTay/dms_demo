// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, sort_child_properties_last, library_private_types_in_public_api

import 'package:calendar_view/calendar_view.dart';
import 'package:dms/sources/extension.dart';
import 'package:flutter/material.dart';

import '../models/event.dart';
import '../widgets/Calendarwidgets/day_view_widget.dart';
import 'create_event_page.dart';

class DayViewPageDemo extends StatefulWidget {
  const DayViewPageDemo({Key? key}) : super(key: key);

  @override
  _DayViewPageDemoState createState() => _DayViewPageDemoState();
}

class _DayViewPageDemoState extends State<DayViewPageDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SingleChildScrollView(child: DayViewWidget()),
    );
  }
}
