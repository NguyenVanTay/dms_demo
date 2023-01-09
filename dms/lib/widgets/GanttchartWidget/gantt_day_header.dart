// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../models/ganttchart_weekday.dart';





class GanttDayHeader extends StatelessWidget {
  const GanttDayHeader({
    Key? key,
    required this.date,
    required this.isHoliday,
  }) : super(key: key);

  final DateTime date;
  final bool Function(BuildContext context, DateTime date) isHoliday;

  @override
  Widget build(BuildContext context) {
    final weekDay = WeekDay.fromIntWeekday(date.weekday);
    final isHolidayV = isHoliday.call(context, date);
    final bgColor =
        isHolidayV ? Color.fromARGB(255, 200, 200, 200) : Colors.white;
    const textColor = Colors.black;
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        border: const BorderDirectional(
          bottom: BorderSide(),
          // end: BorderSide(),
          start: BorderSide(),
        ),
      ),
      child: Center(
        child: Text(
          weekDay.symbol,
          style: TextStyle(color: textColor),
          maxLines: 1,
        ),
      ),
    );
  }
}
