// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:carbon_icons/carbon_icons.dart';
import 'package:flutter/material.dart';
import '../widgets/taskwidget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int items = 10;

    //int currentSelectionItem = 0;

    return SafeArea(
        child: Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text(
      //     "Home",
      //     style: TextStyle(
      //       fontSize: 20,
      //       fontWeight: FontWeight.bold,
      //       color: Colors.black,
      //     ),
      //   ),
      //   backgroundColor: Color.fromRGBO(255, 250, 160, 1),
      // ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                //margin: EdgeInsets.only(top: ),
                height: size.height / 8,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white70,
                              radius: 40,
                              child: CircleAvatar(
                                backgroundImage: AssetImage("images/dog.jpg"),
                                radius: 38,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 5),
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Admin",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Container(
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.black54,
                                  ),
                                  //color: Colors.black54,
                                  child: Text(
                                    "1C Developer",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Spacer(),
                        Container(
                          child: Stack(
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.circle_notifications_outlined,
                                  color: Colors.black,
                                  size: 36,
                                ),
                              ),
                              Positioned(
                                  top: 16,
                                  left: 24,
                                  child: Icon(
                                    Icons.fiber_manual_record,
                                    color: Colors.red,
                                    size: 12,
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Project:",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          overflow: TextOverflow.ellipsis,
                          "MoonSoon Festival Spring 2022 ",
                          style: TextStyle(
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        Icon(Icons.expand_more),
                      ],
                    ),
                  ],
                ),
              ),

              // components gridview  process.
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(146, 252, 161, 1),
                        //boxShadow: BoxShadow(blurRadius: 2,spreadRadius: 2,offset: 0)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 10, right: 60),
                                //padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                ),
                                child: Stack(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.edit_note_outlined),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Text(
                            overflow: TextOverflow.ellipsis,
                            "On Processing",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "3 Tasks",
                                style: TextStyle(fontSize: 16),
                              ),
                              Icon(Icons.arrow_forward)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(255, 124, 124, 0.8),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10, right: 60),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.notification_important_outlined),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 50),
                            child: Text(
                              overflow: TextOverflow.ellipsis,
                              "Overdue",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "3 Tasks",
                                style: TextStyle(fontSize: 16),
                              ),
                              Icon(Icons.arrow_forward)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(255, 250, 152, 1),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10, right: 60),
                            //padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.exit_to_app_outlined),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              overflow: TextOverflow.ellipsis,
                              "Not accepted",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "3 Tasks",
                                style: TextStyle(fontSize: 16),
                              ),
                              Icon(Icons.arrow_forward)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(185, 247, 255, 1),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10, right: 60),
                            //padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.fact_check_outlined),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              overflow: TextOverflow.ellipsis,
                              "Pending approve",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "3 Tasks",
                                style: TextStyle(fontSize: 16),
                              ),
                              Icon(Icons.arrow_forward)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(255, 225, 190, 1),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10, right: 60),
                            //padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(CarbonIcons.task_view),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              overflow: TextOverflow.ellipsis,
                              "Task from me",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "3 Tasks",
                                style: TextStyle(fontSize: 16),
                              ),
                              Icon(Icons.arrow_forward)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromRGBO(146, 252, 161, 1),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            //height: 38,
                            //  width: 38,
                            margin: EdgeInsets.only(top: 10, right: 60),

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                            ),

                            child: IconButton(
                                onPressed: () {},
                                icon:
                                    Icon(Icons.check_circle_outline_outlined)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 50),
                            child: Text(
                              overflow: TextOverflow.ellipsis,
                              "Verify",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "3 Tasks",
                                style: TextStyle(fontSize: 16),
                              ),
                              Icon(Icons.arrow_forward)
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "Tasks Manager:",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),

              //list task
              Container(
                height: size.height * 0.35,
                //margin: EdgeInsets.only(top: 0),
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
    ));
  }
}
