// // // ignore_for_file: prefer_final_fields, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element, unnecessary_new, unused_field, unused_import
// // import 'package:calendar_view/calendar_view.dart';
// // import 'package:dms/routers/router.dart';
// // import 'package:dms/screens/detail_performers.dart';
// // import 'package:dms/screens/detail_task.dart';
// // import 'package:dms/screens/login.dart';
// // import 'package:dms/screens/register.dart';
// // import 'package:dms/screens/send_task.dart';
// // import 'package:dms/screens/verify_task.dart';
// // import 'package:dms/sources/CalendarSource/calendar.dart';
// // import 'package:dms/screens/project.dart';
// // import 'package:flutter/gestures.dart';
// // import 'package:get/get.dart';
// // import './screens/all_tasks.dart';
// // import './screens/homepage.dart';
// // import 'package:flutter/material.dart';
// // import 'models/event.dart';

// // DateTime get _now => DateTime.now();
// // void main(List<String> args) {
// //   runApp(const MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return CalendarControllerProvider<Event>(
// //       controller: EventController(),
// //       child: GetMaterialApp(
// //         //home: HomePage(),
// //         debugShowCheckedModeBanner: false,
// //         scrollBehavior: ScrollBehavior().copyWith(
// //           dragDevices: {
// //             PointerDeviceKind.trackpad,
// //             PointerDeviceKind.mouse,
// //             PointerDeviceKind.touch,
// //           },
// //         ),
// //         home: Page(),
// //       ),
// //     );
// //   }
// // }

// // class Page extends StatefulWidget {
// //   const Page({super.key});

// //   @override
// //   State<Page> createState() => _PageState();
// // }

// // class _PageState extends State<Page> {
// //   int _selectIndex = 0;
// //   void _onItemTapped(int index) {
// //     setState(() {
// //       _selectIndex = index;
// //     });
// //   }

// //   List<Widget> _itemWidget = [
// //     HomePage(),
// //     AllTasks(),
// //     Calendar(),
// //     Project(),
// //     Container(),
// //   ];

// //   @override
// //   Widget build(BuildContext context) {
// //     return SafeArea(
// //         child: Scaffold(
// //       resizeToAvoidBottomInset: false,
// //       body: _itemWidget.elementAt(_selectIndex),
// //       bottomNavigationBar: BottomNavigationBar(
// //         type: BottomNavigationBarType.fixed,
// //         items: [
// //           BottomNavigationBarItem(
// //             icon: Icon(Icons.home_outlined),
// //             label: 'Home',
// //           ),
// //           BottomNavigationBarItem(
// //             icon: Icon(Icons.task_outlined),
// //             label: 'Task',
// //           ),
// //           BottomNavigationBarItem(
// //             icon: Icon(Icons.calendar_month_outlined),
// //             label: 'Calendar',
// //           ),
// //           BottomNavigationBarItem(
// //             icon: Icon(Icons.article_outlined),
// //             label: 'Article',
// //           ),
// //           BottomNavigationBarItem(
// //             icon: Icon(Icons.account_circle_outlined),
// //             label: 'Account',
// //           ),
// //         ],
// //         currentIndex: _selectIndex,
// //         selectedItemColor: Color.fromRGBO(4, 131, 248, 1),
// //         onTap: ((index) => _onItemTapped(index)),
// //         //backgroundColor: Colors.teal,
// //       ),
// //     ));
// //   }
// // }

// // ignore_for_file: prefer_const_constructors

// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:gantt_chart/gantt_chart.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyCustomScrollBehavior extends MaterialScrollBehavior {
//   // Override behavior methods and getters like dragDevices
//   @override
//   Set<PointerDeviceKind> get dragDevices => {
//         PointerDeviceKind.touch,
//         PointerDeviceKind.mouse,
//         // etc.
//       };
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       scrollBehavior: MyCustomScrollBehavior(),
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   double dayWidth = 30;
//   bool showDaysRow = true;
//   bool showStickyArea = true;
//   void onZoomIn() {
//     setState(() {
//       dayWidth += 5;
//     });
//   }

