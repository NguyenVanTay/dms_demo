// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'Views/screens/GanttChart/gantt_chart.dart';
import 'Views/screens/login.dart';
import 'controllers/providers/event_provider.dart';

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
        home: const Login(),
      ),
    );
  }
}

// class MyCustomScrollBehavior extends MaterialScrollBehavior {
//   // Override behavior methods and getters like dragDevices
//   @override
//   Set<PointerDeviceKind> get dragDevices => {
//         PointerDeviceKind.touch,
//         PointerDeviceKind.mouse,
//         // etc.
//       };
// }

