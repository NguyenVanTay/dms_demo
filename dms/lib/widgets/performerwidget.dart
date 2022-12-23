// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, must_be_immutable, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class Performerwidget extends StatelessWidget {
  String name;
  String taskName;
  String namefile;
  Performerwidget(
      {required this.name,
      required this.taskName,
      required this.namefile,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromRGBO(217, 217, 217, 1),
        boxShadow: [
          BoxShadow(
            blurRadius: 0.05,
          ),
        ],
      ),
      child: Column(children: [
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 10),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 30, left: 10),
                    child: CircleAvatar(
                      radius: 28,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 160, top: 20),
                  child: Text(
                    name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 24, top: 10),
                  child: Text(taskName,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                ),
                Container(
                    margin: EdgeInsets.only(right: 170, top: 10),
                    child: OutlinedButton(
                      onPressed: () {
                        //debugPrint('Received click');
                      },
                      child: Text(
                        namefile,
                        style: TextStyle(color: Colors.black),
                      ),
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 10, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StepProgressIndicator(
                totalSteps: 3,
                currentStep: 2,
                selectedColor: Colors.green,
                unselectedColor: Colors.grey,
              )
            ],
          ),
        ),
      ]),
    );
  }
}
