import 'package:dms/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/GanttchartWidget/gantt_chart_task_item.dart';
import '../../widgets/GanttchartWidget/gantt_chart_task_item_widget.dart';
import '../../widgets/GanttchartWidget/utils.dart';

class GanttChart extends StatefulWidget {
  final List<TaskModel> taskItems;

  const GanttChart({required this.taskItems, Key? key}) : super(key: key);

  @override
  State<GanttChart> createState() => _GanttChartState();
}

class _GanttChartState extends State<GanttChart> {
  static const double MONTH_ROW_HEIGHT = 30;
  static const double DAY_ROW_HEIGHT = 30;
  static const double DAY_WIDTH = 60;

  List<TaskModel> taskItems = [];
  List<Widget> taskWidgets = [];
  late DateTime startDateProject;
  late DateTime endDateProject;

  Map<String, List<DateTime>> monthMap = {};

  @override
  void initState() {
    // TODO: implement initState
    taskItems = widget.taskItems;

    var data = getStartEndOfProject(taskItems);
    monthMap = getMonthMap(
        data["start"] ?? DateTime.now(), data["end"] ?? DateTime.now());
    taskWidgets = List.generate(taskItems.length, (index) {
      double startLeft = (
                  //DateTime.parse('${taskList[0].projectTaskFinal}'),
                  DateTime.parse('${taskItems[index].projectTaskBegin}') ??
                      DateTime.now())
              .difference(data["start"] ?? DateTime.now())
              .inDays *
          DAY_WIDTH;
      return Positioned(
        top: (index + 2) * DAY_ROW_HEIGHT + 4,
        left: startLeft,
        child: GanttChartTaskItemWidget(
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
    //double tableHeight = (taskItems.length + 5) * DAY_ROW_HEIGHT;
    double tableHeight = MediaQuery.of(context).size.height - 100;
    int monthDiff = 2;
    int dayDiff = 9;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Tasks",
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
      body: SizedBox(
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
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                          monthMap[key]![index].day.toString(),
                                          style: dayText,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: tableHeight - DAY_ROW_HEIGHT * 2,
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
    ));
  }
}
