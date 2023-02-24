// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, unnecessary_new, unused_import

import 'package:carbon_icons/carbon_icons.dart';
import 'package:dms/Views/screens/Task/all_tasks.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';
import 'package:intl/intl.dart';
import '../../routers/router.dart';
import '../widgets/boxwidget.dart';
import '../widgets/Task/taskwidget.dart';

class HomePagePerformer extends StatefulWidget {
  String name;
  String role;
  String taskOfOnprocess;
  String taskOfOverdue;
  String taskOfNotaccepted;
  String taskOfPendingapproval;

  HomePagePerformer(
      {required this.name,
      required this.role,
      required this.taskOfOnprocess,
      required this.taskOfOverdue,
      required this.taskOfNotaccepted,
      required this.taskOfPendingapproval});

  @override
  State<HomePagePerformer> createState() => _HomePagePerformerState();
}

class _HomePagePerformerState extends State<HomePagePerformer> {
  static TextStyle defaultAvatarText = const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      fontFamily: 'Roboto, sans-serif',
      color: Colors.white,
      height: 1.45);
  Widget DefaultAvatar(String name, {int size = 20}) {
    var names = name.split(" ");
    // while (names.length < 2) {
    //   names.add(" ");
    // }
    String defaultString = "";
    // String defaultString =
    //     names[0].toUpperCase()[0] + names[names.length - 1].toUpperCase()[0];

    if (name.length < 1) {
      defaultString = "";
    } else if (names.length < 2) {
      defaultString = names[0].toUpperCase()[0];
    } else {
      defaultString =
          names[0].toUpperCase()[0] + names[names.length - 1].toUpperCase()[0];
    }
    return Container(
      height: 60,
      width: 60,
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
    Size size = MediaQuery.of(context).size;
    int items = 10;
    //int currentSelectionItem = 0;

    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: ListView(children: [
              Container(
                  padding: EdgeInsets.only(top: 5),
                  child: Column(children: [
                    // container top
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        height: size.height / 12,
                        child: Column(children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(children: [
                            Column(children: [
                              DefaultAvatar(
                                widget.name,
                              ),
                            ]),
                            SizedBox(width: 8),
                            Row(children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.name,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    Container(
                                        padding: EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.black54,
                                        ),
                                        //color: Colors.black54,
                                        child: Text(
                                          widget.role,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ))
                                  ])
                            ]),
                            Spacer(),
                            Container(
                                child: Stack(children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.notifications_outlined,
                                  color: Colors.black,
                                  size: 36,
                                ),
                              ),
                              Positioned(
                                  top: 16,
                                  left: 24,
                                  child: Icon(
                                    Icons.fiber_manual_record,
                                    color: Colors.red,
                                    size: 12,
                                  ))
                            ]))
                          ])
                        ])),
                    SizedBox(
                      height: 5,
                    ),

                    // container name project.
                    Container(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                          Row(children: [
                            Text(
                              "Project:",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            )
                          ]),
                          Row(children: [
                            Text(
                              overflow: TextOverflow.ellipsis,
                              "MoonSoon Festival Spring 2022 ",
                              style: TextStyle(
                                fontSize: 16,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            Icon(Icons.expand_more),
                          ])
                        ])),
                    SizedBox(
                      height: 5,
                    ),
                    //Status list
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16),
                      child: GridView.count(
                        //padding: EdgeInsets.only(left: 12),
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        childAspectRatio: 1.4,
                        children: [
                          GestureDetector(
                            child: Box(
                              title: "On Process",
                              icon: Icon(Icons.edit_note_outlined),
                              color: Color.fromRGBO(146, 252, 161, 1),
                              task: widget.taskOfOnprocess,
                            ),
                          ),
                          GestureDetector(
                            child: Box(
                              title: "Overdue",
                              icon: Icon(CarbonIcons.warning_other),
                              color: Color.fromRGBO(255, 124, 124, 0.8),
                              task: widget.taskOfOverdue,
                            ),
                          ),
                          GestureDetector(
                            child: Box(
                              title: "Not accepted",
                              icon: Icon(Icons.event_busy_outlined),
                              color: Color.fromRGBO(255, 250, 152, 1),
                              task: widget.taskOfNotaccepted,
                            ),
                          ),
                          GestureDetector(
                            child: Box(
                              title: "Pending approval",
                              icon: Icon(Icons.pending_actions_outlined),
                              color: Color.fromRGBO(185, 247, 255, 1),
                              task: widget.taskOfPendingapproval,
                            ),
                          ),
                        ],
                      ),
                    ),

                    //list task
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "Tasks Management",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: IconButton(
                              icon: Icon(Icons.arrow_forward),
                              onPressed: () {
                                Get.to(AllTasks());
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                        height: size.height * 0.45,
                        //margin: EdgeInsets.only(top: 0),
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: items,
                            itemBuilder: (context, index) => Stack(children: [
                                  Column(children: [
                                    TaskWidget(
                                        taskName: "Develop a master plan",
                                        status: 'On Process',
                                        dealine: DateTime.now()),
                                  ])
                                ])))
                  ]))
            ])));
  }
}
