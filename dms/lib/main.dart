// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sort_child_properties_last, use_key_in_widget_constructors, sized_box_for_whitespace, prefer_final_fields, unused_element, unused_field

// ignore_for_file: prefer_final_fields, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:calendar_view/calendar_view.dart';
import 'package:dms/models/event.dart';
import 'package:dms/screens/calendar.dart';

import 'package:dms/screens/project.dart';

import 'package:flutter/gestures.dart';

import './screens/all_tasks.dart';
import './screens/homepage.dart';
import 'package:flutter/material.dart';

DateTime get _now => DateTime.now();
void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CalendarControllerProvider(
      controller: EventController(),
      child: MaterialApp(
        home: Page(),
        debugShowCheckedModeBanner: false,
        scrollBehavior: ScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.trackpad,
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
          },
        ),
      ),
    );
  }
}

class Page extends StatefulWidget {
  const Page({super.key});

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  int _selectIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  List<Widget> _itemWidget = [
    HomePage(),
    AllTasks(),
    Calendar(),
    Project(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
      body: _itemWidget.elementAt(_selectIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task_outlined),
            label: 'Task',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            label: 'Calendar',
            backgroundColor: Colors.pink,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined),
            label: 'Article',
            backgroundColor: Colors.deepOrange,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Account',
            backgroundColor: Colors.pink,
          ),
        ],
        currentIndex: _selectIndex,
        selectedItemColor: Color.fromRGBO(4, 131, 248, 1),
        onTap: ((index) => _onItemTapped(index)),
        //backgroundColor: Colors.teal,
      ),
    ));
  }
}
