// ignore_for_file: must_be_immutable

import 'package:dms/models/task_model.dart';
import 'package:flutter/material.dart';

class GanttChartTaskItemWidget extends StatelessWidget {
  /*
  width of this widget will be calculated by fomular: width = dateWidth * dateDiff 
  */
  final double dateWidth;
  //height display of task
  final double rowHeight;

  DateTime? startDate;
  DateTime? endDate;
  final TaskModel taskItem;

  GanttChartTaskItemWidget(
      {this.dateWidth = 60.0,
      this.rowHeight = 30.0,
      required this.taskItem,
      super.key});

  late int dateDiff;
  void onInit() {
    startDate =
        DateTime.parse('${taskItem.projectTaskBegin}') ?? DateTime.now();

    endDate = DateTime.parse('${taskItem.projectTaskFinal}') ?? DateTime.now();

    dateDiff = endDate!.difference(startDate!).inDays + 1;
  }

  @override
  Widget build(BuildContext context) {
    onInit();
    double taskWidth = dateWidth * dateDiff;
    return Container(
      width: taskWidth + 100,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Container(
              // color: taskItem.restProgressColor,
              color: Colors.green.shade200,
              width: taskWidth,
              height: rowHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 4.0),
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5.0),
                        bottomLeft: Radius.circular(5.0),
                      ),
                    ),
                    width: taskWidth *
                        double.parse('${taskItem.percent}'
                            .replaceAll("\"\"", "")
                            .replaceAll("%", "")) /
                        100,
                    height: rowHeight,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      taskItem.description.toString(),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              left: taskWidth *
                      double.parse('${taskItem.percent}'
                          .replaceAll("\"\"", "")
                          .replaceAll("%", "")) /
                      100 +
                  4,
              child: Container(
                alignment: Alignment.centerLeft,
                height: rowHeight,
                child: Text(
                  "${taskItem.percent}",
                ),
              ))
        ],
      ),
    );
  }
}
