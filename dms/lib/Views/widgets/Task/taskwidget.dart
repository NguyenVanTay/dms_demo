// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:dms/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:dms/Views/screens/Task/handletask.dart';

import '../../../network/network_request.dart';

class TaskWidget extends StatelessWidget {
  String taskName;
  String taskcode;
  String status;
  String dealine;

  TaskWidget(
      {required this.taskName,
      required this.taskcode,
      required this.status,
      required this.dealine,
      super.key});

  @override
  Widget build(BuildContext context) {
    List<TaskModel> task = [];
    double maxWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () async {
        await Networking.getInstance()
            .getProjectTaskByTaskCode(taskcode.toString())
            .then((taskData) {
          task = taskData;
        });

        Get.to(HandlelTask(task: task[0]));
      },
      child: Container(
        //width: maxWidth * 0.98,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color.fromRGBO(212, 254, 218, 1),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                blurRadius: 4.0,
                offset: Offset(4.0, 4.0)),
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
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4.0,
                      offset: Offset(2.0, 0.0)),
                ],
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
                      Container(
                        width: maxWidth * 0.91 - 20,
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Text(
                          taskName,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        "Status: " + status,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "Deadline: " + dealine.substring(0, 10),
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
      ),
    );
  }
}
