// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:face_pile/face_pile.dart';

class DetailTask extends StatefulWidget {
  const DetailTask({super.key});

  @override
  State<DetailTask> createState() => _DetailTaskState();
}

class _DetailTaskState extends State<DetailTask> {
  @override
  Widget build(BuildContext context) {
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
              onPressed: () {},
            ),
            actions: [
              CircleAvatar(
                backgroundColor: Colors.grey[50],
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_vert),
                  color: Colors.black,
                ),
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
                              "Develop a detailed plan for the program",
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
                      Text("11.08.2022 - 30.10.2022"),
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
                          Icons.group_outlined,
                          size: 32,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                          "Performers: ",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: FacePile(
                          radius: 32,
                          space: 40,
                          images: [
                            NetworkImage("https://i.pravatar.cc/300?img=1"),
                            NetworkImage("https://i.pravatar.cc/300?img=2"),
                            NetworkImage("https://i.pravatar.cc/300?img=3"),
                            NetworkImage("https://i.pravatar.cc/300?img=4"),
                            NetworkImage("https://i.pravatar.cc/300?img=5")
                          ],
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
                          Icons.ads_click,
                          size: 32,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                          "Status: ",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child:
                            Text("On Process", style: TextStyle(fontSize: 20)),
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
                          Icons.description_outlined,
                          size: 32,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                          "Description: ",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  //decoration: BoxDecoration(border: BorderRadius()),
                  child: TextField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Colors.blue))),
                    keyboardType: TextInputType.multiline,
                    maxLines: 6,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
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
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                          "Admin: ",
                          style: TextStyle(
                            fontSize: 20,
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
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
