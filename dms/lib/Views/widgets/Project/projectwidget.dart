// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, avoid_print, unnecessary_this, prefer_typing_uninitialized_variables

import 'package:dms/Views/screens/GanttChart/gantt_chart.dart';
import 'package:dms/Views/screens/Project/detail_project.dart';
import 'package:dms/Views/screens/Project/project.dart';
import 'package:dms/Views/screens/Task/all_tasks.dart';
import 'package:dms/Views/widgets/Task/taskwidget.dart';
import 'package:dms/models/projectmodel.dart';
import 'package:dms/models/util_storage.dart';
import 'package:dms/network/network_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import 'package:step_progress_indicator/step_progress_indicator.dart';

import '../../screens/Task/tasks.dart';

double? height;
double? width;

enum MoreProjectItem { view, edit, delete, gantt }

MoreProjectItem? selectedMenu;

class ProjectWidget extends StatefulWidget {
  final ProjectModel project;

  const ProjectWidget({required this.project, super.key});

  @override
  State<ProjectWidget> createState() => _ProjectWidgetState();
}

class _ProjectWidgetState extends State<ProjectWidget> {
  //List<ProjectModel> projects = <UtilStorage.projects> [];
  late List<ProjectModel> projects = UtilStorage.projects;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(Tasks(
          project: widget.project,
        ));
      },
      child: Container(
        margin: EdgeInsets.all(10),
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 0.05,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "${widget.project.description}",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    PopupMenuButton<MoreProjectItem>(
                      initialValue: selectedMenu,
                      icon: Icon(
                        Icons.more_vert,
                        color: Colors.black,
                      ),
                      onSelected: (MoreProjectItem item) {
                        setState(() {
                          selectedMenu = item;
                        });
                      },
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<MoreProjectItem>>[
                        PopupMenuItem<MoreProjectItem>(
                          value: MoreProjectItem.view,
                          child: GestureDetector(
                            child: Text('View Detail'),
                            onTap: () {
                              Get.to(DetailProject());
                            },
                          ),
                        ),
                        PopupMenuItem<MoreProjectItem>(
                          value: MoreProjectItem.edit,
                          child: Text('Edit'),
                        ),
                        PopupMenuItem<MoreProjectItem>(
                          value: MoreProjectItem.delete,
                          child: Text('Delete'),
                        ),
                        PopupMenuItem<MoreProjectItem>(
                          value: MoreProjectItem.gantt,
                          child: GestureDetector(
                            child: Text('Gantt Chart'),
                            onTap: () {
                              Get.to(GanttChart());
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 5, right: 5, bottom: 10),
                  child: StepProgressIndicator(
                    totalSteps: 100,
                    currentStep: 50,
                    size: 8,
                    padding: 0,
                    selectedColor: Color.fromRGBO(73, 198, 70, 1),
                    unselectedColor: Color.fromRGBO(217, 217, 217, 1),
                    roundedEdges: Radius.circular(10),
                    selectedGradientColor: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromRGBO(73, 198, 70, 1),
                        Color.fromRGBO(73, 198, 70, 1)
                      ],
                    ),
                    unselectedGradientColor: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromRGBO(217, 217, 217, 1),
                        Color.fromRGBO(217, 217, 217, 1)
                      ],
                    ),
                  ),
                ),
                const Divider(
                  thickness: 0.1,
                  indent: 0,
                  endIndent: 0,
                  color: Colors.black,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Icon(Icons.calendar_month),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        "${widget.project.beginPlan} -  ${widget.project.finalPlan}",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 120, bottom: 5),
                      child: CircleAvatar(
                        backgroundImage: AssetImage("images/dog.jpg"),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
