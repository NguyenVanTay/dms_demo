// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, avoid_print, unnecessary_this, prefer_typing_uninitialized_variables, must_be_immutable

import 'package:dms/Views/screens/GanttChart/gantt_chart.dart';
import 'package:dms/Views/screens/Task/detail_task_done.dart';
import 'package:dms/Views/screens/Task/detail_task_not_accept.dart';
import 'package:dms/Views/screens/Task/detail_task_onprogress.dart';
import 'package:dms/Views/screens/Task/detail_task_pending.dart';

import 'package:dms/models/task_model.dart';
import 'package:face_pile/face_pile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

double? height;
double? width;

enum MoreTaskItem { view, edit, delete, gantt }

MoreTaskItem? selectedMenu;

class TasksWidget extends StatefulWidget {
  TaskModel task;

  TasksWidget({required this.task, super.key});

  @override
  State<TasksWidget> createState() => _TasksWidgetState();
}

class _TasksWidgetState extends State<TasksWidget> {
  List<TaskModel> tasks = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
          //  mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                          "${widget.task.description}",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    PopupMenuButton<MoreTaskItem>(
                      initialValue: selectedMenu,
                      icon: Icon(
                        Icons.more_vert,
                        color: Colors.black,
                      ),
                      onSelected: (MoreTaskItem item) {
                        setState(() {
                          selectedMenu = item;
                        });
                      },
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<MoreTaskItem>>[
                        PopupMenuItem<MoreTaskItem>(
                          value: MoreTaskItem.view,
                          child: GestureDetector(
                            child: Text('View Detail'),
                            onTap: () {
                              if (widget.task.taskStatus == 'Not Started') {
                                Get.to(() => DetailTaskNotAccept(
                                      task: widget.task,
                                    ));
                              } else if (widget.task.taskStatus ==
                                  'In Progress') {
                                Get.to(() => DetailTaskOnProgess(
                                      task: widget.task,
                                    ));
                              } else if (widget.task.taskStatus == 'Finished') {
                                Get.to(() => DetailTaskDone(
                                      task: widget.task,
                                    ));
                              } else if (widget.task.taskStatus == 'Overdue') {
                                Get.to(() => DetailTaskPendding(
                                      task: widget.task,
                                    ));
                              }
                            },
                          ),
                        ),
                        PopupMenuItem<MoreTaskItem>(
                          value: MoreTaskItem.edit,
                          child: Text('Edit'),
                        ),
                        PopupMenuItem<MoreTaskItem>(
                          value: MoreTaskItem.delete,
                          child: Text('Delete'),
                        ),
                        PopupMenuItem<MoreTaskItem>(
                          value: MoreTaskItem.gantt,
                          child: GestureDetector(
                            child: Text('Gantt Chart'),
                            onTap: () {
                              Get.to(GanttChart());
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
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
                        '${widget.task.projectTaskBegin} -  ${widget.task.projectTaskFinal}',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      child: Row(children: [
                        FacePile(
                          radius: 20,
                          space: 20,
                          images: [
                            NetworkImage("https://i.pravatar.cc/300?img=1"),
                            NetworkImage("https://i.pravatar.cc/300?img=2"),
                            NetworkImage("https://i.pravatar.cc/300?img=3"),
                            NetworkImage("https://i.pravatar.cc/300?img=4"),
                            NetworkImage("https://i.pravatar.cc/300?img=5"),
                          ],
                        ),
                      ]),
                    ),
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
