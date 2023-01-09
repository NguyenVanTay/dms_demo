// ignore_for_file: prefer_const_constructors

import 'package:dms/Views/screens/all_tasks.dart';
import 'package:dms/Views/screens/homepage.dart';
import 'package:dms/Views/screens/login.dart';
import 'package:dms/Views/screens/project.dart';
import 'package:dms/Views/screens/register.dart';
import 'package:dms/Views/screens/task_manager.dart';
import 'package:get/get.dart';

class RoutesClass {
  static String home = "/homepage";
  static String allTask = "/all_tasks";
  static String login = "/login";
  static String projects = "/project";
  static String register = "/register";
  static String calendar = "/homecalendar";
  static String taskmanager = "/task_manager";

  static String getHomeRoute() => home;
  static String getTaskManagerRoute() => taskmanager;

  static List<GetPage> routes = [
    GetPage(name: home, page: () => HomePage()),
    GetPage(
      name: allTask,
      page: () => AllTasks(),
    ),
    GetPage(
      name: register,
      page: () => Register(),
    ),
    GetPage(
      name: login,
      page: () => Login(),
    ),
    GetPage(
      name: projects,
      page: () => Project(),
    ),
    GetPage(
      name: taskmanager,
      page: () => TaskManager(),
    )
  ];
}
