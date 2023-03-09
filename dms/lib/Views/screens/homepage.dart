// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, unnecessary_new, unused_import, non_constant_identifier_names, must_be_immutable

import 'package:carbon_icons/carbon_icons.dart';
import 'package:dms/Views/screens/Task/all_tasks.dart';
import 'package:dms/Views/screens/Task/verify_task.dart';
import 'package:dms/Views/widgets/Project/projectwidget.dart';
import 'package:dms/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import '../../models/projectmodel.dart';
import '../../models/util_storage.dart';
import '../../network/network_request.dart';
import '../../models/taskonuser_model.dart';
import '../../routers/router.dart';
import '../widgets/boxwidget.dart';
import '../widgets/Task/taskwidget.dart';

class HomePage extends StatefulWidget {
  String name;
  String role;
  String taskOfOnprocess;
  String taskOfOverdue;
  String taskOfNotaccepted;
  String taskOfPendingapproval;
  String taskOfTaskfromme;
  String taskOfVerify;
  TaskModel task;

  HomePage(
      {required this.name,
      required this.role,
      required this.taskOfOnprocess,
      required this.taskOfOverdue,
      required this.taskOfNotaccepted,
      required this.taskOfPendingapproval,
      required this.taskOfTaskfromme,
      required this.taskOfVerify,
      required this.task});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //-- Dashboard information
  String _taskOfOnprocess = "0";
  String _taskOfOverdue = "0";
  String _taskOfNotaccepted = "0";
  String _taskOfPendingapproval = "0";
  String _taskOfTaskfromme = "0";
  String _taskOfVerify = "0";

  //-- Get login information
  String username = "";
  String password = "";
  final _storage = new FlutterSecureStorage();

  Future<void> _readusername() async {
    final user;
    user = await _storage.read(key: 'username');
    username = user;
  }

  Future<void> _readpassword() async {
    final pass = await _storage.read(key: 'password');
    password = pass!;
  }

  //-- Get project
  List<ProjectModel> projects = <ProjectModel>[];

