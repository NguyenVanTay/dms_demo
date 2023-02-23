// ignore_for_file: sort_child_properties_last, avoid_print, prefer_final_fields, unused_field, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:dms/Views/screens/GanttChart/gantt_chart.dart';
import 'package:dms/Views/screens/homepage.dart';
import 'package:dms/Views/screens/homepage_performer.dart';
import 'package:dms/Views/screens/Project/project.dart';
import 'package:dms/Views/screens/register.dart';
import 'package:dms/models/projectmodel.dart';
import 'package:flutter/material.dart';

import '../widgets/GanttchartWidget/gantt_chart_task_item.dart';
import 'Calendar/calendar_widget.dart';
import 'Account/acountpage.dart';
import 'fogetpassword.dart';

class Page extends StatefulWidget {
  ProjectModel? project;
   Page({ this.project,super.key});

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  int _selectIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  List<Widget> _itemWidget = [
    HomePage(),
    //GanttChart(
    
      // taskItems: [
      //   // GanttChartTaskItem(
      //   //     startDate: DateTime(2022, 12, 28),
      //   //     endDate: DateTime(2022, 12, 31),
      //   //     percent: 75,
      //   //     taskDescription: "Hello World",
      //   //     onProgressColor: Colors.red,
      //   //     restProgressColor: Colors.red.shade200),
      //   // GanttChartTaskItem(
      //   //     startDate: DateTime(2022, 12, 29),
      //   //     endDate: DateTime(2023, 1, 2),
      //   //     percent: 100,
      //   //     taskDescription: "Hello World",
      //   //     onProgressColor: Colors.yellow,
      //   //     restProgressColor: Colors.yellow.shade200),
      //   // GanttChartTaskItem(
      //   //     startDate: DateTime(2023, 1, 24),
      //   //     endDate: DateTime(2023, 2, 29),
      //   //     percent: 3,
      //   //     taskDescription: "Hello World",
      //   //     onProgressColor: Colors.orange,
      //   //     restProgressColor: Colors.orange.shade200),
      //   // GanttChartTaskItem(
      //   //     startDate: DateTime(2023, 1, 24),
      //   //     endDate: DateTime(2023, 2, 29),
      //   //     percent: 3,
      //   //     taskDescription: "Hello World",
      //   //     onProgressColor: Colors.orange,
      //   //     restProgressColor: Colors.orange.shade200),
      //   // GanttChartTaskItem(
      //   //     startDate: DateTime(2023, 1, 24),
      //   //     endDate: DateTime(2023, 2, 29),
      //   //     percent: 3,
      //   //     taskDescription: "Hello World",
      //   //     onProgressColor: Colors.orange,
      //   //     restProgressColor: Colors.orange.shade200),
      //   // GanttChartTaskItem(
      //   //     startDate: DateTime(2023, 1, 24),
      //   //     endDate: DateTime(2023, 2, 29),
      //   //     percent: 3,
      //   //     taskDescription: "Hello World",
      //   //     onProgressColor: Colors.orange,
      //   //     restProgressColor: Colors.orange.shade200),
      //   // GanttChartTaskItem(
      //   //     startDate: DateTime(2023, 1, 24),
      //   //     endDate: DateTime(2023, 2, 29),
      //   //     percent: 3,
      //   //     taskDescription: "Hello World",
      //   //     onProgressColor: Colors.orange,
      //   //     restProgressColor: Colors.orange.shade200),
      //   // GanttChartTaskItem(
      //   //     startDate: DateTime(2023, 2, 22),
      //   //     endDate: DateTime(2023, 2, 28),
      //   //     percent: 75,
      //   //     taskDescription: "Project Planning",
      //   //     onProgressColor: Colors.green,
      //   //     restProgressColor: Colors.green.shade200),
      //   // GanttChartTaskItem(
      //       // startDate: DateTime(2023, 2, 22),
      //       // endDate: DateTime(2023, 2, 28),
      //       // percent: 75,
      //       // taskDescription: "Project Equipment Check",
      //       // onProgressColor: Colors.green,
      //       // restProgressColor: Colors.green.shade200)
      // ],
  //  ),
    CalendarWidget(),
    Project(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: _itemWidget.elementAt(_selectIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.task_outlined),
          //   label: 'Gantt Chart',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined),
            label: 'Project',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Account',
          ),
        ],
        currentIndex: _selectIndex,
        selectedItemColor: Color.fromRGBO(4, 131, 248, 1),
        onTap: ((index) => _onItemTapped(index)),
        //backgroundColor: Colors.teal,
      ),
    ));
  }
}

class PagePerformer extends StatefulWidget {
  const PagePerformer({super.key});

  @override
  State<PagePerformer> createState() => _PagePerformerState();
}

