// ignore_for_file: must_be_immutable, sized_box_for_whitespace

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
  final Color? color;

  GanttChartTaskItemWidget(
      {this.dateWidth = 60.0,
      this.rowHeight = 30.0,
      required this.taskItem,
      this.color,
      super.key});

  late int dateDiff;
  void onInit() {
    startDate = DateTime.parse('${taskItem.projectTaskBegin}');

    endDate = DateTime.parse('${taskItem.projectTaskFinal}');

    // khoang cach giua startDate -- endDate
    dateDiff = endDate!.difference(startDate!).inDays + 2;
    print(endDate);
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
              color: color!.withOpacity(0.3),
              width: taskWidth,
              height: rowHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 4.0),
                    decoration: BoxDecoration(
                      color: color,
                      // ignore: prefer_const_constructors
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
              child: Row(
                children: [
                  if ('${taskItem.percent}' == "0%")
                    Text(
                      taskItem.description.toString(),
                      overflow: TextOverflow.ellipsis,
                    ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: rowHeight,
                    child: Text(
                      "${taskItem.percent}",
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
