// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

Widget task = Container(
  margin: EdgeInsets.all(10),
  height: 90,
  width: 391,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Color.fromRGBO(217, 217, 217, 1),
    boxShadow: [
      BoxShadow(
        blurRadius: 0.05,
      ),
    ],
  ),
  child: Row(
    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        height: 90,
        width: 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.red,
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    "Task name",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  "Status: received",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  "Test dealine : 15:00 ngày 01.01.2022",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ],
  ),
);
