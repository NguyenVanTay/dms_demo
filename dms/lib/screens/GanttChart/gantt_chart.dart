// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'dart:ui';

import 'package:flutter/material.dart';

import '../../models/ganttchart_weekday.dart';
import '../../providers/event_gantt_chart.dart';
import 'gantt_chart_view.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

SampleItem? selectedMenu;

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}

class GanttChart extends StatefulWidget {
  const GanttChart({super.key});

  @override
  State<GanttChart> createState() => _GanttChartState();
}

class _GanttChartState extends State<GanttChart> {
  double dayWidth = 50;
  bool showDaysRow = true;
  bool showStickyArea = true;
  void onZoomIn() {
    setState(() {
      dayWidth += 5;
    });
  }

  void onZoomOut() {
    if (dayWidth <= 10) return;
    setState(() {
      dayWidth -= 5;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Gantt Chart',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          leading: CloseButton(
            color: Colors.black,
          ),
          actions: [
            PopupMenuButton<SampleItem>(
              initialValue: selectedMenu,
              icon: Icon(
                Icons.more_vert,
                color: Colors.black,
              ),
              onSelected: (SampleItem item) {
                setState(() {
                  selectedMenu = item;
                });
              },
              itemBuilder: (BuildContext context) =>
                  <PopupMenuEntry<SampleItem>>[
                const PopupMenuItem<SampleItem>(
                  value: SampleItem.itemOne,
                  child: Text('Item 1'),
                ),
                const PopupMenuItem<SampleItem>(
                  value: SampleItem.itemTwo,
                  child: Text('Item 2'),
                ),
                const PopupMenuItem<SampleItem>(
                  value: SampleItem.itemThree,
                  child: Text('Item 3'),
                ),
              ],
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Project \"MoonSoon Festival Summer 2022 \"",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SwitchListTile.adaptive(
                value: showDaysRow,
                title: Text('Show Days Row ?'),
                onChanged: (newVal) {
                  setState(() {
                    showDaysRow = newVal;
                  });
                },
              ),
              SwitchListTile.adaptive(
                value: showStickyArea,
                title: Text('Show Sticky Area ?'),
                onChanged: (newVal) {
                  setState(() {
                    showStickyArea = newVal;
                  });
                },
              ),
              GanttChartView(
                maxDuration: const Duration(days: 30 * 2),
                startDate: DateTime(2022, 6, 7),
                dayWidth: dayWidth,
                eventHeight: 50,
                stickyAreaWidth: 150,
                showStickyArea: showStickyArea,
                showDays: showDaysRow,
                weekEnds: const {WeekDay.sunday, WeekDay.saturday},
                isExtraHoliday: (context, day) {
                  //define custom holiday logic for each day
                  return DateUtils.isSameDay(DateTime(2022, 7, 1), day);
                },
                startOfTheWeek: WeekDay.monday,
                events: [
                  GanttRelativeEvent(
                    relativeToStart: const Duration(days: 0),
                    duration: const Duration(days: 0),
                    durationcomplete: const Duration(days: 0),
                    displayName: 'Fake Event',
                  ),
                  GanttRelativeEvent(
                    relativeToStart: const Duration(days: 0),
                    duration: const Duration(days: 5),
                    durationcomplete: const Duration(days: 0),
                    displayName: '1) This is a very long event name',
                  ),
                  GanttRelativeEvent(
                    relativeToStart: const Duration(days: 1),
                    duration: const Duration(days: 6),
                    durationcomplete: const Duration(days: 4),
                    displayName: '2',
                  ),
                  GanttRelativeEvent(
                    relativeToStart: const Duration(days: 2),
                    duration: const Duration(days: 7),
                    durationcomplete: const Duration(days: 4),
                    displayName: '3',
                  ),
                  GanttRelativeEvent(
                    relativeToStart: const Duration(days: 3),
                    duration: const Duration(days: 8),
                    durationcomplete: const Duration(days: 4),
                    displayName: '4',
                  ),
                  GanttRelativeEvent(
                    relativeToStart: const Duration(days: 4),
                    duration: const Duration(days: 9),
                    durationcomplete: const Duration(days: 4),
                    displayName: '5',
                  ),
                  GanttRelativeEvent(
                    relativeToStart: const Duration(days: 5),
                    duration: const Duration(days: 10),
                    durationcomplete: const Duration(days: 4),
                    displayName: '6',
                  ),
                  GanttRelativeEvent(
                    relativeToStart: const Duration(days: 6),
                    duration: const Duration(days: 11),
                    durationcomplete: const Duration(days: 4),
                    displayName: '7',
                  ),
                  GanttRelativeEvent(
                    relativeToStart: const Duration(days: 7),
                    duration: const Duration(days: 12),
                    durationcomplete: const Duration(days: 4),
                    displayName: '8',
                  ),
                  GanttAbsoluteEvent(
                    displayName: 'Absoulte Date event',
                    startDate: DateTime(2022, 6, 7),
                    endDate: DateTime(2022, 6, 20),
                  )
                ],
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FloatingActionButton(
                onPressed: onZoomOut,
                child: Icon(Icons.zoom_out_outlined),
              ),
              FloatingActionButton(
                onPressed: onZoomIn,
                child: Icon(Icons.zoom_in_outlined),
              )
            ],
          ),
        ));
  }
}
