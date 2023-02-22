// ignore_for_file: avoid_unnecessary_containers, curly_braces_in_flow_control_structures, unused_field, prefer_final_fields, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, must_be_immutable

import 'package:dms/Views/screens/Project/project.dart';
import 'package:dms/Views/screens/Task/tasks.dart';
import 'package:dms/models/task_model.dart';

import 'package:dms/models/usermodel.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../../../models/projectmodel.dart';
import '../../../models/util_storage.dart';

import '../../../network/network_request.dart';
import '../../../sources/app_colors.dart';

import '../../widgets/Project/constants.dart';
import '../../widgets/Project/date_time_selector.dart';
import '../../widgets/inputboxwidget.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

SampleItem? selectedMenu;

List<DropdownMenuItem<String>> get dropdownPreviousTask {
  List<DropdownMenuItem<String>> preItem = UtilStorage.tasks
      .map(
        (e) => DropdownMenuItem(
            child: Text(e.description ?? ""), value: e.description ?? ""),
      )
      .toList();

  return preItem;
}

class CreateTask extends StatefulWidget {
  ProjectModel project;
  TaskModel? task;

  CreateTask({required this.project, super.key});

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  // late List<ProjectModel> projects = UtilStorage.projects;

  String? prev = "";
  late DateTime? _startDate;
  late DateTime? _endDate;

  late DateTime? _startTime;

  late DateTime? _endTime;

  String performers = '';
  String taskName = '';
  List performersList = [];
  String previousTasks = '';
  List previousTaskList = [];
  Color _color = Colors.blue;

  final GlobalKey<FormState> _form = GlobalKey();
  final _multiSelectKey = GlobalKey<FormFieldState>();
  late TextEditingController _startDateController;
  late TextEditingController _startTimeController;
  late TextEditingController _endTimeController;
  late TextEditingController _endDateController;
  late TextEditingController _tasknamecontroller;
  late TextEditingController _longdesccontroller;

  List<UserModel> usersList = UtilStorage.users;
  List<TaskModel> tasksList = UtilStorage.tasks;

  //List<UserModel> usersList = [];

  late List<MultiSelectItem<UserModel>> _userItems = [];
  late List<MultiSelectItem<TaskModel>> _taskItems = [];

  @override
  void initState() {
    super.initState();

    _startDateController = TextEditingController();
    _endDateController = TextEditingController();
    _startTimeController = TextEditingController();
    _endTimeController = TextEditingController();
    _tasknamecontroller = TextEditingController();
    _longdesccontroller = TextEditingController();

    _userItems = usersList
        .map((user) =>
            MultiSelectItem<UserModel>(user, user.description.toString()))
        .toList();

    _taskItems = tasksList
        .map((task) =>
            MultiSelectItem<TaskModel>(task, task.description.toString()))
        .toList();
  }

