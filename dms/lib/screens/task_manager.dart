// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class TaskManager extends StatefulWidget {
  static const tag = "/task_manager";

  @override
  State<TaskManager> createState() => _TaskManagerState();
}

class _TaskManagerState extends State<TaskManager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
