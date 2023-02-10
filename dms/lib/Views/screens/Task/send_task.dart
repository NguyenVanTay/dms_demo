// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, unnecessary_new, sized_box_for_whitespace, unused_import, unused_local_variable

import 'dart:ffi';

import 'package:face_pile/face_pile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

SampleItem? selectedMenu;

class SendTask extends StatefulWidget {
  const SendTask({super.key});

  @override
  State<SendTask> createState() => _SendTaskState();
}

class _SendTaskState extends State<SendTask> {
  @override
  Widget build(BuildContext context) {
    double maxheight = MediaQuery.of(context).size.height;
    double maxwidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Send Task",
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
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20, left: 10),
                  child: Text(
                    "Develop a detailed plan for the program",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(left: 10, top: 30),
              child: Row(
                children: [
                  Icon(Icons.calendar_month_outlined),
                  Text("11.08.2022 - 30.10.2022"),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
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
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: FacePile(
                      radius: 24,
                      space: 35,
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
              margin: EdgeInsets.only(top: 30),
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
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(" Not started yet",
                        style: TextStyle(fontSize: 18)),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
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
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                      "Project Moonsoon",
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
              margin: EdgeInsets.only(top: 30),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.how_to_reg_outlined,
                      size: 32,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      "Checker: ",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      "Admin ",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.how_to_reg_outlined,
                      size: 32,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      "Previous task:  ",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      "Develop a master plan",
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
              child: Divider(
                height: 1,
                thickness: 0.2,
                indent: 1,
                endIndent: 0,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 50,
              width: 380,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    elevation: 20,
                    // : BorderRadius.circular(10),
                    backgroundColor: Color.fromRGBO(146, 252, 161, 1)),
                child: Text(
                  'Create Project',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
