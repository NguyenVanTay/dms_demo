// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sort_child_properties_last

import 'package:dms/sources/header.dart';

import 'package:flutter/material.dart';
import 'sources/bottomNav.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: HomePage(),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int items = 10;

    //int currentSelectionItem = 0;
    Widget task = Container(
      margin: EdgeInsets.all(10),
      height: 70,
      width: 391,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color.fromRGBO(217, 217, 217, 1),
        boxShadow: [
          BoxShadow(
            blurRadius: 0.05,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Tên Nhiệm Vụ",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Tình Trạng : Đã nhận"),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Hạn Kiểm Tra : 15:00 ngày 01.11.2022"),
              ],
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Home Page",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
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
                        decoration: const ShapeDecoration(
                          shape: CircleBorder(),
                          color: Colors.white,
                          shadows: [
                            BoxShadow(
                              blurRadius: 0.5,
                            ),
                          ],
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.notifications_outlined,
                            color: Colors.black,
                            size: 36,
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
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "MoonSoon Festival Spring 2022 ",
                      style:
                          TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                    ),
                    Icon(Icons.expand_more),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  padding:
                      EdgeInsets.only(top: 15, bottom: 10, left: 20, right: 10),
                  margin:
                      EdgeInsets.only(top: 15, bottom: 10, left: 20, right: 10),
                  height: 126,
                  width: 173,
                  //padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(146, 252, 161, 1),
                  ),
                  //color: Colors.black54,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 48,
                        width: 48,
                        margin: EdgeInsets.only(right: 100),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                        child: Icon(
                          size: 36,
                          Icons.edit_note_outlined,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text(
                          "Đang Thực hiện",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "3 nhiệm vụ",
                            style: TextStyle(fontSize: 18),
                          ),
                          Icon(Icons.arrow_forward)
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.only(top: 15, bottom: 10, left: 20, right: 10),
                  margin:
                      EdgeInsets.only(top: 15, bottom: 10, left: 20, right: 10),
                  height: 126,
                  width: 173,
                  //padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(255, 124, 124, 0.8),
                  ),
                  //color: Colors.black54,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 48,
                        width: 48,
                        margin: EdgeInsets.only(right: 100),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                        child: Icon(
                          size: 36,
                          Icons.notification_important_outlined,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text(
                          "Sắp hết hạn",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "3 nhiệm vụ",
                            style: TextStyle(fontSize: 18),
                          ),
                          Icon(Icons.arrow_forward)
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  padding:
                      EdgeInsets.only(top: 15, bottom: 10, left: 20, right: 10),
                  margin:
                      EdgeInsets.only(top: 15, bottom: 10, left: 20, right: 10),
                  height: 126,
                  width: 173,
                  //padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(255, 250, 152, 1),
                  ),
                  //color: Colors.black54,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 48,
                        width: 48,
                        margin: EdgeInsets.only(right: 100),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                        child: Icon(
                          size: 36,
                          Icons.login_outlined,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text(
                          "Chưa nhận",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "3 nhiệm vụ",
                            style: TextStyle(fontSize: 18),
                          ),
                          Icon(Icons.arrow_forward)
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.only(top: 15, bottom: 10, left: 20, right: 10),
                  margin:
                      EdgeInsets.only(top: 15, bottom: 10, left: 20, right: 10),
                  height: 126,
                  width: 173,
                  //padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(185, 247, 255, 1),
                  ),
                  //color: Colors.black54,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 48,
                        width: 48,
                        margin: EdgeInsets.only(right: 100),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                        child: Icon(
                          size: 36,
                          Icons.check_circle_outline,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text(
                          "Chờ kiểm Tra",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "3 nhiệm vụ",
                            style: TextStyle(fontSize: 18),
                          ),
                          Icon(Icons.arrow_forward)
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "Quản lý công việc:",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Container(
              height: 220,
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
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
            backgroundColor: Colors.teal,
          ),
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
        onTap: _onItemTapped,
      ),
    );
  }
}
