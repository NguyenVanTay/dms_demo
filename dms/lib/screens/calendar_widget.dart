// ignore_for_file: prefer_const_constructors, unused_element, sized_box_for_whitespace, sort_child_properties_last, use_build_context_synchronously

import 'package:calendar_view/calendar_view.dart';
import 'package:dms/screens/Calendar/meeting%20_provider.dart';
import 'package:dms/screens/Calendar/meeting.dart';
import 'package:dms/screens/Calendar/meeting_data_source.dart';
import 'package:dms/sources/CalendarSource/extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../models/event.dart';
import '../sources/CalendarSource/create_event_page.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  // option view calendar.
  CalendarView calendarView = CalendarView.day;
  CalendarController calendarController = CalendarController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MeetingProvider>(context);
    SampleItem? selectedMenu;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          elevation: 8,
          onPressed: () async {
            final event = await context
                .pushRoute<CalendarEventData<Event>>(CreateEventPage(
              withDuration: true,
            ));
            if (event == null) return;
            CalendarControllerProvider.of<Event>(context).controller.add(event);
          },
        ),
        appBar: AppBar(
          title: const Text("Calendar"),
          actions: [
            Container(
              child: PopupMenuButton<SampleItem>(
                initialValue: selectedMenu,
                // Callback that sets the selected popup menu item.
                onSelected: (SampleItem item) {
                  setState(() {
                    selectedMenu = item;
                  });
                },
                itemBuilder: (BuildContext context) =>
                    <PopupMenuEntry<SampleItem>>[
                  const PopupMenuItem<SampleItem>(
                    value: SampleItem.itemOne,
                    child: Text('Day View'),
                  ),
                  const PopupMenuItem<SampleItem>(
                    value: SampleItem.itemTwo,
                    child: Text('Week View'),

                    //
                  ),
                  const PopupMenuItem<SampleItem>(
                    value: SampleItem.itemThree,
                    child: Text('Gantt chart'),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            // height: 50,
            // child: Expanded(
            //   child: ListView(
            //     scrollDirection: Axis.horizontal,
            //     children: [
            //       OutlinedButton(
            //           onPressed: () {
            //             setState(() {
            //               calendarView = CalendarView.day;
            //               calendarController.view = calendarView;
            //             });
            //           },
            //           child: Text("Day View")),
            //       OutlinedButton(
            //           onPressed: () {
            //             setState(() {
            //               calendarView = CalendarView.week;
            //               calendarController.view = calendarView;
            //             });
            //           },
            //           child: Text("Week View")),
            //       OutlinedButton(
            //           onPressed: () {
            //             setState(() {
            //               calendarView = CalendarView.month;
            //               calendarController.view = calendarView;
            //             });
            //           },
            //           child: Text("Monnth View")),
            //       OutlinedButton(
            //           onPressed: () {
            //             setState(() {
            //               calendarView = CalendarView.timelineDay;
            //               calendarController.view = calendarView;
            //             });
            //           },
            //           child: Text("Timeline Day View")),
            //       OutlinedButton(
            //           onPressed: () {
            //             setState(() {
            //               calendarView = CalendarView.timelineWeek;
            //               calendarController.view = calendarView;
            //             });
            //           },
            //           child: Text("Timeline Week  View")),
            //       OutlinedButton(
            //           onPressed: () {
            //             setState(() {
            //               calendarView = CalendarView.timelineMonth;
            //               calendarController.view = calendarView;
            //             });
            //           },
            //           child: Text("Timeline Month View")),
            //       OutlinedButton(
            //           onPressed: () {
            //             setState(() {
            //               calendarView = CalendarView.schedule;
            //               calendarController.view = calendarView;
            //             });
            //           },
            //           child: Text("Schedule View")),
            //       OutlinedButton(
            //           onPressed: () {
            //             setState(() {
            //               calendarView = CalendarView.timelineWorkWeek;
            //               calendarController.view = calendarView;
            //             });
            //           },
            //           child: Text("TimeLineWorkWeek View")),
            //     ],
            //   ),
            // ),
            //),
            Expanded(
              child: SfCalendar(
                view: calendarView,

                showNavigationArrow: true,
                showDatePickerButton: true,
                initialSelectedDate: DateTime.now(),
                initialDisplayDate: DateTime.now(),
                controller: calendarController,
                cellBorderColor: Colors.red,
                dataSource: MeetingDataSource(provider.meetings),
                selectionDecoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.teal, width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    shape: BoxShape.rectangle),
                //mode view  indicator or appointment
                monthViewSettings: MonthViewSettings(
                    appointmentDisplayMode:
                        MonthAppointmentDisplayMode.appointment,
                    showAgenda: true),
                // blackout day
                blackoutDates: [
                  DateTime.now().add(
                    Duration(hours: 48),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