  @override
  void dispose() {
    _startDateController.dispose();
    _endDateController.dispose();
    _startTimeController.dispose();
    _endTimeController.dispose();
    _tasknamecontroller.dispose();
    _longdesccontroller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "Create Task",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            leading: IconButton(
              color: Colors.black,
              icon: const Icon(Icons.arrow_back_outlined),
              splashColor: Colors.grey,
              onPressed: () {
                Get.back();
              },
            ),
            actions: [
              PopupMenuButton<SampleItem>(
                initialValue: selectedMenu,
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.black,
                ),
                onSelected: (SampleItem item) {
                  setState(() {
                    if (mounted) selectedMenu = item;
                  });
                },
                itemBuilder: (BuildContext context) =>
                    <PopupMenuEntry<SampleItem>>[
                  const PopupMenuItem<SampleItem>(
                    value: SampleItem.itemOne,
                    child: Text('Item 1'),
                  ),
                  const PopupMenuItem<SampleItem>(
                    value: SampleItem.itemTwo,
                    child: Text('Item 2'),
                  ),
                  const PopupMenuItem<SampleItem>(
                    value: SampleItem.itemThree,
                    child: Text('Item 3'),
                  ),
                ],
              )
            ],
            backgroundColor: Colors.white,
          ),
          body: SingleChildScrollView(
            child: Form(
              key: _form,
              child: Column(
                children: [
                  MyCustomInputBox(
                    maxline: null,
                    controller: _tasknamecontroller,
                    inputHint: 'Enter task names',
                    label: 'Task Name',
                    text: taskName,
                    waringText: "Please enter Task name",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: DateTimeSelectorFormField(
                                controller: _startTimeController,
                                decoration:
                                    AppConstants.inputDecoration.copyWith(
                                  labelText: "Start Time",
                                ),
                                validator: (value) {
                                  if (value == null || value == "")
                                    return "Please select Time.";

                                  return null;
                                },
                                textStyle: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 18.0,
                                ),
                                onSave: (startTime) {
                                  setState(() {
                                    if (mounted) _startTime = startTime;
                                  });
                                },
                                onSelect: (startTime) {
                                  setState(() {
                                    if (mounted) _startTime = startTime;
                                  });
                                },
                                type: DateTimeSelectionType.time,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            // Start Date
                            Expanded(
                              child: DateTimeSelectorFormField(
                                controller: _startDateController,
                                decoration:
                                    AppConstants.inputDecoration.copyWith(
                                  labelText: "Start Date",
                                ),
                                validator: (value) {
                                  if (value == null || value == "")
                                    return "Please select date.";

                                  return null;
                                },
                                textStyle: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 17.0,
                                ),
                                onSave: (startdate) {
                                  setState(() {
                                    if (mounted) _startDate = startdate;
                                  });
                                },
                                onSelect: (startdate) {
                                  setState(() {
                                    if (mounted) _startDate = startdate;
                                  });
                                },
                                type: DateTimeSelectionType.date,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: DateTimeSelectorFormField(
                                controller: _endTimeController,
                                decoration:
                                    AppConstants.inputDecoration.copyWith(
                                  labelText: "End Time",
                                ),
                                validator: (value) {
                                  if (value == null || value == "")
                                    return "Please select Time.";

                                  return null;
                                },
                                textStyle: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 18.0,
                                ),
                                onSave: (endTime) {
                                  setState(() {
                                    if (mounted) _endTime = endTime;
                                  });
                                },
                                onSelect: (endTime) {
                                  setState(() {
                                    if (mounted) _endTime = endTime;
                                  });
                                },
                                type: DateTimeSelectionType.time,
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: DateTimeSelectorFormField(
                                controller: _endDateController,
                                decoration:
                                    AppConstants.inputDecoration.copyWith(
                                  labelText: "End Date",
                                ),
                                validator: (value) {
                                  if (value == null || value == "")
                                    return "Please select date.";

                                  return null;
                                },
                                textStyle: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 18.0,
                                ),
                                onSave: (endDate) {
                                  setState(() {
                                    if (mounted) _endDate = endDate;
                                  });
                                },
                                onSelect: (endDate) {
                                  setState(() {
                                    if (mounted) _endDate = endDate;
                                  });
                                },
                                type: DateTimeSelectionType.date,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 15, 10, 5),
                    child: Row(
                      children: [
                        Text(
                          "Performer",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: MultiSelectDialogField(
                          searchable: true,
                          items: _userItems,
                          dialogHeight: 200,
                          title: const Text(
                            "Select Performer ",
                            style: TextStyle(color: Colors.black),
                          ),
                          selectedColor: Colors.black,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // adding borders around the widget
                            border: Border.all(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                          ),
                          buttonIcon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black,
                          ),
                          buttonText: const Text(
                            "Select Your Performer",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          onConfirm: (values) {
                            setState(() {
                              if (mounted) usersList = values;
                              performersList = [];

                              for (var userItem in usersList) {
                                performersList.add(userItem.description);
                              }
                              performers = performersList.toString().substring(
                                  1, performersList.toString().length - 1);
                            });

                            _multiSelectKey.currentState?.validate();
                          },
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 15, 10, 5),
                    child: Row(
                      children: [
                        Text(
                          "Previous Task",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: MultiSelectDialogField(
                          dialogHeight: 200,

                          searchable: true,
                          items: _taskItems,
                          title: const Text(
                            "Select Task ",
                            style: TextStyle(color: Colors.black),
                          ),
                          // selectedColor: Colors.black,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            // adding borders around the widget
                            border: Border.all(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                          ),
                          buttonIcon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black,
                          ),
                          buttonText: const Text(
                            "Select Your Task",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          onConfirm: (values) {
                            setState(() {
                              if (mounted) tasksList = values;
                              previousTaskList = [];

                              for (var taskItem in tasksList) {
                                previousTaskList.add(taskItem.code);
                              }

                              previousTasks = previousTaskList
                                  .toString()
                                  .substring(1,
                                      previousTaskList.toString().length - 1);
                            });

                            _multiSelectKey.currentState?.validate();
                          },
                        ),
                      )
                    ],
                  ),
                  MyCustomInputBox(
                    maxline: null,
                    controller: _longdesccontroller,
                    inputHint: 'Add description ',
                    label: 'Description ',
                    text: taskName,
                    waringText: "Please enter description",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 50,
                    width: 380,
                    child: ElevatedButton(
                      onPressed: () {
                        _createTask();
                      },
                      child: Text(
                        'Create Task',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                          elevation: 20,
                          // : BorderRadius.circular(10),
                          backgroundColor: Color.fromRGBO(146, 252, 161, 1)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          )),
    );
  }

  void _createTask() async {
    if (_form.currentState!.validate() == true) {
      Map data = {
        "Project": widget.project.code,
        "TaskName": _tasknamecontroller.text,
        "LongDesc": _longdesccontroller.text,
        "PredecessorsList": previousTasks,
        "PerformerList": performers,
        "ProjectTaskBegin": DateFormat('yyyyMMdd').format(_startDate!) +
            DateFormat('hhmmss').format(_startTime!),
        "ProjectTaskFinal": DateFormat('yyyyMMdd').format(_endDate!) +
            DateFormat('hhmmss').format(_endTime!),
      };

      var result = await Networking.getInstance().createTask(data);

      if (result) {
        await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Done'),
            content: Text('Create Success'),
            actions: <Widget>[
              TextButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );

        //handle
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Failed'),
            content: Text('Create Failed'),
            actions: <Widget>[
              TextButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      }
      Get.to(Tasks(
        project: widget.project,
        // task: widget.task!,
      ));
    }
  }
}
