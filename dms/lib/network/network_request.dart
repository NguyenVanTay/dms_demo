// ignore_for_file: unnecessary_string_interpolations, unused_local_variable

import 'dart:convert';

import 'package:auto_route/annotations.dart';
import 'package:dms/models/projectmodel.dart';
import 'package:http/http.dart' as http;

class Networking {
  static final Networking _instance = Networking._internal();
  static Networking getInstance() => _instance;

  // named constructor
  Networking._internal();

  // Need to be changed
  var host = 'http://103.157.218.115/DMS/hs/DMS';

  var _userName = 'Administrator';
  var _password = '';

  Networking setHost(String host) {
    host = host;
    return _instance;
  }

  Networking setUserName(String userName) {
    _userName = userName;
    return _instance;
  }

  Networking setPassword(String password) {
    _password = password;
    return _instance;
  }

  static List<ProjectModel> pareseProject(String reponseBody) {
    var list = json.decode(reponseBody) as List<dynamic>;
    List<ProjectModel> projects =
        list.map((model) => ProjectModel.fromJson(model)).toList();
    return projects;
  }

  Future<List<ProjectModel>> getAllProject() async {
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$_userName:$_password'))}';
    Map<String, String> requestHeaders = {'authorization': basicAuth};
    List<ProjectModel> projects = [];

    final response = await http.get(
        Uri.parse(
          '$host/v1/Projects',
        ),
        headers: requestHeaders);

    if (response.statusCode == 200) {
      for (var project in jsonDecode(response.body)) {
        projects.add(ProjectModel.fromJson(project));
      }
      return projects;
    } else {
      throw Exception('Failed to call API, StatusCode: ${response.statusCode}');
    }
  }
}
