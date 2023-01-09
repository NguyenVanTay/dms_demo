// ignore_for_file: prefer_final_fields, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element, unnecessary_new, unused_field, unused_import
import 'package:calendar_view/calendar_view.dart';
import 'package:dms/Views/screens/discussion.dart';
import 'package:dms/controllers/providers/event_provider.dart';
import 'package:dms/routers/router.dart';
import 'package:dms/Views/screens/Calendar/calendar_widget.dart';
import 'package:dms/Views/screens/GanttChart/gantt_chart.dart';
import 'package:dms/Views/screens/GanttChart/gantt_chart_view.dart';

import 'package:dms/Views/screens/detail_performers.dart';
import 'package:dms/Views/screens/detail_task.dart';
import 'package:dms/Views/screens/login.dart';
import 'package:dms/Views/screens/register.dart';
import 'package:dms/Views/screens/send_task.dart';
import 'package:dms/Views/screens/verify_task.dart';
import 'package:dms/Views/screens/project.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'Views/screens/all_tasks.dart';
import 'Views/screens/homepage.dart';
import 'package:flutter/material.dart';

DateTime get _now => DateTime.now();
void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => EventProvider())],
      child: GetMaterialApp(
        scrollBehavior: MyCustomScrollBehavior(),
        debugShowCheckedModeBanner: false,
        home: VerifyTask(),
      ),
    );
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
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
    CalendarWidget(),
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
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined),
            label: 'Article',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Account',
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
