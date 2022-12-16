// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class PerformerGroup extends StatefulWidget {
  const PerformerGroup({super.key});

  @override
  State<PerformerGroup> createState() => _PerformerGroupState();
}

class _PerformerGroupState extends State<PerformerGroup> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "PerformerTeam",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios_new),
          splashColor: Colors.grey,
          color: Colors.black,
          //style: ButtonStyle(backgroundColor: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      // body: Container(
      //   child: ,
      // ),
      bottomNavigationBar: null,
    ));
  }
}
