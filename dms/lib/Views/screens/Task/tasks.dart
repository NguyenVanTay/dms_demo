// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unnecessary_new, unused_local_variable, unused_import, avoid_print, must_be_immutable

import 'package:dms/Views/screens/Project/create_project.dart';
import 'package:dms/Views/screens/Task/all_tasks.dart';
import 'package:dms/Views/screens/Task/create_task.dart';
import 'package:dms/Views/widgets/Project/projectwidget.dart';
import 'package:dms/models/projectmodel.dart';
import 'package:dms/models/task_model.dart';
import 'package:dms/network/network_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../models/util_storage.dart';
import '../../../routers/router.dart';
import '../../widgets/Task/task_widget.dart';

enum FilterItem {
  itemAllTask,
  itemTaskNotStart,
  itemTaskInProgress,
  itemTaskFinish,
  itemTaskOverdue
}

FilterItem? selectedMenu;

class Tasks extends StatefulWidget {
  ProjectModel project;

  Tasks({required this.project, super.key});

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  //List Task trống để lưu các Task đã lọc theo state
  List<TaskModel> filterListTask = <TaskModel>[];

  // List Task  khởi tạo để lọc
  List<TaskModel> filterTaskListUtil = UtilStorage.tasks;

  late List<ProjectModel> projects = [];
  late List<TaskModel> tasks = [];

  @override
  void initState() {
    super.initState();
    Networking.getInstance()
        .getProjectTaskByProjectCode(widget.project.code.toString())
        .then((taskData) {
      setState(() {
        tasks = taskData;
      });
    });
  }

  List<TaskModel> filterTaskByStateNotStart() {
    filterListTask.clear();
    for (var taskItem in filterTaskListUtil) {
      if (taskItem.taskStatus == 'Not Started') {
        filterListTask.add(taskItem);
      }
    }
    return filterListTask;
  }

//In progress
  List<TaskModel> filterTaskByStateInProgress() {
    filterListTask.clear();

    for (var taskItem in filterTaskListUtil) {
      if (taskItem.taskStatus == 'In Progress') {
        filterListTask.add(taskItem);
      }
    }

    return filterListTask;
  }

  // Finished
  List<TaskModel> filterTaskByStateFinished() {
    filterListTask.clear();

    for (var taskItem in filterTaskListUtil) {
      if (taskItem.taskStatus == 'Finished') {
        filterListTask.add(taskItem);
      }
    }

    return filterListTask;
  }

  //Overdue
  List<TaskModel> filterTaskByStateOverdue() {
    filterListTask.clear();

    for (var taskItem in filterTaskListUtil) {
      if (taskItem.taskStatus == 'Overdue') {
        filterListTask.add(taskItem);
      }
    }

    return filterListTask;
  }

  formatDateTask(TaskModel task) {
    task.projectTaskBegin = task.projectTaskBegin.toString().substring(0, 10);
    task.projectTaskFinal = task.projectTaskFinal.toString().substring(0, 10);
    return task;
  }

  formatDateProject(ProjectModel project) {
    project.projectBegin = project.projectBegin.toString().substring(0, 10);
    project.projectFinal = project.projectFinal.toString().substring(0, 10);
    return project;
  }

  int items = 10;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(
              CreateTask(
                project: widget.project,
              ),
            );
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Tasks",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          leading: IconButton(
            color: Colors.black,
            icon: Icon(Icons.arrow_back_outlined),
            splashColor: Colors.grey,
            onPressed: () {
              Get.back();
            },
          ),
          actions: [],
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      margin: EdgeInsets.all(10),
                      child: Text(
                        "${widget.project.description}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                      )),
                  Container(
                    child: PopupMenuButton<FilterItem>(
                      initialValue: selectedMenu,
                      icon: Icon(
                        Icons.filter_alt_outlined,
                        color: Colors.black,
                      ),
                      onSelected: (FilterItem item) {
                        setState(() {
                          selectedMenu = item;
                        });
                      },
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<FilterItem>>[
                        PopupMenuItem<FilterItem>(
                          value: FilterItem.itemAllTask,
                          child: Text('All Task'),
                          onTap: () {
                            setState(() {
                              tasks = filterTaskListUtil;
                            });
                          },
                        ),
                        PopupMenuItem<FilterItem>(
                          value: FilterItem.itemTaskNotStart,
                          child: Text('Not started'),
                          onTap: () {
                            if (mounted) {
                              setState(() {
                                tasks = filterTaskByStateNotStart();
                              });
                            }
                          },
                        ),
                        PopupMenuItem<FilterItem>(
                          value: FilterItem.itemTaskInProgress,
                          child: Text('In progress'),
                          onTap: () {
                            if (mounted) {
                              setState(() {
                                tasks = filterTaskByStateInProgress();
                              });
                            }
                          },
                        ),
                        PopupMenuItem<FilterItem>(
                          value: FilterItem.itemTaskFinish,
                          child: Text('Finish'),
                          onTap: () {
                            if (mounted) {
                              setState(() {
                                tasks = filterTaskByStateFinished();
                              });
                            }
                          },
                        ),
                        PopupMenuItem<FilterItem>(
                          value: FilterItem.itemTaskOverdue,
                          child: Text('Overdue'),
                          onTap: () {
                            if (mounted) {
                              setState(() {
                                tasks = filterTaskByStateOverdue();
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                height: height * 0.75,
                margin: EdgeInsets.only(top: 10),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: tasks.length,
                  itemBuilder: (context, index) => Stack(
                    children: [
                      Column(
                        children: [
                          TasksWidget(
                            task: formatDateTask(tasks[index]),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
