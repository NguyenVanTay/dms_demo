// ignore_for_file: unnecessary_string_interpolations, unused_local_variable, non_constant_identifier_names

import 'dart:convert';

import 'package:dms/models/projectmodel.dart';
import 'package:dms/models/statusmodel.dart';
import 'package:dms/models/typemodel.dart';
import 'package:dms/models/usermodel.dart';
import 'package:dms/models/foldermodel.dart';
import 'package:dms/models/util_storage.dart';

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

  // Set host
  Networking setHost(String host) {
    host = host;
    return _instance;
  }

  // set User Name
  Networking setUserName(String userName) {
    _userName = userName;
    return _instance;
  }
  // Set Password.

  Networking setPassword(String password) {
    _password = password;
    return _instance;
  }

  Future<List<FolderModel>> getAllFolder() async {
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$_userName:$_password'))}';
    Map<String, String> requestHeaders = {'authorization': basicAuth};
    List<FolderModel> folders = [];

    final response = await http.get(
        Uri.parse(
          '$host/v1/ProjectFolders',
        ),
        headers: requestHeaders);

    if (response.statusCode == 200) {
      for (var projectItem in jsonDecode(response.body)) {
        folders.add(FolderModel.fromJson(projectItem));
      }
      return folders;
    } else {
      throw Exception('Failed to call API, StatusCode: ${response.statusCode}');
    }
  }

  // Get All Project .
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

  // Get All Status

  Future<List<StatusModel>> getAllStatus() async {
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$_userName:$_password'))}';
    Map<String, String> requestHeaders = {'authorization': basicAuth};

    List<StatusModel> statusList = [];

    final response = await http.get(
        Uri.parse(
          '$host/v1/ProjectStates',
        ),
        headers: requestHeaders);

    if (response.statusCode == 200) {
      for (var statusItem in jsonDecode(response.body)) {
        statusList.add(StatusModel.fromJson(statusItem));
      }

      // clear all Type before add all Type.
      UtilStorage.statuses.clear();
      UtilStorage.statuses.addAll(statusList);
      return statusList;
    } else {
      throw Exception('Failed to call API, StatusCode: ${response.statusCode}');
    }
  }

  // Get all Type
  Future<List<TypeModel>> getAllType() async {
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$_userName:$_password'))}';
    Map<String, String> requestHeaders = {'authorization': basicAuth};
    List<TypeModel> types = [];

    final response = await http.get(
        Uri.parse(
          '$host/v1/ProjectTypes',
        ),
        headers: requestHeaders);

    if (response.statusCode == 200) {
      for (var typeItem in jsonDecode(response.body)) {
        types.add(TypeModel.fromJson(typeItem));
      }

      // clear all Type before add all Type.
      UtilStorage.types.clear();
      UtilStorage.types.addAll(types);
      return types;
    } else {
      throw Exception('Failed to call API, StatusCode: ${response.statusCode}');
    }
  }

  // post Create Project.
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
      //sussess
      return true;
    } else {
      // Faild

      return false;
    }
  }
  // Get All Users.

  Future<List<UserModel>> getAllUser() async {
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$_userName:$_password'))}';
    Map<String, String> requestHeaders = {'authorization': basicAuth};
    List<UserModel> users = [];

    final response = await http.get(
        Uri.parse(
          '$host/v1/Users',
        ),
        headers: requestHeaders);

    if (response.statusCode == 200) {
      for (var userItem in jsonDecode(response.body)) {
        users.add(UserModel.fromJson(userItem));
      }
      UtilStorage.users.clear();
      UtilStorage.users.addAll(users);
      return users;
    } else {
      throw Exception('Failed to call API, StatusCode: ${response.statusCode}');
    }
  }

  // Get ProjectTask by Project Code.
  Future<dynamic> GetProjectTaskByProjectCode(String code) async {
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$_userName:$_password'))}';
    Map<String, String> requestHeaders = {'authorization': basicAuth};

    final response = await http.get(
        Uri.parse('$host/v1/ProjectTasks?Project=$code'),
        headers: requestHeaders);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to call API, StatusCode: ${response.statusCode}');
    }
  }
}
