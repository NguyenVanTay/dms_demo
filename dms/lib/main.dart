// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sort_child_properties_last, use_key_in_widget_constructors, sized_box_for_whitespace, prefer_final_fields, unused_element, unused_field

// ignore_for_file: prefer_final_fields

import 'package:dms/screens/calendar.dart';
import 'package:dms/screens/login.dart';
import 'package:dms/screens/performer_group.dart';
import 'package:dms/screens/project.dart';
import 'package:dms/screens/register.dart';

import './screens/all_tasks.dart';
import './screens/homepage.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Page(),
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

// // ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_typing_uninitialized_variables, avoid_unnecessary_containers, avoid_print

// // import 'dart:html';

// // import 'package:auto_route/auto_route.dart';
// // import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// // import 'package:horizontal_calendar/horizontal_calendar.dart';
// import 'package:calendar_view/calendar_view.dart';

// class Calendar extends StatefulWidget {
//   const Calendar({super.key});

//   @override
//   State<Calendar> createState() => _CalendarState();
// }

// class _CalendarState extends State<Calendar> {
//   var selectedDate;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         // // appBar: AppBar(
//         // //   centerTitle: true,
//         // //   title: Text(
//         // //     "Calendar",
//         // //     style: TextStyle(
//         // //       fontSize: 20,
//         // //       fontWeight: FontWeight.bold,
//         // //       color: Colors.black,
//         // //     ),
//         // //   ),
//         // //   leading: IconButton(
//         // //     onPressed: () {},
//         // //     icon: Icon(Icons.arrow_back_ios_new),
//         // //     splashColor: Colors.grey,
//         // //     color: Colors.black,
//         // //     //style: ButtonStyle(backgroundColor: Colors.black),
//         // //   ),
//         // //   backgroundColor: Colors.white,
//         // // ),
//         body: Container(
//       //   // margin: EdgeInsets.all(10),
//       //   // child: HorizontalCalendar(
//       //   //   date: DateTime.now().add(const Duration(days: 2)),
//       //   //   initialDate: DateTime.now().subtract(const Duration(days: 1000000)),
//       //   //   textColor: Colors.black,
//       //   //   backgroundColor: Colors.white,
//       //   //   selectedColor: Colors.teal,
//       //   //   showMonth: true,
//       //   //   onDateSelected: (date) {
//       //   //     if (kDebugMode) {
//       //   //       print(date.toString());
//       //   //     }
//       //   //   },
//       //   // ),
//       child: DayView(
//         controller: EventController(),
//         eventTileBuilder: (date, events, boundry, start, end) {
//           // Return your widget to display as event tile.
//           return Container();
//         },
//         showVerticalLine: true, // To display live time line in day view.
//         showLiveTimeLineInAllDays:
//             true, // To display live time line in all pages in day view.
//         minDay: DateTime(1990),
//         maxDay: DateTime(2100),
//         initialDay: DateTime.now(),
//         heightPerMinute: 1, // height occupied by 1 minute time span.
//         eventArranger:
//             SideEventArranger(), // To define how simultaneous events will be arranged.
//         onEventTap: (events, date) => print(events),
//         onDateLongPress: (date) => print(date),
//       ),
//     ));
//     //); //bottomNavigationBar: null,);
//     // floatingActionButton: FloatingActionButton(
//     //   child: Icon(Icons.add),
//     //   elevation: 8,
//     //   onPressed: () async {
//     //     final event = await context.pushRoute<CalendarEventData<Event>>(
//     //       CreateEventPage(
//     //         withDuration: true,
//     //       ),
//     //     );
//     //     if (event == null) return;
//     //     CalendarControllerProvider.of<Event>(context).controller.add(event);
//     //   },
//     // ),
//   }
// }

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, camel_case_types

// import 'package:calendar_view/calendar_view.dart';
// import 'package:dms/sources/extension.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';

// import '../models/event.dart';

// import 'screens/day_view_page.dart';

// DateTime get _now => DateTime.now();

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: testpage(),
//       ),
//     );
    // return CalendarControllerProvider<Event>(
    //     controller: EventController<Event>()..addAll(_events),
    //     child: MaterialApp(
    //       title: 'Flutter Calendar Page Demo',
    //       debugShowCheckedModeBanner: false,
    //       theme: ThemeData.light(),
    //       scrollBehavior: ScrollBehavior().copyWith(
    //         dragDevices: {
    //           PointerDeviceKind.trackpad,
    //           PointerDeviceKind.mouse,
    //           PointerDeviceKind.touch,
    //         },
    //       ),
    //       home: Scaffold(
    //         appBar: AppBar(
    //           title: Text("Flutter Calendar Page"),
    //           centerTitle: true,
    //         ),
    //         body: Container(
    //           height: 300,
    //           child: Column(children: [
    //             DayViewPageDemo(),
    //           ]

    //               //mainAxisSize: MainAxisSize.min,

    //               // children: [
    //               //   // ElevatedButton(
    //               //   //   // onPressed: () => context.pushRoute(MonthViewPageDemo()),
    //               //   //   // child: Text("Month View"),
    //               //   // ),
    //               //   // SizedBox(
    //               //   //   height: 20,
    //               //   // ),
    //               //   // ElevatedButton(
    //               //   //   onPressed: () => context.pushRoute(DayViewPageDemo()),
    //               //   //   child: Text("Day View"),
    //               //   // ),
    //               //   // SizedBox(
    //               //   //   height: 20,
    //               //   // ),
    //               //   // ElevatedButton(
    //               //   //   onPressed: () => context.pushRoute(WeekViewDemo()),
    //               //   //   child: Text("Week View"),
    //               //   // ),
    //               // ],
    //               ),
    //         ),
    //       ),
    //     ));
    // //);
  //}
//}
// class testpage extends StatelessWidget {
//   const testpage({super.key});

//   @override
//   Widget build(BuildContext context) {
//      return CalendarControllerProvider<Event>(
//         controller: EventController<Event>()..addAll(_events),
//         child: MaterialApp(
//           title: 'Flutter Calendar Page Demo',
//           debugShowCheckedModeBanner: false,
//           theme: ThemeData.light(),
//           scrollBehavior: ScrollBehavior().copyWith(
//             dragDevices: {
//               PointerDeviceKind.trackpad,
//               PointerDeviceKind.mouse,
//               PointerDeviceKind.touch,
//             },
//           ),
//           home: Scaffold(
//             appBar: AppBar(
//               title: Text("Flutter Calendar Page"),
//               centerTitle: true,
//             ),
//             body: Container(
//               height: 300,
//               child: Column(children: [
//                 DayViewPageDemo(),
//               ]
//               ),))));
//   }
// }

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
