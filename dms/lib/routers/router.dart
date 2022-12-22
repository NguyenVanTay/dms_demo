// ignore_for_file: prefer_const_constructors

import 'package:dms/screens/all_tasks.dart';
import 'package:dms/screens/homecalendar.dart';
import 'package:dms/screens/homepage.dart';
import 'package:dms/screens/login.dart';
import 'package:dms/screens/project.dart';
import 'package:dms/screens/register.dart';
import 'package:get/get.dart';

class RoutesClass {
  static String home = "/homepage";
  static String allTask = "/all_tasks";
  static String login = "/login";
  static String projects = "/project";
  static String register = "/register";
  static String calendar = "/homecalendar";

  static String getHomeRoute() => home;

  static List<GetPage> routes = [
    GetPage(name: home, page: () => HomePage()),
    GetPage(
      name: allTask,
      page: () => AllTasks(),
    ),
    GetPage(
      name: calendar,
      page: () => HomeCalendar(),
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
  ];
}
