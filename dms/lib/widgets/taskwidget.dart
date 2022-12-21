// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

Widget task = Container(
  margin: EdgeInsets.all(10),
  height: 90,
  width: 391,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Color.fromRGBO(255, 124, 124, 0.3),
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
          color: Color.fromRGBO(255, 124, 124, 1),
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
                Text(
                  "Build a plan",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  "On processing",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  "Dealine : 15:00 October 01,2022",
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
