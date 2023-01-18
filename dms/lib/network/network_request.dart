// ignore_for_file: unnecessary_string_interpolations, unused_local_variable

import 'dart:convert';

import 'package:dms/models/projectmodel.dart';
import 'package:dms/models/statusmodel.dart';
import 'package:dms/models/typemodel.dart';
import 'package:get/get.dart';
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
      for (var projectItem in jsonDecode(response.body)) {
        projects.add(ProjectModel.fromJson(projectItem));
      }
      return projects;
    } else {
      throw Exception('Failed to call API, StatusCode: ${response.statusCode}');
    }
  }

  Future<List<StatusModel>> getAllStatus() async {
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$_userName:$_password'))}';
    Map<String, String> requestHeaders = {'authorization': basicAuth};
    List<StatusModel> status = [];

    final response = await http.get(
        Uri.parse(
          '$host/v1/ProjectStates',
        ),
        headers: requestHeaders);

    if (response.statusCode == 200) {
      for (var statusItem in jsonDecode(response.body)) {
        status.add(StatusModel.fromJson(statusItem));
      }
      return status;
    } else {
      throw Exception('Failed to call API, StatusCode: ${response.statusCode}');
    }
  }

  Future<List<TypeModel>> getAllType() async {
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$_userName:$_password'))}';
    Map<String, String> requestHeaders = {'authorization': basicAuth};
    List<TypeModel> types = [];

    final response = await http.get(
        Uri.parse(
          '$host/v1/ProjectStates',
        ),
        headers: requestHeaders);

    if (response.statusCode == 200) {
      for (var typeItem in jsonDecode(response.body)) {
        types.add(TypeModel.fromJson(typeItem));
      }
      return types;
    } else {
      throw Exception('Failed to call API, StatusCode: ${response.statusCode}');
    }
  }

  Future<bool> createProject(Map body) async {
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$_userName:$_password'))}';
    Map<String, String> requestHeaders = {'authorization': basicAuth};
    List<TypeModel> types = [];

    final response = await http.post(
        Uri.parse(
          '$host/v1/Projects',
        ),
        headers: requestHeaders,
        body: jsonEncode(body));

    if (response.statusCode == 200) {
      return true;
    } else {
      // throw Exception('Failed to call API, StatusCode: ${response.statusCode}');
      return false;
    }
  }
}
