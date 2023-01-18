// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unnecessary_new, unused_local_variable, unused_import, avoid_print

import 'package:dms/Views/screens/Project/create_project.dart';
import 'package:dms/Views/screens/Task/all_tasks.dart';
import 'package:dms/Views/screens/Task/create_task.dart';
import 'package:dms/Views/widgets/Project/projectwidget.dart';
import 'package:dms/models/projectmodel.dart';
import 'package:dms/network/network_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../routers/router.dart';
import '../../widgets/Task/task_widget.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

SampleItem? selectedMenu;

class Tasks extends StatefulWidget {
  const Tasks({super.key});

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  List<ProjectModel> projects = <ProjectModel>[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Networking.getInstance().getAllProject().then((projectData) {
      setState(() {
        projects = projectData;
      });
    });
  }

  ProjectModel formatDate(ProjectModel project) {
    project.beginPlan = new DateFormat("yyyy-MM-dd")
        .parse(project.beginPlan.toString())
        .toString()
        .substring(0, 10);
    project.finalPlan = new DateFormat("yyyy-MM-dd")
        .parse(project.finalPlan.toString())
        .toString()
        .substring(0, 10);
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
            Get.to(CreateTask());
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
          actions: [
            PopupMenuButton<SampleItem>(
              initialValue: selectedMenu,
              icon: Icon(
                Icons.more_vert,
                color: Colors.black,
              ),
              onSelected: (SampleItem item) {
                setState(() {
                  selectedMenu = item;
                });
              },
              itemBuilder: (BuildContext context) =>
                  <PopupMenuEntry<SampleItem>>[
                const PopupMenuItem<SampleItem>(
                  value: SampleItem.itemOne,
                  child: Text('Item 1'),
                ),
                const PopupMenuItem<SampleItem>(
                  value: SampleItem.itemTwo,
                  child: Text('Item 2'),
                ),
                const PopupMenuItem<SampleItem>(
                  value: SampleItem.itemThree,
                  child: Text('Item 3'),
                ),
              ],
            )
          ],
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(children: [
              Container(
                  margin: EdgeInsets.all(10),
                  child: const Text(
                    'Project "MoonSoon Festival Summer 2022 "',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                  )),
              Container(
                height: height * 0.75,
                margin: EdgeInsets.only(top: 10),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) => Stack(
                    children: [
                      Column(
                        children: [
                          TasksWidget(),
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
