// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:dms/widgets/projectwidget.dart';
import 'package:flutter/material.dart';

class Project extends StatefulWidget {
  const Project({super.key});

  @override
  State<Project> createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  int items = 10;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Projects",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            leading: IconButton(
              color: Colors.black,
              icon: Icon(Icons.arrow_back_outlined),
              splashColor: Colors.grey,
              onPressed: () {},
            ),
            actions: [
              CircleAvatar(
                backgroundColor: Colors.grey[50],
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_vert),
                  color: Colors.black,
                ),
              )
            ],
            backgroundColor: Color.fromRGBO(255, 250, 160, 1),
          ),
          body: Container(
            child: Column(children: [
              Container(
                margin:
                    EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 300),
                height: 35,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromRGBO(146, 252, 161, 1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.add,
                      size: 24,
                      color: Color.fromRGBO(0, 169, 0, 1),
                    ),
                    Text(
                      "Create",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(0, 169, 0, 1),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: height * 0.75,
                margin: EdgeInsets.only(top: 10),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: items,
                  itemBuilder: (context, index) => Stack(
                    children: [
                      Column(
                        children: [projectwidget],
                      ),
                    ],
                  ),
                ),
              )
            ]),
          )),
    );
  }
}
