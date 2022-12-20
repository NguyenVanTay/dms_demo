// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, unused_local_variable
import 'package:flutter/material.dart';
import '../widgets/taskwidget.dart';

class AllTasks extends StatefulWidget {
  @override
  State<AllTasks> createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  int items = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Tasks Managements",
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
        backgroundColor: Colors.white,
        //backgroundColor: Color.fromRGBO(255, 250, 160, 1),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "All",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45),
                      color: Colors.grey.withOpacity(0.2),
                    ),
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.filter_list_outlined)),
                  ),
                ],
              ),
              Container(
                height: 640,
                margin: EdgeInsets.only(top: 10),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: items,
                  itemBuilder: (context, index) => Stack(
                    children: [
                      Column(
                        children: [task],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
