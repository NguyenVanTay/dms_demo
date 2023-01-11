// ignore_for_file: prefer_const_constructors, unused_element, sized_box_for_whitespace, sort_child_properties_last, use_build_context_synchronously, avoid_unnecessary_containers, unused_local_variable
import 'package:dms/models/event_data_source.dart';
import 'package:dms/controllers/providers/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../models/event_calendar.dart';
import '../../widgets/Calendarwidgets/task_calendar_widget.dart';
import 'event_editing_screen.dart';
import 'event_viewing_screen.dart';

enum ItemViewCalendar { dayView, weekView, monthView, timelinemonth }

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  // option view calendar.
  CalendarView calendarView = CalendarView.month;
  CalendarController calendarController = CalendarController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EventProvider>(context);
    final events = provider.events;
    final selectedEvents = provider.eventOfSelectedDate;
    ItemViewCalendar? selectedMenu;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => EventEditingScreen()));
        },
      ),
      appBar: AppBar(
        title: const Text("Calendar"),
        centerTitle: true,
        actions: [
          Container(
            child: PopupMenuButton<ItemViewCalendar>(
              initialValue: selectedMenu,
              onSelected: (ItemViewCalendar item) {
                setState(() {
                  selectedMenu = item;
                });
              },
              itemBuilder: (BuildContext context) =>
                  <PopupMenuEntry<ItemViewCalendar>>[
                PopupMenuItem<ItemViewCalendar>(
                  value: ItemViewCalendar.dayView,
                  child: Text('Day View'),
                  onTap: () {
                    setState(() {
                      calendarView = CalendarView.day;
                      calendarController.view = calendarView;
                    });
                  },
                ),
                PopupMenuItem<ItemViewCalendar>(
                    value: ItemViewCalendar.weekView,
                    child: Text('Week View'),
                    onTap: () {
                      setState(() {
                        calendarView = CalendarView.week;
                        calendarController.view = calendarView;
                      });
                    }

                    //
                    ),
                PopupMenuItem<ItemViewCalendar>(
                    value: ItemViewCalendar.monthView,
                    child: Text('Month View'),
                    onTap: () {
                      setState(() {
                        calendarView = CalendarView.month;
                        calendarController.view = calendarView;
                      });
                    }),
                PopupMenuItem<ItemViewCalendar>(
                    value: ItemViewCalendar.timelinemonth,
                    child: Text('TimeLine'),
                    onTap: () {
                      setState(() {
                        calendarView = CalendarView.timelineMonth;
                        calendarController.view = calendarView;
                      });
                    }),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SfCalendar(
              view: calendarView,
              showNavigationArrow: true,
              showDatePickerButton: true,
              initialSelectedDate: DateTime.now(),
              //initialDisplayDate: DateTime.now(),
              controller: calendarController,
              cellBorderColor: Colors.teal,
              dataSource: EventDataSource(events),
              selectionDecoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.teal, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  shape: BoxShape.rectangle),

              //Mode view  indicator or appointment
              monthViewSettings: MonthViewSettings(
                appointmentDisplayMode: MonthAppointmentDisplayMode.indicator,
                showAgenda: true,
              ),

              todayHighlightColor: Colors.teal,
              // blackout day
              blackoutDates: [
                DateTime.now().add(
                  Duration(hours: 48),
                ),
              ],

              onTap: (details) {
                Provider.of<EventProvider>(context, listen: false);
                provider.setDate(details.date!);
                showModalBottomSheet(
                  context: context,
                  builder: (context) => TaskCalendarWidget(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
