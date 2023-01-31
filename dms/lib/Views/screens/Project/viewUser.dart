// ignore_for_file: unnecessary_brace_in_string_interps, avoid_unnecessary_containers, prefer_const_constructors

import 'package:dms/models/usermodel.dart';
import 'package:flutter/material.dart';

import '../../../network/network_request.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  List<UserModel> users = <UserModel>[];
  @override
  void initState() {
    super.initState();
    Networking.getInstance().getAllUser().then((userData) {
      setState(() {
        users = userData;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: EdgeInsets.only(top: 10),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: users.length,
        itemBuilder: (context, index) => Stack(
          children: [
            Column(
              children: [
                Text('${users[index]}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
