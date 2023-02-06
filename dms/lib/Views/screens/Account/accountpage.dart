import 'package:carbon_icons/carbon_icons.dart';
import 'package:dms/Views/screens/Task/all_tasks.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';
import 'package:intl/intl.dart';
import '../../../routers/router.dart';
import '../../widgets/boxwidget.dart';
import '../../widgets/Task/taskwidget.dart';

class AccountPage extends StatefulWidget {
  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int items = 10;
    //int currentSelectionItem = 0;

    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: ListView(children: [
              Container(
                  padding: EdgeInsets.only(top: 5),
                  child: Column(children: [
                    // container top
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        height: size.height / 12,
                        child: Column(children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(children: [
                            Column(children: [
                              CircleAvatar(
                                backgroundImage: AssetImage("images/dog.jpg"),
                                radius: 28,
                              )
                            ]),
                            SizedBox(width: 8),
                            Row(children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Ly Tran Thanh Thao",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    Container(
                                        padding: EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.black54,
                                        ),
                                        //color: Colors.black54,
                                        child: Text(
                                          "1C Developer",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ))
                                  ])
                            ]),
                            Spacer(),
                            Container(
                                child: Stack(children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.notifications_outlined,
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
                            ]))
                          ])
                        ])),
                    SizedBox(
                      height: 5,
                    ),

                    // container name project.

                    //Status list
                  ]))
            ])));
  }
}
