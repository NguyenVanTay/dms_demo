// ignore_for_file: unused_local_variable, sized_box_for_whitespace, avoid_unnecessary_containers, constant_identifier_names, prefer_const_constructors

import 'package:dms/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../models/projectmodel.dart';
import '../../widgets/GanttchartWidget/gantt_chart_task_item_widget.dart';
import '../../widgets/GanttchartWidget/utils.dart';

class GanttChart extends StatefulWidget {
  final List<TaskModel> taskItems;
  final ProjectModel project;

  const GanttChart({required this.taskItems, required this.project, Key? key})
      : super(key: key);

  @override
  State<GanttChart> createState() => _GanttChartState();
}

class _GanttChartState extends State<GanttChart> {
  static const double MONTH_ROW_HEIGHT = 30.00;
  static const double DAY_ROW_HEIGHT = 30.00;
  static const double DAY_WIDTH = 60.00;

  List<TaskModel> taskItems = [];
  List<ProjectModel> projectItems = [];
  List<Widget> taskWidgets = [];
  late DateTime startDateProject;
  late DateTime endDateProject;

  Map<String, List<DateTime>> monthMap = {};

  @override
  void initState() {
    taskItems = widget.taskItems;

    var data = getStartEndOfProject(taskItems);
    var startDate =
        (data["start"] ?? DateTime.now()).subtract(const Duration(days: 2));

    var endDate = (data["end"] ?? DateTime.now()).add(const Duration(days: 2));
    monthMap = getMonthMap(startDate, endDate);

    taskWidgets = List.generate(taskItems.length, (index) {
      double startLeft =
          (DateTime.parse('${taskItems[index].projectTaskBegin}'))
                  .difference(startDate)
                  .inDays *
              DAY_WIDTH;

      // xu ly mau cua  theo trang thai cua task.
      Color taskcolor = Colors.grey;
      if (taskItems[index].taskStatus!.contains("Finished")) {
        taskcolor = const Color.fromRGBO(146, 252, 161, 1);
      } else if (taskItems[index].taskStatus!.contains("Progress")) {
        taskcolor = const Color.fromRGBO(185, 247, 255, 1);
        if (DateTime.parse(taskItems[index].projectTaskFinal!)
                .difference(DateTime.now())
                .inDays <=
            1) {
          taskcolor = Colors.yellow.shade400;
        }
      } else if (taskItems[index].taskStatus!.contains("Overdue")) {
        taskcolor = const Color.fromRGBO(255, 124, 124, 1);
      }

      return Positioned(
        top: (index + 2) * DAY_ROW_HEIGHT + 4,
        left: startLeft,
        child: GanttChartTaskItemWidget(
          color: taskcolor,
          taskItem: taskItems[index],
          rowHeight: DAY_ROW_HEIGHT - 4,
          dateWidth: DAY_WIDTH,
        ),
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double tableWidth = 200;
    double tableHeight = (taskItems.length + 10) * DAY_ROW_HEIGHT;

    int monthDiff = 2;
    int dayDiff = 9;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Gantt chart",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          color: Colors.black,
          icon: const Icon(Icons.arrow_back_outlined),
          splashColor: Colors.grey,
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                margin: const EdgeInsets.only(top: 20, bottom: 10),
                child: Text(
                  widget.project.description ?? "",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                )),
            SizedBox(
              height: tableHeight,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Stack(
                  children: [
                    Row(
                      children: [
                        ...monthMap.keys.map(
                          (key) => Row(
                            children: [
                              Container(
                                width: (monthMap[key] ?? []).length * DAY_WIDTH,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(left: 2),
                                        alignment: Alignment.centerLeft,
                                        height: MONTH_ROW_HEIGHT,
                                        child: Text(
                                          key.toUpperCase(),
                                          style: monthText,
                                        ),
                                      ),
                                      Container(
                                        height: DAY_ROW_HEIGHT,
                                        child: Row(
                                          children: List.generate(
                                            (monthMap[key] ?? []).length,
                                            (index) => Container(
                                              width: DAY_WIDTH,
                                              alignment: Alignment.center,
                                              child: Text(
                                                monthMap[key]![index]
                                                    .day
                                                    .toString(),
                                                style: dayText,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height:
                                            tableHeight - DAY_ROW_HEIGHT * 2,
                                        child: Row(
                                          children: List.generate(
                                            (monthMap[key] ?? []).length,
                                            (index) => Row(
                                              children: [
                                                Container(
                                                  width: DAY_WIDTH,
                                                ),
                                                const VerticalDivider(
                                                  color: Colors.grey,
                                                  width: 0,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ]),
                              ),
                              const VerticalDivider(
                                color: Colors.grey,
                                indent: 0,
                                width: 0,
                                endIndent: 0,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    ...taskWidgets
                  ],
                ),
              ),
            ),
            const Divider(
              height: 20,
              thickness: 0.1,
              indent: 0,
              endIndent: 0,
              color: Colors.black,
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(children: [
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 30,
                            width: 150,
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(146, 252, 161, 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: const Text(
                                  "Finished",
                                  style: TextStyle(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 30,
                            width: 150,
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(185, 247, 255, 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: const Text(
                                  "In Progress",
                                  style: TextStyle(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 30,
                            width: 150,
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(255, 124, 124, 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: const Text(
                                  "Overdue",
                                  style: TextStyle(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 30,
                            width: 150,
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(255, 241, 114, 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: const Text(
                                  "Expire Soon",
                                  style: TextStyle(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 30,
                            width: 150,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade400,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Align(
                                alignment: Alignment.center,
                                child: const Text(
                                  "Not Approved",
                                  style: TextStyle(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ])
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
