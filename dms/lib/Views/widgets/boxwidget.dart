// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, avoid_unnecessary_containers, unused_field, prefer_final_fields

import 'package:dms/Views/screens/task_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/list_notifier.dart';

class Box extends StatefulWidget {
  String title;
  Icon icon;
  Color color;

  Box(
      {required this.title,
      required this.icon,
      required this.color,
      super.key});

  @override
  State<Box> createState() => _BoxState();
}

class _BoxState extends State<Box> {
  int _selectIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  List<Widget> _itemWidget = [
    Container(),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 120,
      //width: 40,
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 5),
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: widget.color,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black12, blurRadius: 4.0, offset: Offset(4.0, 4.0))
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Column(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    //margin: EdgeInsets.only(top: 10, left: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                    child: Stack(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed("");
                          },
                          icon: widget.icon,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Container(
                //margin: EdgeInsets.only(left: 20),
                child: Text(
                  widget.title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                ),
              ),
            ],
          ),
          Container(
            //margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "3 tasks",
                  style: TextStyle(fontSize: 16),
                ),
                Container(
                  //margin: EdgeInsets.only(left: 50),
                  child: Icon(Icons.arrow_forward),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