  //-- create avatar --
  static TextStyle defaultAvatarText = const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      fontFamily: 'Roboto, sans-serif',
      color: Colors.white,
      height: 1.45);
  Widget DefaultAvatar(String name, {String teacherName = "", int size = 20}) {
    var names = name.split(" ");
    // while (names.length < 2) {
    //   names.add(" ");
    // }
    String defaultString = "";

    if (name.isEmpty) {
      defaultString = "";
    } else if (names.length < 2) {
      defaultString = names[0].toUpperCase()[0];
    } else {
      defaultString =
          names[0].toUpperCase()[0] + names[names.length - 1].toUpperCase()[0];
    }
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black),
      child: Center(
        child: Text(
          defaultString,
          style: defaultAvatarText,
        ),
      ),
    );
  }

  // -- Get task on user
  List<TaskOnUserModel> _tempListOfTask = [];
  List<TaskOnUserModel> taskList = [];

  Future<void> _gettask() async {
    await _readusername();
    await _readpassword();
    await Networking.getInstance()
        .getProjectTaskByUser(username, password)
        .then((list) {
      setState(() {
        taskList = list;
      });
    });
    _getprojectlist();
  }

  String? project_chossen = "";

  Future<void> _getproject() async {
    await Networking.getInstance().getAllProject().then((projectData) {
      setState(() {
        if (mounted) projects = projectData;
      });
    });
  }

  List<String> projectList = [];

  // List Type dropdown

  void _getprojectlist() async {
    await _getproject();
    ProjectModel all = ProjectModel.fromJson(
        {"Description": "All project", "Code": "00000000000"});
    projects.add(all);
    for (int i = 0; i < projects.length; i++) {
      projectList.add(projects[i].description.toString());
    }
    project_chossen = projects[projects.length - 1].code;
    _taskOfTaskfromme = _gettaskFromme(project_chossen.toString());
    _taskOfVerify = _gettaskVerify(project_chossen.toString());
  }

  List<DropdownMenuItem<String>> get dropdownProjectItems {
    List<DropdownMenuItem<String>> projectItem = projects
        .map(
          (e) => DropdownMenuItem(
              child: Text(e.description ?? ""), value: e.code ?? ""),
        )
        .toList();

    return projectItem;
  }

  @override
  void initState() {
    super.initState();
    _gettask();
    //_getprojectlist();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int items = taskList.length;
    //int currentSelectionItem = 0;

    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: ListView(children: [
              Container(
                  padding: EdgeInsets.only(top: 5),
                  child: Column(children: [
                    // container top
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        height: size.height / 12,
                        child: Column(children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(children: [
                            Column(children: [
                              // CircleAvatar(
                              //   backgroundImage: AssetImage("images/dog.jpg"),
                              //   radius: 28,
                              // )
                              DefaultAvatar(
                                widget.name,
                              ),
                            ]),
                            SizedBox(width: 8),
                            Row(children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.name,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    Container(
                                        padding: EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Colors.black54,
                                        ),
                                        //color: Colors.black54,
                                        child: Text(
                                          widget.role,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ))
                                  ])
                            ]),
                            Spacer(),
                            Container(
                                child: Stack(children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.notifications_outlined,
                                  color: Colors.black,
                                  size: 36,
                                ),
                              ),
                              Positioned(
                                  top: 16,
                                  left: 24,
                                  child: Icon(
                                    Icons.fiber_manual_record,
                                    color: Colors.red,
                                    size: 12,
                                  ))
                            ]))
                          ])
                        ])),
                    SizedBox(
                      height: 5,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Project:",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10, right: 0),
                          child: DropdownButton<String>(
                            alignment: Alignment.centerRight,
                            value: project_chossen,
                            icon: const Icon(Icons.expand_more),
                            elevation: 16,
                            style: const TextStyle(color: Colors.black),
                            underline: Container(
                              height: 2,
                              color: Colors.white,
                            ),
                            onChanged: (String? value) {
                              // This is called when the user selects an item.
                              setState(() {
                                project_chossen = value!;
                                _tempListOfTask =
                                    _buildSearchList(project_chossen!);
                                _taskOfTaskfromme =
                                    _gettaskFromme(project_chossen!);
                                _taskOfVerify =
                                    _gettaskVerify(project_chossen!);
                              });
                            },
                            items: projects.map<DropdownMenuItem<String>>(
                                (ProjectModel item) {
                              return DropdownMenuItem<String>(
                                value: item.code,
                                child: Text(item.description.toString()),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 5,
                    ),
                    //Status list
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16),
                      child: GridView.count(
                        //padding: EdgeInsets.only(left: 12),
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        childAspectRatio: 1.4,
                        children: [
                          GestureDetector(
                            child: Box(
                              title: "On Process",
                              icon: Icon(Icons.edit_note_outlined),
                              color: Color.fromRGBO(146, 252, 161, 1),
                              task: widget.taskOfOnprocess,
                            ),
                          ),
                          GestureDetector(
                            child: Box(
                              title: "Overdue",
                              icon: Icon(CarbonIcons.warning_other),
                              color: Color.fromRGBO(255, 124, 124, 0.8),
                              task: widget.taskOfOverdue,
                            ),
                          ),
                          GestureDetector(
                            child: Box(
                              title: "Not accepted",
                              icon: Icon(Icons.event_busy_outlined),
                              color: Color.fromRGBO(255, 250, 152, 1),
                              task: widget.taskOfNotaccepted,
                            ),
                          ),
                          GestureDetector(
                            child: Box(
                              title: "Pending approval",
                              icon: Icon(Icons.pending_actions_outlined),
                              color: Color.fromRGBO(185, 247, 255, 1),
                              task: widget.taskOfPendingapproval,
                            ),
                          ),
                          GestureDetector(
                            child: Box(
                              title: "Task from me",
                              icon: Icon(Icons.input_outlined),
                              color: Color.fromRGBO(255, 225, 190, 1),
                              task: _taskOfTaskfromme,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => VerifyTask(task: widget.task));
                            },
                            child: Box(
                              title: "Review",
                              icon: Icon(Icons.check_circle_outline),
                              color: Color.fromRGBO(228, 228, 228, 1),
                              task: _taskOfVerify,
                            ),
                          ),
                        ],
                      ),
                    ),

                    //list task
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "Tasks Management",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: IconButton(
                              icon: Icon(Icons.arrow_forward),
                              onPressed: () {
                                Get.to(AllTasks());
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                        height: size.height * 0.45,
                        //margin: EdgeInsets.only(top: 0),
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: (project_chossen != "00000000000")
                                ? _tempListOfTask.length
                                : taskList.length,
                            itemBuilder: (context, index) => Stack(children: [
                                  Column(children: [
                                    (project_chossen != "00000000000")
                                        ? TaskWidget(
                                            taskName: _tempListOfTask[index]
                                                .description
                                                .toString(),
                                            status: _tempListOfTask[index]
                                                .taskStatus
                                                .toString(),
                                            dealine: _tempListOfTask[index]
                                                .projectTaskFinal
                                                .toString(),
                                            taskcode: _tempListOfTask[index]
                                                .code
                                                .toString(),
                                          )
                                        : TaskWidget(
                                            taskName: taskList[index]
                                                .description
                                                .toString(),
                                            status: taskList[index]
                                                .taskStatus
                                                .toString(),
                                            dealine: taskList[index]
                                                .projectTaskFinal
                                                .toString(),
                                            taskcode:
                                                taskList[index].code.toString(),
                                          ),
                                  ])
                                ])))
                  ]))
            ])));
  }

  List<TaskOnUserModel> _buildSearchList(String projectcode) {
    //final _searchList = List.filled(3, null, growable: false);
    if (projectcode == '00000000000') {
      return taskList;
    }
    List<TaskOnUserModel> _searchList = <TaskOnUserModel>[];
    for (int i = 0; i < taskList.length; i++) {
      String? pcode = taskList[i].projectcode;
      if (pcode.toString().toLowerCase().contains(projectcode.toLowerCase())) {
        _searchList.add(taskList[i]);
      }
    }
    return _searchList;
  }

  String _gettaskOnprogress(String projectcode) {
    //final _searchList = List.filled(3, null, growable: false);
    String task = "0";
    if (projectcode == '00000000000') {
      int tmp = 0;
      if (taskList.length != 0) {
        for (int i = 0; i < taskList.length; i++) {
          if ((((taskList[i].isTaskAuthor == true) &&
                      (taskList[i].currentPerformerDescription ==
                          widget.name)) ||
                  (taskList[i].isTaskAuthor == false)) &&
              (taskList[i].taskStatus == "In Progress")) tmp = tmp + 1;
        }
      }
      task = tmp.toString();
    } else {
      int tmp = 0;
      if (_tempListOfTask.length != 0) {
        for (int i = 0; i < _tempListOfTask.length; i++) {
          if ((((_tempListOfTask[i].isTaskAuthor == true) &&
                      (_tempListOfTask[i].currentPerformerDescription ==
                          widget.name)) ||
                  (_tempListOfTask[i].isTaskAuthor == false)) &&
              (_tempListOfTask[i].taskStatus == "In Progress")) tmp = tmp + 1;
        }
      }
      task = tmp.toString();
    }
    return task;
  }

  String _gettaskOverdue(String projectcode) {
    //final _searchList = List.filled(3, null, growable: false);
    String task = "0";
    if (projectcode == '00000000000') {
      int tmp = 0;
      if (taskList.length != 0) {
        for (int i = 0; i < taskList.length; i++) {
          if (taskList[i].taskStatus == "In Progress") tmp = tmp + 1;
        }
      }
      task = tmp.toString();
    } else {
      int tmp = 0;
      if (_tempListOfTask.length != 0) {
        for (int i = 0; i < _tempListOfTask.length; i++) {
          if (_tempListOfTask[i].taskStatus == "In Progress") tmp = tmp + 1;
        }
      }
      task = tmp.toString();
    }
    return task;
  }

  String _gettaskNotaccept(String projectcode) {
    //final _searchList = List.filled(3, null, growable: false);
    String task = "0";
    if (projectcode == '00000000000') {
      int tmp = 0;
      if (taskList.isNotEmpty) {
        for (int i = 0; i < taskList.length; i++) {
          if ((((taskList[i].isTaskAuthor == true) &&
                      (taskList[i].currentPerformerDescription ==
                          widget.name)) ||
                  (taskList[i].isTaskAuthor == false)) &&
              (taskList[i].taskStatus == "Assigned")) tmp = tmp + 1;
        }
      }
      task = tmp.toString();
    } else {
      int tmp = 0;
      if (_tempListOfTask.isNotEmpty) {
        for (int i = 0; i < _tempListOfTask.length; i++) {
          if ((((_tempListOfTask[i].isTaskAuthor == true) &&
                      (_tempListOfTask[i].currentPerformerDescription ==
                          widget.name)) ||
                  (_tempListOfTask[i].isTaskAuthor == false)) &&
              (_tempListOfTask[i].taskStatus == "Assigned")) tmp = tmp + 1;
        }
      }
      task = tmp.toString();
    }
    return task;
  }

  String _gettaskPendingapproval(String projectcode) {
    //final _searchList = List.filled(3, null, growable: false);
    String task = "0";
    if (projectcode == '00000000000') {
      int tmp = 0;
      if (taskList.isNotEmpty) {
        for (int i = 0; i < taskList.length; i++) {
          if (taskList[i].taskStatus == "Assigned") tmp = tmp + 1;
        }
      }
      task = tmp.toString();
    } else {
      int tmp = 0;
      if (_tempListOfTask.isNotEmpty) {
        for (int i = 0; i < _tempListOfTask.length; i++) {
          if (_tempListOfTask[i].taskStatus == "Assigned") tmp = tmp + 1;
        }
      }
      task = tmp.toString();
    }
    return task;
  }

  String _gettaskFromme(String projectcode) {
    //final _searchList = List.filled(3, null, growable: false);
    String task = "0";
    if (projectcode == '00000000000') {
      int tmp = 0;
      if (taskList.isNotEmpty) {
        for (int i = 0; i < taskList.length; i++) {
          if (taskList[i].isTaskAuthor = true) tmp = tmp + 1;
        }
      }
      task = tmp.toString();
    } else {
      int tmp = 0;
      if (_tempListOfTask.isNotEmpty) {
        for (int i = 0; i < _tempListOfTask.length; i++) {
          if (_tempListOfTask[i].isTaskAuthor = true) tmp = tmp + 1;
        }
      }
      task = tmp.toString();
    }
    return task;
  }

  String _gettaskVerify(String projectcode) {
    //final _searchList = List.filled(3, null, growable: false);
    String task = "0";
    if (projectcode == '00000000000') {
      int tmp = 0;
      if (taskList.isNotEmpty) {
        for (int i = 0; i < taskList.length; i++) {
          if (taskList[i].isTaskReview = true) tmp = tmp + 1;
        }
      }
      task = tmp.toString();
    } else {
      int tmp = 0;
      if (_tempListOfTask.isNotEmpty) {
        for (int i = 0; i < _tempListOfTask.length; i++) {
          if (_tempListOfTask[i].isTaskReview = true) tmp = tmp + 1;
        }
      }
      task = tmp.toString();
    }
    return task;
  }
}
