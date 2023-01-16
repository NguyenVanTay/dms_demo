// ignore_for_file: sort_child_properties_last, avoid_print, prefer_final_fields, unused_field, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables


import 'package:dms/Views/screens/homepage.dart';
import 'package:dms/Views/screens/project.dart';
import 'package:dms/Views/screens/register.dart';
import 'package:flutter/material.dart';


import 'Calendar/calendar_widget.dart';
import 'all_tasks.dart';
import 'fogetpassword.dart';



class Page extends StatefulWidget {
  const Page({super.key});

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
    AllTasks(),
    CalendarWidget(),
    Project(),
    Container(),
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
            label: 'Task',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined),
            label: 'Article',
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
                      labelText: 'User Name',
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
                    // validator: MultiValidator(
                    //   [
                    //     RequiredValidator(errorText: '*Required'),
                    //     EmailValidator(errorText: "errorText")
                    //   ],
                    // ),
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
                          labelText: 'Pass Word',
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
                    child: ElevatedButton.icon(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          print('Validated');
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Page()),
                          );
                        }
                      },
                      icon: Icon(
                        Icons.login_rounded,
                        color: Colors.white,
                        size: 30,
                      ),
                      label: Text(
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
