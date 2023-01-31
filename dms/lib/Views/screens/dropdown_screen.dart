import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DropdownScreen extends StatefulWidget {
  const DropdownScreen({super.key});

  @override
  State<DropdownScreen> createState() => _DropdownScreenState();
}

class _DropdownScreenState extends State<DropdownScreen> {
  String url =
      "https://raw.githubusercontent.com/dr5hn/countries-states-cities-database/master/countries%2Bstates%2Bcities.json";
  var _contries = [];
  var _states = [];
  var _cities = [];
  String? country;
  String? city;
  String? state;
  bool isContrySelected = false;
  bool isStateSelected = false;

  Future getWorldData() async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      setState(() {
        _contries = jsonResponse;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getWorldData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
