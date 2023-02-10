// ignore_for_file: sort_child_properties_last, avoid_print, prefer_const_constructors

import 'package:dms/Views/screens/login.dart';
import 'package:dms/Views/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final _formKey = GlobalKey<FormState>();
  final _userController = TextEditingController();

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
                    "Forget Password Dms System",
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
                    //inputFormatters: ,
                    keyboardType: TextInputType.text,
                    controller: _userController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter Email',
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
                    validator: MultiValidator(
                      [
                        RequiredValidator(errorText: '*Required'),
                        EmailValidator(errorText: "errorText")
                      ],
                    ),
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Container()),
                          );
                        }
                      },
                      // icon: Icon(
                      //   Icons.question_mark,
                      //   color: Colors.white,
                      //   size: 30,
                      // ),
                      child: Text(
                        'Forget Password',
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
                          MaterialPageRoute(builder: (context) => Register()),
                        );
                      },
                      child: Text(
                        'Sign Up New Account ?',
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