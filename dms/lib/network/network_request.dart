// ignore_for_file: unnecessary_string_interpolations, unused_local_variable

import 'dart:convert';

import 'package:dms/models/foldermodel.dart';
import 'package:dms/models/managerinformation.dart';
import 'package:dms/models/projectmodel.dart';
import 'package:dms/models/statusmodel.dart';
import 'package:dms/models/task_model.dart';
import 'package:dms/models/typemodel.dart';
import 'package:dms/models/usermodel.dart';
import 'package:dms/models/performerinformation.dart';
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

  Future<List<ProjectModel>> getAllProject() async {
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$_userName:$_password'))}';
    Map<String, String> requestHeaders = {'authorization': basicAuth};
    List<ProjectModel> projectList = [];

    final response = await http.get(
        Uri.parse(
          '$host/v1/Projects',
        ),
        headers: requestHeaders);

    if (response.statusCode == 200) {
      for (var projectItem in jsonDecode(response.body)) {
        projectList.add(ProjectModel.fromJson(projectItem));
      }

      UtilStorage.projects.clear();
      UtilStorage.projects.addAll(projectList);
      return projectList;
    } else {
      if (response.statusCode == 204) {
        projectList = [];
        UtilStorage.projects.clear();
        UtilStorage.projects.addAll(projectList);
        return projectList;
      } else {
        throw Exception(
            'Failed to call API, StatusCode: ${response.statusCode}');
      }
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

    final response = await http.post(
        Uri.parse(
          '$host/v1/Projects',
        ),
        headers: requestHeaders,
        body: jsonEncode(body));

    if (response.statusCode == 201) {
      //sussess
      return true;
    } else {
      // Fail

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
    }
    return users;
  }

  // Get ProjectTask by Project Code.
  Future<List<TaskModel>> getProjectTaskByProjectCode(String code) async {
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$_userName:$_password'))}';
    Map<String, String> requestHeaders = {'authorization': basicAuth};
    List<TaskModel> taskList = [];

    final response = await http.get(
        Uri.parse('$host/v1/ProjectTasks?Project=$code'),
        headers: requestHeaders);
    UtilStorage.tasks.clear();
    if (response.statusCode == 200) {
      for (var taskItem in jsonDecode(response.body)) {
        taskList.add(TaskModel.fromJson(taskItem));
      }

      UtilStorage.tasks.addAll(taskList);
    }
    return taskList;
  }

  // Get Oroject Task by Task Code
  Future<List<TaskModel>> getProjectTaskByTaskCode(String code) async {
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$_userName:$_password'))}';
    Map<String, String> requestHeaders = {'authorization': basicAuth};
    List<TaskModel> taskList = [];

    final response = await http.get(
        Uri.parse('$host/v1/ProjectTaskDetails?ProjectTask=$code'),
        headers: requestHeaders);
    UtilStorage.tasks.clear();
    if (response.statusCode == 200) {
      for (var taskItem in jsonDecode(response.body)) {
        taskList.add(TaskModel.fromJson(taskItem));
      }

      UtilStorage.tasks.addAll(taskList);
    }
    return taskList;
  }

  // post Create Task.
  Future<bool> createTask(Map body) async {
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$_userName:$_password'))}';
    Map<String, String> requestHeaders = {'authorization': basicAuth};

    final response = await http.post(
        Uri.parse(
          '$host/v1/ProjectTasks',
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

  Future<bool> createProjectFolder(Map body) async {
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$_userName:$_password'))}';
    Map<String, String> requestHeaders = {'authorization': basicAuth};

    final response = await http.post(
        Uri.parse(
          '$host/v1/ProjectFolders',
        ),
        headers: requestHeaders,
        body: jsonEncode(body));

    if (response.statusCode == 201) {
      //sussess
      return true;
    } else {
      // Fail

      return false;
    }
  }

  Future<dynamic> login(String _user, String _pass) async {
    PerformerInformationModel performerInfor;
    ManagerInformationModel managerInfor;

    String basicAuth = 'Basic ${base64Encode(utf8.encode('$_user:$_pass'))}';
    Map<String, String> requestHeaders = {'authorization': basicAuth};

    final response = await http.post(
      Uri.parse(
        '$host/v1/Authorization',
      ),
      headers: requestHeaders,
      //body: jsonEncode()
    );

    if (response.statusCode == 200) {
      if (_user == "Administrator") {
        managerInfor =
            ManagerInformationModel.fromJson(jsonDecode(response.body));
        return managerInfor;
      } else {
        performerInfor =
            PerformerInformationModel.fromJson(jsonDecode(response.body));
        return performerInfor;
      }
    } else {
      // Fail
      return false;
    }
  }
}
