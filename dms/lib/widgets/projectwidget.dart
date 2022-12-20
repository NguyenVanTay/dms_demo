// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:iconify_flutter/icons/icons8.dart';

double? height;
double? width;
Widget projectwidget = Container(
  margin: EdgeInsets.all(10),
  height: height,
  width: width,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Color.fromRGBO(217, 217, 217, 1),
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
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "Moonsoon Festival Summer 2022",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 50),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.ac_unit_outlined),
                ),
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
                  "Status: received",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 175, bottom: 5),
                child: CircleAvatar(
                  backgroundColor: Color.fromRGBO(0, 0, 0, 0.3),
                ),
              )
            ],
          ),
        ],
      ),
    ],
  ),
);
