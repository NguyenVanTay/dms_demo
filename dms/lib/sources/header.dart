// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

//import 'package:dms/nv_model.dart';
import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Stack(
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    margin: EdgeInsets.only(top: 40),
                    height: size.height / 8,
                    decoration: BoxDecoration(
                      
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(45),
                        
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white70,
                              radius: 40,
                              child: CircleAvatar(
                                backgroundImage: AssetImage("images/dog.jpg"),
                                radius: 38,
                              ),
                            ),
                            SizedBox(width: 5),
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
                            Spacer(),
                            Container(
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.notifications_outlined,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Dự Án:",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "MoonSoon Festival Spring 2022 ",
                            style: TextStyle(fontSize: 16),
                          ),
                          Icon(Icons.expand_more),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: 15, bottom: 10, left: 20, right: 10),
                        height: 126,
                        width: 173,
                        color: Colors.teal,
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: 15, bottom: 10, left: 10, right: 10),
                        height: 126,
                        width: 173,
                        color: Colors.green,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: 15, bottom: 10, left: 20, right: 10),
                        height: 126,
                        width: 173,
                        color: Colors.orange,
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: 15, bottom: 10, left: 8, right: 10),
                        height: 126,
                        width: 173,
                        color: Colors.red,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Quản lý công việc:",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