//   void onZoomOut() {
//     if (dayWidth <= 10) return;
//     setState(() {
//       dayWidth -= 5;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Gantt chart demo'),
//         actions: [
//           IconButton(
//             onPressed: onZoomIn,
//             icon: const Icon(
//               Icons.zoom_in,
//             ),
//           ),
//           IconButton(
//             onPressed: onZoomOut,
//             icon: const Icon(
//               Icons.zoom_out,
//             ),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SwitchListTile.adaptive(
//               value: showDaysRow,
//               title: Text('Show Days Row ?'),
//               onChanged: (newVal) {
//                 setState(() {
//                   showDaysRow = newVal;
//                 });
//               },
//             ),
//             SwitchListTile.adaptive(
//               value: showStickyArea,
//               title: Text('Show Sticky Area ?'),
//               onChanged: (newVal) {
//                 setState(() {
//                   showStickyArea = newVal;
//                 });
//               },
//             ),
//             GanttChartView(
//               maxDuration: const Duration(days: 30 * 2),
//               startDate: DateTime(2022, 6, 7),
//               dayWidth: dayWidth,
//               eventHeight: 40,
//               stickyAreaWidth: 200,
//               showStickyArea: showStickyArea,
//               showDays: showDaysRow,
//               weekEnds: const {WeekDay.friday, WeekDay.saturday},
//               isExtraHoliday: (context, day) {
//                 //define custom holiday logic for each day
//                 return DateUtils.isSameDay(DateTime(2022, 7, 1), day);
//               },
//               startOfTheWeek: WeekDay.sunday,
//               events: [
//                 GanttRelativeEvent(
//                   relativeToStart: const Duration(days: 0),
//                   duration: const Duration(days: 0),
//                   displayName: 'Fake Event',
//                 ),
//                 GanttRelativeEvent(
//                   relativeToStart: const Duration(days: 0),
//                   duration: const Duration(days: 5),
//                   displayName: '1) This is a very long event name',
//                 ),
//                 GanttRelativeEvent(
//                   relativeToStart: const Duration(days: 1),
//                   duration: const Duration(days: 6),
//                   displayName: '2',
//                 ),
//                 GanttRelativeEvent(
//                   relativeToStart: const Duration(days: 2),
//                   duration: const Duration(days: 7),
//                   displayName: '3',
//                 ),
//                 GanttRelativeEvent(
//                   relativeToStart: const Duration(days: 3),
//                   duration: const Duration(days: 8),
//                   displayName: '4',
//                 ),
//                 GanttRelativeEvent(
//                   relativeToStart: const Duration(days: 4),
//                   duration: const Duration(days: 9),
//                   displayName: '5',
//                 ),
//                 GanttRelativeEvent(
//                   relativeToStart: const Duration(days: 5),
//                   duration: const Duration(days: 10),
//                   displayName: '6',
//                 ),
//                 GanttRelativeEvent(
//                   relativeToStart: const Duration(days: 6),
//                   duration: const Duration(days: 11),
//                   displayName: '7',
//                 ),
//                 GanttRelativeEvent(
//                   relativeToStart: const Duration(days: 7),
//                   duration: const Duration(days: 12),
//                   displayName: '8',
//                 ),
//                 GanttAbsoluteEvent(
//                   displayName: 'Absoulte Date event',
//                   startDate: DateTime(2022, 6, 7),
//                   endDate: DateTime(2022, 6, 20),
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//       // floatingActionButton: FloatingActionButton(
//       //   onPressed: onZoomIn,
//       //   tooltip: 'Increment',
//       //   child: const Icon(Icons.add),
//       // ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

void main() {
  return runApp(CalendarApp());
}

/// The app which hosts the home page which contains the calendar on it.
class CalendarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Calendar Demo', home: MyHomePage());
  }
}

/// The hove page which hosts the calendar
class MyHomePage extends StatefulWidget {
  /// Creates the home page to display teh calendar widget.
  const MyHomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SfCalendar(
      view: CalendarView.month,
      dataSource: MeetingDataSource(_getDataSource()),
      // by default the month appointment display mode set as Indicator, we can
      // change the display mode as appointment using the appointment display
      // mode property
      monthViewSettings: const MonthViewSettings(
          appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
    ));
  }

  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime = DateTime(today.year, today.month, today.day, 9);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(Meeting(
        'Conference', startTime, endTime, const Color(0xFF0F8644), false));
    return meetings;
  }
}

/// An object to set the appointment collection data source to calendar, which
/// used to map the custom appointment data to the calendar appointment, and
/// allows to add, remove or reset the appointment collection.
class MeetingDataSource extends CalendarDataSource {
  /// Creates a meeting data source, which used to set the appointment
  /// collection to the calendar
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return _getMeetingData(index).from;
  }

  @override
  DateTime getEndTime(int index) {
    return _getMeetingData(index).to;
  }

  @override
  String getSubject(int index) {
    return _getMeetingData(index).eventName;
  }

  @override
  Color getColor(int index) {
    return _getMeetingData(index).background;
  }

  @override
  bool isAllDay(int index) {
    return _getMeetingData(index).isAllDay;
  }

  Meeting _getMeetingData(int index) {
    final dynamic meeting = appointments![index];
    late final Meeting meetingData;
    if (meeting is Meeting) {
      meetingData = meeting;
    }

    return meetingData;
  }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the event data which will be rendered in calendar.
class Meeting {
  /// Creates a meeting class with required details.
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  /// Event name which is equivalent to subject property of [Appointment].
  String eventName;

  /// From which is equivalent to start time property of [Appointment].
  DateTime from;

  /// To which is equivalent to end time property of [Appointment].
  DateTime to;

  /// Background which is equivalent to color property of [Appointment].
  Color background;

  /// IsAllDay which is equivalent to isAllDay property of [Appointment].
  bool isAllDay;
}
