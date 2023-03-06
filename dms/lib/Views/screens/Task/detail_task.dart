// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, avoid_unnecessary_containers, sized_box_for_whitespace, unnecessary_import, unused_local_variable, must_be_immutable, unnecessary_string_interpolations, non_constant_identifier_names

import 'package:dms/Views/screens/Project/project.dart';
import 'package:dms/Views/screens/Task/tasks.dart';
import 'package:dms/models/projectmodel.dart';
import 'package:dms/models/task_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:percent_indicator/percent_indicator.dart';

import '../../../network/network_request.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

SampleItem? selectedMenu;

class DetailTask extends StatefulWidget {
  TaskModel task;
  ProjectModel project;

  DetailTask({required this.task, required this.project, super.key});

  @override
  State<DetailTask> createState() => _DetailTaskState();
}

class _DetailTaskState extends State<DetailTask> {
  // late bool _isShow = true;
  visibleButton(String status) {
    if (status == "Not Started" || status == "Project Task not Approved") {
      return true;
    } else {
      return false;
    }
  }

  Color _statusColor = Colors.grey;

  Color statusColor() {
    //if(DateTime.parse(widget.task.projectTaskFinal!))

    // if (widget.task.taskStatus!.contains("Finished")) {
    //   _statusColor = const Color.fromRGBO(146, 252, 161, 1);
    // } else if (widget.task.taskStatus!.contains("Progress")) {
    //   _statusColor = const Color.fromRGBO(185, 247, 255, 1);
    if (DateTime.parse(widget.task.projectTaskFinal!)
            .difference(DateTime.now())
            .inDays >
        1) {
      _statusColor = Colors.green;
    } else if (DateTime.parse(widget.task.projectTaskFinal!)
            .difference(DateTime.now())
            .inDays <=
        1) {
      _statusColor = Colors.red;
    }

    return _statusColor;
  }

  visibleProgress(String status) {
    if (status == "In Progress") {
      return true;
    } else {
      return false;
    }
  }

  visibleDiscusstion(String status) {
    if (status == "Finished") {
      return true;
    } else {
      return false;
    }
  }

  static TextStyle defaultAvatarText = const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      fontFamily: 'Roboto, sans-serif',
      color: Colors.white,
      height: 1.45);
  Widget DefaultAvatar(String name, {String teacherName = "", int size = 18}) {
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

  // @override
  // void initState() {
  //   super.initState();
  //   Networking.getInstance()
  //       .getProjectTaskByTaskCode(widget.task.code.toString())
  //       .then((taskData) {
  //     setState(() {
  //       tasks = taskData;
  //     });
  //   });
  // }

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
          actions: [],
          backgroundColor: Colors.white,
          //backgroundColor: Color.fromRGBO(255, 250, 160, 1),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Visibility(
                visible: visibleProgress(widget.task.taskStatus.toString()),
                child: Container(
                  margin: EdgeInsets.only(top: 10, left: 10, right: 300),
                  height: 35,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: _statusColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        widget.task.taskStatus == "Overdue"
                            ? "Overdue"
                            : "Undue",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: _statusColor.withAlpha(1),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: CircularPercentIndicator(
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
                      ),
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
                            "Start Date : ${widget.task.projectTaskBegin!.split("-").reversed.join("-")}",
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
                            "End Date   : ${widget.task.projectTaskFinal!.split("-").reversed.join("-")}",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
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
                  height: 100,
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
                margin: EdgeInsets.only(top: 10),
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
              Visibility(
                visible: visibleDiscusstion(widget.task.taskStatus.toString()),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Icon(
                              Icons.adjust_sharp,
                              size: 32,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
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
                      margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                      height: 100,
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
                        itemCount: widget.task.progress!.length,
                        itemBuilder: ((context, index) => Stack(
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          "${widget.task.projectTaskFinal!.split("-").reversed.join("-")} ",
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
                                          "${widget.task.progress![index].progress ?? " "}",
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
                    Divider(
                      thickness: 0.1,
                      color: Colors.black,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10, top: 20),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.attach_file)),
                                Container(child: Text("Name file")),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.comment_outlined)),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.live_help_outlined))
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Visibility(
                visible: visibleProgress(widget.task.taskStatus.toString()),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Icon(
                              Icons.adjust_sharp,
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
                      margin: EdgeInsets.only(left: 10, right: 10),
                      height: 100,
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
                        itemCount: widget.task.progress!.length,
                        itemBuilder: ((context, index) => Stack(
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          "${widget.task.projectTaskFinal!.split("-").reversed.join("-")} ",
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
                                          "${widget.task.progress![index].progress ?? " "}",
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
                  ],
                ),
              ),
              Visibility(
                visible: visibleButton(widget.task.taskStatus.toString()),
                // maintainSize: true,
                // maintainAnimation: true,
                // maintainState: true,
                child: Column(
                  children: [
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
                              "Previous task: ",
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
                                        children: [
                                          Container(
                                            margin: EdgeInsets.all(10),
                                            child: Text(
                                              " ${index + 1}. ${widget.task.predecessors![index].description ?? ""} ",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16.0,
                                              ),
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
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 10, right: 10),
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        // vien xung qunah
                        border: Border.all(width: 0.03, color: Colors.black),
                        borderRadius: BorderRadius.circular(10),

                        color: Color.fromRGBO(146, 252, 161, 1),
                      ),
                      child: TextButton(
                        child: Text(
                          "Send",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        onPressed: () async {
                          var result = await Networking.getInstance()
                              .sendTaskByPM(widget.task.code.toString());

                          if (result) {
                            await showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('Done'),
                                content: Text('Create Success'),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text('Ok'),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            );

                            //handle
                          } else {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('Failed'),
                                content: Text('Create Failed'),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text('Ok'),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            );
                          }
                          Get.to(() => Tasks(project: widget.project));

                          // Get.to(Tasks(
                          //   project: ProjectModel,
                          //   // task: widget.task!,
                          // ));
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
