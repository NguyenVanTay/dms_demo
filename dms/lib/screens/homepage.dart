// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, unnecessary_new, unused_import

import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';
import 'package:intl/intl.dart';
import '../routers/router.dart';
import '../widgets/boxwidget.dart';
import '../widgets/taskwidget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int items = 10;
    //int currentSelectionItem = 0;

    return SafeArea(
        child: Scaffold(
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
                      CircleAvatar(
                        backgroundImage: AssetImage("images/dog.jpg"),
                        radius: 28,
                      )
                    ]),
                    SizedBox(width: 8),
                    Row(children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Ly Tran Thanh Thao",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.black54,
                                ),
                                //color: Colors.black54,
                                child: Text(
                                  "1C Developer",
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
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
            //Status list
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 4,
              childAspectRatio: 1.6,
              children: [
                Box(
                    title: "On Process",
                    icon: Icon(Icons.edit_note_outlined),
                    color: Color.fromRGBO(146, 252, 161, 1)),
                Box(
                    title: "Overdue",
                    icon: Icon(CarbonIcons.warning_other),
                    color: Color.fromRGBO(255, 124, 124, 0.8)),
                Box(
                    title: "Not accepted",
                    icon: Icon(Icons.event_busy_outlined),
                    color: Color.fromRGBO(255, 250, 152, 1)),
                Box(
                  title: "Pending approval",
                  icon: Icon(Icons.pending_actions_outlined),
                  color: Color.fromRGBO(185, 247, 255, 1),
                ),
                Box(
                    title: "Task from me",
                    icon: Icon(Icons.input_outlined),
                    color: Color.fromRGBO(255, 225, 190, 1)),
                Box(
                    title: "Verify",
                    icon: Icon(Icons.check_circle_outline),
                    color: Color.fromRGBO(146, 252, 161, 1)),
              ],
            ),

            //list task
            Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "Tasks Management",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ))
                ])),

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
