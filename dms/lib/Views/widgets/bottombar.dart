// // ignore_for_file: sort_child_properties_last, avoid_print, prefer_final_fields, unused_field, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, use_build_context_synchronously, must_be_immutable, duplicate_ignore

// import 'package:flutter/material.dart';

// import '../../models/projectmodel.dart';
// import '../screens/Account/acountpage.dart';
// import '../screens/Calendar/calendar_widget.dart';
// import '../screens/GanttChart/gantt_chart.dart';
// import '../screens/Project/project.dart';
// import '../screens/homepage.dart';

// abstract class BottomBar extends StatefulWidget {
//   String name;
//   String role;
//   String taskOfOnprocess;
//   String taskOfOverdue;
//   String taskOfNotaccepted;
//   String taskOfPendingapproval;
//   String taskOfTaskfromme;
//   String taskOfVerify;

//   BottomBar(
//       {super.key,
//       required this.name,
//       required this.role,
//       required this.taskOfOnprocess,
//       required this.taskOfOverdue,
//       required this.taskOfNotaccepted,
//       required this.taskOfPendingapproval,
//       required this.taskOfTaskfromme,
//       required this.taskOfVerify});

//   @override
//   State<BottomBar> createState() => _BottomBarState();
// }

// class _BottomBarState extends State<BottomBar> {
//   int _selectIndex = 0;

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     List<Widget> itemWidget = [
//       HomePage(
//         name: widget.name,
//         role: widget.role,
//         taskOfNotaccepted: widget.taskOfNotaccepted,
//         taskOfOnprocess: widget.taskOfOnprocess,
//         taskOfOverdue: widget.taskOfOverdue,
//         taskOfPendingapproval: widget.taskOfPendingapproval,
//         taskOfTaskfromme: widget.taskOfTaskfromme,
//         taskOfVerify: widget.taskOfVerify,
//       ),
//       GanttChart(
//         taskItems: [],
//         project: ProjectModel(),
//       ),
//       CalendarWidget(),
//       Project(),
//       AccountPage(),
//     ];
//     return SafeArea(
//         child: Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: itemWidget.elementAt(_selectIndex),
//       bottomNavigationBar: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home_outlined),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.task_outlined),
//             label: 'Gantt Chart',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.calendar_month_outlined),
//             label: 'Calendar',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.article_outlined),
//             label: 'Project',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.account_circle_outlined),
//             label: 'Account',
//           ),
//         ],
//         currentIndex: _selectIndex,
//         selectedItemColor: Color.fromRGBO(4, 131, 248, 1),
//         onTap: ((index) => _onItemTapped(index)),
//         //backgroundColor: Colors.teal,
//       ),
//     ));
//     ;
//   }
// }
