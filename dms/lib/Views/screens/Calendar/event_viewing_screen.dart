// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, avoid_unnecessary_containers, prefer_interpolation_to_compose_strings

import 'package:dms/controllers/providers/event_provider.dart';
import 'package:dms/Views/screens/Calendar/event_editing_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../models/event_calendar.dart';

class EventViewingScreen extends StatelessWidget {
  final Event event;

  const EventViewingScreen({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double maxwidth = MediaQuery.of(context).size.width;
    Widget buildDate(String title, DateTime date) {
      return Container(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text(
                    title + " :",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Row(
                    children: [
                      Icon(Icons.calendar_month_outlined),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(DateFormat.yMMMEd().add_jm().format(date),
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget buildDateTime(Event event) {
      return Column(
        children: [
          buildDate(event.isAllDay ? "All-day" : "From", event.from),
          if (!event.isAllDay) buildDate("To", event.to),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Event "),
        centerTitle: true,
        leading: CloseButton(),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => EventEditingScreen(
                  event: event,
                ),
              ),
            ),
          ),
          IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                final provider =
                    Provider.of<EventProvider>(context, listen: false);
                provider.deleteEvent(event);
                Navigator.of(context).pop();
              })
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(32),
        children: <Widget>[
          Row(
            children: [
              Icon(Icons.time_to_leave_outlined),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  "Title",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          SingleChildScrollView(
            // for Vertical scrolling
            scrollDirection: Axis.vertical,
            child: Container(
              width: maxwidth,
              height: 100,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey)),
              child: Container(
                margin: EdgeInsets.all(5),
                child: Text(
                  event.title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 32),
          Row(
            children: [
              Icon(Icons.description_outlined),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  "Description",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          //SizedBox(height: ),
          SingleChildScrollView(
            // for Vertical scrolling
            scrollDirection: Axis.vertical,
            child: Container(
              width: maxwidth,
              height: 100,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey)),
              child: Container(
                margin: EdgeInsets.all(5),
                child: Text(
                  event.description,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 32),
          buildDateTime(event),
        ],
      ),
    );
  }
}
