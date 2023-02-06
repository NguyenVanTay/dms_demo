// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, avoid_print, unnecessary_this, prefer_typing_uninitialized_variables, must_be_immutable

import 'package:dms/Views/screens/Task/create_task.dart';
import 'package:dms/Views/screens/Task/detail_task.dart';
import 'package:face_pile/face_pile.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

double? height;
double? width;

enum SampleItem { itemOne, itemTwo, itemThree, itemFour }

SampleItem? selectedMenu;

class TasksWidget extends StatefulWidget {
  const TasksWidget({super.key});

  @override
  State<TasksWidget> createState() => _TasksWidgetState();
}

class _TasksWidgetState extends State<TasksWidget> {
  var gender;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(DetailTask());
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
          //  mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "Develop a master",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    DropdownButton(
                      icon: Icon(
                        Icons.more_vert,
                        color: Colors.black,
                      ),
                      // hint: Text("Select"),
                      value: this.gender,
                      items: [
                        DropdownMenuItem(
                          value: '_detail',
                          child: Text('View Detail'),
                        ),
                        DropdownMenuItem(
                          value: '_edit',
                          child: Text('Edit'),
                        ),
                        DropdownMenuItem(
                          value: '_delete',
                          child: Text('Delete'),
                        ),
                        DropdownMenuItem(
                          value: '_gantt',
                          child: Text('Gantt'),
                        ),
                      ],
                      onChanged: (val) {
                        setState(() {
                          this.gender = val;
                        });
                        switch (val) {
                          case '_detail':
                            break;
                          case '_edit':
                            break;
                          case '_delete':
                            break;
                          case '_gantt':
                            break;
                        }
                      },
                    )
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
                        "01-01-2022 02-02-2022",
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