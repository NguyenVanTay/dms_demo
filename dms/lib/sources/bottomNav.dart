// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructor,prefer_final_fields

import 'package:dms/screens/all_tasks.dart';
import 'package:dms/screens/homepage.dart';
import 'package:flutter/material.dart';



class Bottom extends StatefulWidget {
  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

   List<Widget> _itemWidget = [
    HomePage(),
    AllTasks(),
    Container(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _itemWidget.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.task_outlined),
            label: 'Home',
          ),

          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task_outlined),
            label: 'Task',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            label: 'Calendar',
            backgroundColor: Colors.pink,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined),
            label: 'Article',
            backgroundColor: Colors.deepOrange,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Account',
            backgroundColor: Colors.pink,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: ((value) => _onItemTapped(value)),
      ),
    );
  }
}
