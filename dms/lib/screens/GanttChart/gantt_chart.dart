// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:gantt_chart/gantt_chart.dart';

class GanttChart extends StatefulWidget {
  @override
  State<GanttChart> createState() => _GanttChartState();
}

class _GanttChartState extends State<GanttChart> {
  // width of 1 days.
  double dayWidth = 50;

  // show titile days.(default = true)
  bool showDaysRow = true;
  // name task (default = true.)
  bool showStickyArea = true;
  // function increase
  void onZoomIn() {
    setState(() {
      dayWidth += 5;
    });
  }

  //function decrease.
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
        title: Text('Gantt chart '),
        centerTitle: true,
        leading: CloseButton(),
        actions: [
          IconButton(
            onPressed: onZoomIn,
            icon: const Icon(
              Icons.zoom_in,
            ),
          ),
          IconButton(
            onPressed: onZoomOut,
            icon: const Icon(
              Icons.zoom_out,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
             // stickyAreaEventBuilder: ,
              //optional, set to null for infinite horizontal scroll
              maxDuration: null,

              //required
              startDate: DateTime(2023, 1, 1),

              //column width for each day
              dayWidth: dayWidth,

              //row width for events
              eventHeight: 50,

              //sticky area width
              stickyAreaWidth: 100,

              //show sticky area or not
              showStickyArea: showStickyArea,

              //show days or not
              showDays: showDaysRow,

              //custom weekends
              weekEnds: const {WeekDay.saturday, WeekDay.sunday},

              //define custom holiday logic for each day
              isExtraHoliday: (context, day) {
                return DateUtils.isSameDay(DateTime(2022, 7, 1), day);
              },
              //custom start of the week
              startOfTheWeek: WeekDay.monday,

              events: [
                //event relative to startDate
                GanttRelativeEvent(
                  relativeToStart: const Duration(days: 0),
                  duration: const Duration(days: 0),
                  displayName: 'Fake Event',
                ),
                GanttRelativeEvent(
                  relativeToStart: const Duration(days: 0),
                  duration: const Duration(days: 5),
                  displayName:
                      '1) This is a very long event ',
                ),
                GanttRelativeEvent(
                  relativeToStart: const Duration(days: 1),
                  duration: const Duration(days: 6),
                  displayName: '2',
                ),
                GanttRelativeEvent(
                  relativeToStart: const Duration(days: 2),
                  duration: const Duration(days: 7),
                  displayName: '3',
                ),
                GanttRelativeEvent(
                  relativeToStart: const Duration(days: 3),
                  duration: const Duration(days: 8),
                  displayName: '4',
                ),
                GanttRelativeEvent(
                  relativeToStart: const Duration(days: 4),
                  duration: const Duration(days: 9),
                  displayName: '5',
                ),
                GanttRelativeEvent(
                  relativeToStart: const Duration(days: 5),
                  duration: const Duration(days: 10),
                  displayName: '6',
                ),
                GanttRelativeEvent(
                  relativeToStart: const Duration(days: 6),
                  duration: const Duration(days: 11),
                  displayName: '7',
                ),
                GanttRelativeEvent(
                  relativeToStart: const Duration(days: 7),
                  duration: const Duration(days: 12),
                  displayName: '8',
                ),

                //event with absolute start and end
                GanttAbsoluteEvent(
                  displayName: 'Absoulte Date event',
                  startDate: DateTime(2022, 6, 7),
                  endDate: DateTime(2022, 6, 20),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: FloatingActionButton(
                      onPressed: onZoomIn,
                      tooltip: 'Increment',
                      child: const Icon(Icons.add),
                    ),
                  ),
                  FloatingActionButton(
                    onPressed: onZoomOut,
                    tooltip: 'Decrement',
                    child: const Icon(Icons.remove),
                  ),
                ],
              ),
            )
          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
