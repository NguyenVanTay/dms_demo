// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, unused_local_variable, unnecessary_new, unused_import

import 'package:flutter/material.dart';
import '../../../routers/router.dart';
import '../../widgets/Task/taskwidget.dart';
import 'package:get/get.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

//screen  All task
class AllTasks extends StatefulWidget {
  @override
  State<AllTasks> createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  SampleItem? selectedMenu;
  int items = 10;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          PopupMenuButton<SampleItem>(
            initialValue: selectedMenu,
            icon: Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
            onSelected: (SampleItem item) {
              setState(() {
                selectedMenu = item;
              });
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
              const PopupMenuItem<SampleItem>(
                value: SampleItem.itemOne,
                child: Text('Item 1'),
              ),
              const PopupMenuItem<SampleItem>(
                value: SampleItem.itemTwo,
                child: Text('Item 2'),
              ),
              const PopupMenuItem<SampleItem>(
                value: SampleItem.itemThree,
                child: Text('Item 3'),
              ),
            ],
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
                        children: [
                          // use widget TaskWidget with items count = 10
                          TaskWidget(
                            taskName: "On Process",
                            status: "status",
                            dealine: "2022-02-02",
                            taskcode: '',
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
