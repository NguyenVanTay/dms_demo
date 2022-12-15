// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_typing_uninitialized_variables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_calendar/horizontal_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  var selectedDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Calenda",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios_new),
          splashColor: Colors.grey,
          color: Colors.black,
          //style: ButtonStyle(backgroundColor: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: HorizontalCalendar(
        date: DateTime.now().add(const Duration(days: 1)),
        initialDate: DateTime.now().subtract(const Duration(days: 2)),
        textColor: Colors.black,
        backgroundColor: Colors.white,
        selectedColor: Colors.orange,
        showMonth: true,
        onDateSelected: (date) {
          if (kDebugMode) {
            print(date.toString());
          }
        },
      ),
    ); //bottomNavigationBar: null,);
  }
}
