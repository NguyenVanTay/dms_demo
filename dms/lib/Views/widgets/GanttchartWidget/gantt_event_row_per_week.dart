import 'package:flutter/material.dart';

import '../../../controllers/providers/event_gantt_chart.dart';
import '../../screens/GanttChart/gantt_chart_view.dart';
import 'gantt_event_cell_per_day.dart';

class GantEventRowPerWeek extends StatelessWidget {
  const GantEventRowPerWeek({
    Key? key,
    required this.weekDate,
    required this.isHolidayFunc,
    required this.dayWidth,
    required this.event,
    required this.eventStartDate,
    required this.eventEndDate,
    required this.func,
    required this.holidayColor,
    required this.eventColor,
  }) : super(key: key);

  final Color? holidayColor;
  final Color eventColor;
  final DateTime weekDate;
  final bool Function(BuildContext context, DateTime date) isHolidayFunc;
  final double dayWidth;
  final GanttEventBase event;
  final DateTime eventStartDate;
  final DateTime eventEndDate;
  final EventCellBuilderFunction? func;
  @override
  Widget build(BuildContext context) {
    // int? daysToSkip;
    // if ((DateUtils.isSameDay(
    //           eventStartDate,
    //           weekDate,
    //         ) ||
    //         eventStartDate.isAfter(
    //           weekDate,
    //         )) &&
    //     (eventStartDate.isBefore(
    //           DateUtils.addDaysToDate(
    //             weekDate,
    //             6,
    //           ),
    //         ) ||
    //         DateUtils.isSameDay(
    //           eventStartDate,
    //           weekDate,
    //         ))) {
    //   //
    //   daysToSkip = eventStartDate.difference(weekDate).inDays;
    // }
    final row = Row(
      children: List.generate(7, (index) {
        //
        final dayDate = DateUtils.addDaysToDate(weekDate, index);
        final isHoliday = isHolidayFunc(context, dayDate);

        return SizedBox(
          width: dayWidth,
          child: func?.call(
                context,
                eventStartDate,
                eventEndDate,
                isHoliday,
                event,
                dayDate,
                eventColor,
              ) ??
              GanttEventCellPerDay(
                actEndDate: eventEndDate,
                actStartDate: eventStartDate,
                dayDate: dayDate,
                event: event,
                isHoliday: isHoliday,
                weekDate: weekDate,
                eventColor: eventColor,
                holidayColor: holidayColor,
              ),
        );
      }),
    );
    return row;
    // if (daysToSkip == null) {
    //   return row;
    // } else {
    //   return Stack(
    //     children: [
    //       row,
    //       PositionedDirectional(
    //         top: 0,
    //         bottom: 0,
    //         start: (dayWidth * daysToSkip) + 8,
    //         child: Center(child: Text(event.getDisplayName(context))),
    //       ),
    //     ],
    //   );
    // }
  }
}
