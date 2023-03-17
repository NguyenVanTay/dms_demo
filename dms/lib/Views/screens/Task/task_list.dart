// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import '../../../routers/router.dart';
import '../../widgets/Task/taskwidget.dart';
import 'package:get/get.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

//screen  All task
class TaskList extends StatefulWidget {
  const TaskList({super.key});
  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  SampleItem? selectedMenu;
  int items = 10;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: Text(
            //         "All",
            //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            //       ),
            //     ),
            //     Container(
            //       margin: EdgeInsets.only(top: 10, right: 10),
            //       decoration: BoxDecoration(
            //         borderRadius: BorderRadius.circular(45),
            //         color: Colors.grey.withOpacity(0.2),
            //       ),
            //       child: IconButton(
            //           onPressed: () {}, icon: Icon(Icons.filter_list_outlined)),
            //     ),
            //   ],
            // ),
            Container(
              height: 700,
              margin: EdgeInsets.only(top: 0),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: items,
                itemBuilder: (context, index) => Stack(
                  children: [
                    Column(
                      children: [
                        // use widget TaskWidget with items count = 10
                        TaskWidget(
                          taskName: "On Process",
                          status: "status",
                          dealine: "2022-02-02",
                          taskcode: '00000000',
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
