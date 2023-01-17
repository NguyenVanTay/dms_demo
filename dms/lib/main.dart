/// ignore_for_file: unused_element

import 'package:dms/Views/screens/Task/create_task.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'Views/screens/GanttChart/gantt_chart.dart';
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
        home: const CreateTask(),
      ),
    );
  }
}
