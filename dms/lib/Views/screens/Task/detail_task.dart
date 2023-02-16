// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, avoid_unnecessary_containers, sized_box_for_whitespace, unnecessary_import, unused_local_variable, must_be_immutable

import 'package:dms/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

SampleItem? selectedMenu;

class DetailTask extends StatefulWidget {
  TaskModel task;

  DetailTask({required this.task, super.key});

  @override
  State<DetailTask> createState() => _DetailTaskState();
}

class _DetailTaskState extends State<DetailTask> {
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
                      percent: 0.75,
                      center: new Text(
                        "75%",
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
                child: Row(
                  children: [
                    Icon(Icons.calendar_month_outlined),
                    Text(
                      "${widget.task.projectTaskBegin.toString()} -  ${widget.task.projectTaskFinal.toString()}",
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
                        Icons.group_outlined,
                        size: 32,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                        "Performers: ",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    // Container(
                    //   margin: EdgeInsets.only(left: 10),

                    //   child: Text(

                    //    "",
                    //    // "${(widget.task.performers.)}",
                    //     style: TextStyle(
                    //         fontSize: 18, fontWeight: FontWeight.bold),
                    //   ),
                    // ),
                    // Container(
                    //   margin: EdgeInsets.only(left: 10),
                    //   height: MediaQuery.of(c
                    //ontext).size.height * 0.08,
                    //   width: MediaQuery.of(context).size.width * 0.6,
                    //   child: Scrollbar(
                    //     child: ListView.builder(
                    //       itemCount: 10,
                    //       itemBuilder: (context, index)  =>,

                    //       scrollDirection: Axis.vertical,

                    //     ),
                    //   ),
                    // )
                    // child: Card(
                    //   elevation: 0,
                    //   shape: RoundedRectangleBorder(
                    //     side: BorderSide(
                    //       color: Theme.of(context).colorScheme.outline,
                    //     ),
                    //     borderRadius:
                    //         const BorderRadius.all(Radius.circular(12)),
                    //   ),
                    //   child: const SizedBox(
                    //     child: Center(child: Text('Outlined Card')),
                    //   ),
                    // ),)
                    // height: height * 0.75,
                    // margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                    // height: 30.0,
                    // width: maxwidth * 0.55,
                    // child: ListView.builder(
                    //   scrollDirection: Axis.horizontal,
                    //   shrinkWrap: true,
                    //   itemCount: 20,
                    //   itemBuilder: (context, index) => Stack(
                    //     children: [
                    //       Column(
                    //         children: [
                    //           Container(
                    //             margin: EdgeInsets.only(left: 15),
                    //             decoration: BoxDecoration(
                    //               color: Colors.blue[100],
                    //               //DecorationImage
                    //               border: Border.all(
                    //                 color: Colors.blue,
                    //                 width: 1,
                    //               ), //Border.all
                    //               borderRadius: BorderRadius.circular(15),
                    //               boxShadow: [
                    //                 BoxShadow(
                    //                   color: Colors.black,
                    //                   offset: const Offset(
                    //                     0.1,
                    //                     0.1,
                    //                   ), //Offset
                    //                   blurRadius: 0.1,
                    //                   spreadRadius: 0.1,
                    //                 ), //BoxShadow
                    //                 BoxShadow(
                    //                   color: Colors.white,
                    //                   offset: const Offset(0.0, 0.0),
                    //                   blurRadius: 0.0,
                    //                   spreadRadius: 0.0,
                    //                 ), //BoxShadow
                    //               ],
                    //             ),

                    //           ),
                    //         ],
                    //       ),
                    //     ],
                    //   ),
                    // ),

                    // Container(child: Scrollbar(child:ListView(scrollDirection:  Axis.horizontal,) ),)
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
                      child: Text("initial", style: TextStyle(fontSize: 18)),
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
                        "Checker: ",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                        "Admin: ",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
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
                        "Process: ",
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
                      // height: maxheight,
                      // width: maxwidth,
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                        "Process",
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
                child: Divider(
                  height: 1,
                  thickness: 0.2,
                  indent: 1,
                  endIndent: 0,
                  color: Colors.black,
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromRGBO(185, 247, 255, 1),
                        ),
                        //  color: Color.fromRGBO(),
                        child: TextButton(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.black),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Performed',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromRGBO(146, 252, 161, 1),
                        ),
                        //  color: Color.fromRGBO(),
                        child: TextButton(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.black),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Accept for completion',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
