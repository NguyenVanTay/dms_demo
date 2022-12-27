// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TaskWidget extends StatelessWidget {
  String taskName;
  String status;
  DateTime dealine;

  TaskWidget(
      {required this.taskName,
      required this.status,
      required this.dealine,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromARGB(249, 170, 232, 204),
        boxShadow: [
          BoxShadow(
            blurRadius: 0.05,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            height: 90,
            width: 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromRGBO(146, 252, 161, 1),
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
                        taskName,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      status,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      DateFormat.yMMMMEEEEd().format(dealine),
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
  }
}
