// ignore_for_file: sort_child_properties_last, avoid_print, prefer_const_constructors

import 'package:dms/Views/screens/login.dart';
import 'package:flutter/material.dart';

import 'fogetpassword.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                    "Register Dms System",
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
                   // inputFormatters: [],
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
                  Stack(
                    alignment: AlignmentDirectional.centerEnd,
                    children: <Widget>[
                      TextFormField(
                        controller: _passWordController,
                        obscureText: _showPassword,
                        decoration: InputDecoration(
                          labelText: 'Confirm PassWord',
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
                        if (_formKey.currentState!.validate()) {
                          print('Validated');
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        }
                      },
                      child: Text(
                        'Register',
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
                        MaterialPageRoute(builder: (context) => Login()),
                      );
                    },
                    child: Text.rich(
                      TextSpan(
                          text: "Have An Account ",
                          style: TextStyle(fontSize: 20),
                          children: const [
                            TextSpan(
                                text: "SignIn",
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
