// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, avoid_unnecessary_containers, sized_box_for_whitespace, unnecessary_import, unused_local_variable, must_be_immutable

import 'package:dms/models/task_model.dart';
import 'package:face_pile/face_pile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../network/network_request.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

SampleItem? selectedMenu;

class DetailTaskOnProgess extends StatefulWidget {
  TaskModel task;

  DetailTaskOnProgess({required this.task, super.key});

  @override
  State<DetailTaskOnProgess> createState() => _DetailTaskOnProgessState();
}

class _DetailTaskOnProgessState extends State<DetailTaskOnProgess> {
  late List<TaskModel> tasks = [];
  static TextStyle defaultAvatarText = const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      fontFamily: 'Roboto, sans-serif',
      color: Colors.white,
      height: 1.45);
  Widget DefaultAvatar(String name, {String teacherName = "", int size = 18}) {
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
      height: 30,
      width: 30,
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
  void initState() {
    super.initState();
    Networking.getInstance()
        .getProjectTaskByTaskCode(widget.task.code.toString())
        .then((taskData) {
      setState(() {
        tasks = taskData;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double maxheight = MediaQuery.of(context).size.height;
    double maxwidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Detail Task",
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
          //backgroundColor: Color.fromRGBO(255, 250, 160, 1),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              if (DateTime.parse(widget.task.projectTaskFinal!)
                      .difference(DateTime.now())
                      .inDays >
                  1)
                Container(
                  margin: EdgeInsets.only(top: 20, left: 10, right: 300),
                  height: 35,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromRGBO(146, 252, 161, 0.3),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Undue",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(10, 187, 133, 1),
                        ),
                      ),
                    ],
                  ),
                ),
              if (DateTime.parse(widget.task.projectTaskFinal!)
                      .difference(DateTime.now())
                      .inDays <
                  1)
                Container(
                  margin: EdgeInsets.only(top: 20, left: 10, right: 300),
                  height: 35,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromRGBO(255, 124, 124, 0.3),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Overdue",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(214, 70, 70, 1),
                        ),
                      ),
                    ],
                  ),
                ),
              // if (DateTime.parse(widget.task.projectTaskFinal!)
              //             .difference(DateTime.now())
              //             .inHours >
              //         1 &&
              //     DateTime.parse(widget.task.projectTaskFinal!)
              //             .difference(DateTime.now())
              //             .inHours <
              //         23)
              //   Container(
              //     margin: EdgeInsets.only(top: 20, left: 10, right: 300),
              //     height: 35,
              //     width: 100,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(20),
              //       color: Color.fromRGBO(243, 178, 31, 0.08),
              //     ),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //       children: [
              //         Text(
              //           "Due Soon",
              //           style: TextStyle(
              //             fontSize: 16,
              //             fontWeight: FontWeight.bold,
              //             color: Color.fromRGBO(243, 178, 31, 1),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 240,
                          child: Text(
                            "${widget.task.description}",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                            maxLines: 2,

                            //textScaleFactor: 0.6,
                          ),
                        ),
                      ],
                    ),
                    CircularPercentIndicator(
                      radius: 60.0,
                      lineWidth: 15.0,
                      percent: double.parse('${widget.task.percent}'
                              .replaceAll("\"\"", "")
                              .replaceAll("%", "")) /
                          100,
                      center: new Text(
                        "${widget.task.percent}",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      progressColor: Color.fromRGBO(9, 227, 30, 1),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.calendar_month_outlined),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            "Start Date : ${widget.task.projectTaskBegin.toString()}",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.calendar_month_outlined),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            "End Date   : ${widget.task.projectTaskFinal.toString()}",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.group_outlined,
                      size: 32,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      "Performers: ",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 200,
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
                ]),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Icon(
                        Icons.ads_click,
                        size: 32,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                        "Status: ",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: Text('${widget.task.taskStatus}',
                          style: TextStyle(fontSize: 18)),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Icon(
                        Icons.description_outlined,
                        size: 32,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                        "Description: ",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                //decoration: BoxDecoration(border: BorderRadius()),
                child: Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  height: 100.0,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // adding borders around the widget
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  child: SingleChildScrollView(
                    // for Vertical scrolling
                    scrollDirection: Axis.vertical,
                    child: Container(
                      //height: maxheight,
                      // width: maxwidth,
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                        "${widget.task.longDesc}",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                // margin: EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Icon(
                        Icons.fact_check_outlined,
                        size: 32,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 40),
                      child: Text(
                        "Reviewer: ",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                        "${widget.task.reviewer}",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // margin: EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Icon(
                        Icons.edit_attributes_outlined,
                        size: 32,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 40),
                      child: Text(
                        "Previous Task: ",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                //decoration: BoxDecoration(border: BorderRadius()),
                child: Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  height: 100.0,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // adding borders around the widget
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: widget.task.predecessors!.length,
                    itemBuilder: ((context, index) => Stack(
                          children: [
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                        "${widget.task.predecessors![index].description}")
                                  ],
                                ),
                              ],
                            ),
                          ],
                        )),
                  ),
                ),
              ),
              Container(
                // margin: EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Icon(
                        Icons.edit_attributes_outlined,
                        size: 32,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 40),
                      child: Text(
                        "Progress: ",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                //decoration: BoxDecoration(border: BorderRadius()),
                child: Container(
                  margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                  height: 100.0,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // adding borders around the widget
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                  ),
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: widget.task.performers!.length,
                    itemBuilder: ((context, index) => Stack(
                          children: [
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "${widget.task.projectTaskFinal} ",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    Text(
                                      " ${widget.task.performers![index].description} ",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    Text(
                                      "${widget.task.progress![index].progress}",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
