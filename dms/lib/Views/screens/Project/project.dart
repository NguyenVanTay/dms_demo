// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unnecessary_new, unused_local_variable, unused_import, avoid_print, unused_element

import 'package:dms/Views/screens/GanttChart/gantt_chart.dart';
import 'package:dms/Views/screens/Project/create_project.dart';
import 'package:dms/Views/screens/Task/all_tasks.dart';
import 'package:dms/Views/widgets/Project/projectwidget.dart';
import 'package:dms/models/projectmodel.dart';
import 'package:dms/models/task_model.dart';
import 'package:dms/models/util_storage.dart';
import 'package:dms/network/network_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

import '../../../routers/router.dart';
import '../../widgets/GanttchartWidget/gantt_chart_task_item.dart';

enum FilterItem { iteminitiated, itemplanning, itemPerforming, itemfinish }

FilterItem? selectedMenu;

class Project extends StatefulWidget {
  const Project({super.key});

  @override
  State<Project> createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  List<ProjectModel> projects = <ProjectModel>[];

  //List Project trống để lưu các project đã lọc theo state
  List<ProjectModel> filterListProject = <ProjectModel>[];

  // List Project  khởi tạo để lọc
  List<ProjectModel> filterProjectListUtil = UtilStorage.projects;

  List<TaskModel> tasks = <TaskModel>[];

  @override
  void initState() {
    super.initState();

    Networking.getInstance().getAllProject().then((projectData) {
      setState(() {
        if (mounted) projects = projectData;
      });
    });
  }

  //Planning

  List<ProjectModel> filterProjectByStatePlanning() {
    filterListProject.clear();
    for (var projectItem in filterProjectListUtil) {
      if (projectItem.state == 'Planning') {
        filterListProject.add(projectItem);
      }
    }
    return filterListProject;
  }

//Performing
  List<ProjectModel> filterProjectByStatePerforming() {
    filterListProject.clear();

    for (var projectItem in filterProjectListUtil) {
      if (projectItem.state == 'Performing') {
        filterListProject.add(projectItem);
      }
    }

    return filterListProject;
  }

  // Finished
  List<ProjectModel> filterProjectByStateFinished() {
    filterListProject.clear();

    for (var projectItem in filterProjectListUtil) {
      if (projectItem.state == 'Finished') {
        filterListProject.add(projectItem);
      }
    }

    return filterListProject;
  }

  ProjectModel formatDate(ProjectModel project) {
    project.projectBegin = project.projectBegin.toString().substring(0, 10);
    project.projectFinal = project.projectFinal.toString().substring(0, 10);
    return project;
  }

  TaskModel formatDatetask(TaskModel task) {
    task.projectTaskBegin = task.projectTaskBegin.toString().substring(0, 10);
    task.projectTaskFinal = task.projectTaskFinal.toString().substring(0, 10);

    return task;
  }

  int items = 10;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Projects",
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
              Navigator.pop(context);
            },
          ),
          actions: [],
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(children: [
              GestureDetector(
                onTap: () {
                  Get.to(CreateProject());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                        left: 10,
                      ),
                      height: 35,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromRGBO(146, 252, 161, 1),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.add,
                            size: 24,
                            color: Color.fromRGBO(0, 169, 0, 1),
                          ),
                          Text(
                            "Create",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(0, 169, 0, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
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
                            value: FilterItem.iteminitiated,
                            child: Text('All Project'),
                            onTap: () {
                              setState(() {
                                projects = filterProjectListUtil;
                              });
                            },
                          ),
                          PopupMenuItem<FilterItem>(
                            value: FilterItem.itemplanning,
                            child: Text('Not started'),
                            onTap: () {
                              if (mounted) {
                                setState(() {
                                  projects = filterProjectByStatePlanning();
                                });
                              }
                            },
                          ),
                          PopupMenuItem<FilterItem>(
                            value: FilterItem.itemPerforming,
                            child: Text('In progress'),
                            onTap: () {
                              if (mounted) {
                                setState(() {
                                  projects = filterProjectByStatePerforming();
                                });
                              }
                            },
                          ),
                          PopupMenuItem<FilterItem>(
                            value: FilterItem.itemfinish,
                            child: Text('Finished'),
                            onTap: () {
                              if (mounted) {
                                setState(() {
                                  projects = filterProjectByStateFinished();
                                });
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: height * 0.75,
                margin: EdgeInsets.only(top: 10),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: projects.length,
                  itemBuilder: (context, index) => Stack(
                    children: [
                      Column(
                        children: [
                          ProjectWidget(
                            project: formatDate(projects[index]),
                          )
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
