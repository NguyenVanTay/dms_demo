// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, avoid_print, unnecessary_this, prefer_typing_uninitialized_variables, must_be_immutable, non_constant_identifier_names

import 'package:dms/Views/screens/Task/detail_task.dart';
import 'package:dms/Views/screens/Task/verify_task.dart';
import 'package:dms/models/task_model.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/projectmodel.dart';

enum MoreTaskItem { view, edit, delete, gantt }

MoreTaskItem? selectedMenu;

class TasksWidget extends StatefulWidget {
  TaskModel task;
  ProjectModel project;

  TasksWidget({required this.task, required this.project, super.key});

  @override
  State<TasksWidget> createState() => _TasksWidgetState();
}

class _TasksWidgetState extends State<TasksWidget> {
  static TextStyle defaultAvatarText = const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      fontFamily: 'Roboto, sans-serif',
      color: Colors.white,
      height: 1.45);
  Widget DefaultAvatar(String name, {int size = 20}) {
    var names = name.split(" ");

    String defaultString = "";

    if (name.isEmpty) {
      defaultString = "";
    } else if (names.length < 2) {
      defaultString = names[0].toUpperCase()[0];
    } else {
      defaultString =
          names[0].toUpperCase()[0] + names[names.length - 1].toUpperCase()[0];
    }
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black),
      child: Center(
        child: Text(
          defaultString,
          style: defaultAvatarText,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => DetailTask(
              task: widget.task,
              project: widget.project,
            ));
      },
      child: Container(
        margin: EdgeInsets.all(10),
        // height: height,
        // width: width,
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
                          value: MoreTaskItem.edit,
                          child: Text('Edit'),
                        ),
                        PopupMenuItem<MoreTaskItem>(
                          value: MoreTaskItem.delete,
                          child: Text('Delete'),
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
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Icon(Icons.calendar_month),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            'Start Date: ${widget.task.projectTaskBegin!.split("-").reversed.join('-')}',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: Icon(Icons.calendar_month),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            'End Date: ${widget.task.projectTaskFinal!.split("-").reversed.join('-')}',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                          "Performer: ",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )),
                    Container(
                      margin: EdgeInsets.all(20),
                      height: 50,
                      width: 250,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(8),
                        itemCount: widget.task.performers!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: [
                              DefaultAvatar(widget
                                  .task.performers![index].description
                                  .toString())
                            ],
                          );
                        },
                      ),
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
