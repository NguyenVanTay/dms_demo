// ignore_for_file: prefer_const_declarations, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GanttWeekHeader extends StatelessWidget {
  const GanttWeekHeader({
    Key? key,
    required this.weekDate,
  }) : super(key: key);
  final DateTime weekDate;

  @override
  Widget build(BuildContext context) {
    final bgColor = Colors.teal;
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 8, top: 1, bottom: 1),
      decoration: BoxDecoration(
        color: bgColor,
        border: const BorderDirectional(
          start: BorderSide(),
          bottom: BorderSide(),
        ),
      ),
      child: Center(
        child: LayoutBuilder(builder: (context, constraints) {
          String txt = '${DateFormat.yMMMMd().format(weekDate)}';
          // if (constraints.maxWidth < 50) {
          //   txt = '${DateFormat.yMMMMd().format(weekDate)}';
          // } else if (constraints.maxWidth < 7 * 20) {
          //   txt = '${DateFormat.yMMMMd().format(weekDate)}';
          // } else {
          //   txt = '${DateFormat.yMMMMd().format(weekDate)}';
          // }

          return Text(
            txt,
            style: const TextStyle(color: Colors.white),
          );
        }),
      ),
    );
  }
}