class _PagePerformerState extends State<PagePerformer> {
  int _selectIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  List<Widget> _itemWidget = [
    HomePagePerformer(),
    // GanttChart(
      
    //  // pro: [
        
    //     // GanttChartTaskItem(
    //     //     startDate: DateTime(2022, 12, 28),
    //     //     endDate: DateTime(2022, 12, 31),
    //     //     percent: 75,
    //     //     taskDescription: "Hello World",
    //     //     onProgressColor: Colors.red,
    //     //     restProgressColor: Colors.red.shade200),
    //     // GanttChartTaskItem(
    //     //     startDate: DateTime(2022, 12, 29),
    //     //     endDate: DateTime(2023, 1, 2),
    //     //     percent: 100,
    //     //     taskDescription: "Hello World",
    //     //     onProgressColor: Colors.yellow,
    //     //     restProgressColor: Colors.yellow.shade200),
    //     // GanttChartTaskItem(
    //     //     startDate: DateTime(2023, 1, 24),
    //     //     endDate: DateTime(2023, 2, 29),
    //     //     percent: 3,
    //     //     taskDescription: "Hello World",
    //     //     onProgressColor: Colors.orange,
    //     //     restProgressColor: Colors.orange.shade200),
    //     // GanttChartTaskItem(
    //     //     startDate: DateTime(2023, 1, 24),
    //     //     endDate: DateTime(2023, 2, 29),
    //     //     percent: 3,
    //     //     taskDescription: "Hello World",
    //     //     onProgressColor: Colors.orange,
    //     //     restProgressColor: Colors.orange.shade200),
    //     // GanttChartTaskItem(
    //     //     startDate: DateTime(2023, 1, 24),
    //     //     endDate: DateTime(2023, 2, 29),
    //     //     percent: 3,
    //     //     taskDescription: "Hello World",
    //     //     onProgressColor: Colors.orange,
    //     //     restProgressColor: Colors.orange.shade200),
    //     // GanttChartTaskItem(
    //     //     startDate: DateTime(2023, 1, 24),
    //     //     endDate: DateTime(2023, 2, 29),
    //     //     percent: 3,
    //     //     taskDescription: "Hello World",
    //     //     onProgressColor: Colors.orange,
    //     //     restProgressColor: Colors.orange.shade200),
    //     // GanttChartTaskItem(
    //     //     startDate: DateTime(2023, 1, 24),
    //     //     endDate: DateTime(2023, 2, 29),
    //     //     percent: 3,
    //     //     taskDescription: "Hello World",
    //     //     onProgressColor: Colors.orange,
    //     //     restProgressColor: Colors.orange.shade200),
    //   //],
    // ),
    CalendarWidget(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: _itemWidget.elementAt(_selectIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.task_outlined),
            label: 'Gantt Chart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Account',
          ),
        ],
        currentIndex: _selectIndex,
        selectedItemColor: Color.fromRGBO(4, 131, 248, 1),
        onTap: ((index) => _onItemTapped(index)),
        //backgroundColor: Colors.teal,
      ),
    ));
  }
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _userController = TextEditingController();
  final _passWordController = TextEditingController();
  bool _showPassword = false;

  void onToggleShowPass() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 48, 16, 16),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  Text(
                    "Welcome Dms System",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    inputFormatters: [],
                    keyboardType: TextInputType.text,
                    controller: _userController,
                    decoration: InputDecoration(
                      labelText: 'UserName',
                      hintText: 'Enter User Name',
                      prefixIcon: Align(
                        widthFactor: 1.0,
                        child: Icon(Icons.person_outline),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          width: 1,
                          style: BorderStyle.solid,
                        ),
                      ),
                      contentPadding: EdgeInsets.all(16),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Stack(
                    alignment: AlignmentDirectional.centerEnd,
                    children: <Widget>[
                      TextFormField(
                        controller: _passWordController,
                        obscureText: _showPassword,
                        decoration: InputDecoration(
                          labelText: 'PassWord',
                          hintText: 'Enter PassWord',
                          prefixIcon: Align(
                            widthFactor: 1.0,
                            child: Icon(Icons.password_outlined),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(
                              width: 1,
                              style: BorderStyle.solid,
                            ),
                          ),
                          fillColor: Colors.blue,
                          filled: false,
                          contentPadding: EdgeInsets.all(16),
                        ),
                        // validator: MultiValidator(
                        //   [
                        //     RequiredValidator(errorText: '*Required'),
                        //     MinLengthValidator(8, errorText: "errorText")
                        //   ],
                        // ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: onToggleShowPass,
                          child: Text(
                            _showPassword ? "HIDE" : "SHOW",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 60,
                    width: 240,
                    child: ElevatedButton(
                      onPressed: () {
                        // if (_formKey.currentState!.validate()) {
                        //   print('Validated');
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(builder: (context) => Page()),
                        //   );
                        // }
                        if (_userController.text == "lttt") {
                          print('Validated performer');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PagePerformer()),
                          );
                        } else {
                          print('Validated project manager');
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Page()),
                          );
                        }
                      },
                      // icon: Icon(
                      //   Icons.login_rounded,
                      //   color: Colors.white,
                      //   size: 30,
                      // ),
                      child: Text(
                        'Login',
                        style: TextStyle(fontSize: 20),
                      ),
                      style: ElevatedButton.styleFrom(
                          elevation: 20, shape: StadiumBorder()),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Register()),
                      );
                    },
                    child: Text.rich(
                      TextSpan(
                          text: "Don't Have Account ",
                          style: TextStyle(fontSize: 20),
                          children: const [
                            TextSpan(
                                text: "SignUp",
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold))
                          ]),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgetPassword()),
                        );
                      },
                      child: Text(
                        'Forget Password ?',
                        style: TextStyle(fontSize: 18, color: Colors.blue),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
