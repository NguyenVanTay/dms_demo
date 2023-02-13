// ignore_for_file: avoid_unnecessary_containers, curly_braces_in_flow_control_structures, unused_field, prefer_final_fields, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, must_be_immutable

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
import '../Project/project.dart';

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

  CreateTask({required this.project, super.key});

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  late List<ProjectModel> projects = UtilStorage.projects;

  String? prev = "";
  late DateTime? _startDate;
  late DateTime? _endDate;

  DateTime? _startTime;

  DateTime? _endTime;

  String _title = "";

  String _description = "";

  Color _color = Colors.blue;

  late FocusNode _titleNode;

  late FocusNode _descriptionNode;

  late FocusNode _dateNode;

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

    _titleNode = FocusNode();
    _descriptionNode = FocusNode();
    _dateNode = FocusNode();

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
    _titleNode.dispose();
    _descriptionNode.dispose();
    _dateNode.dispose();

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
                    selectedMenu = item;
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
            child: Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 15, 10, 5),
                    child: Row(
                      children: const [
                        Text(
                          "Task Name",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 10, right: 10, top: 10, bottom: 10),
                    //decoration: BoxDecoration(border: BorderRadius()),
                    child: Container(
                      height: 60.0,
                      width: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // adding borders around the widget
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                      child: SingleChildScrollView(
                        // for Vertical scrolling
                        scrollDirection: Axis.vertical,
                        child: Container(
                          // height: maxheight,
                          // width: maxwidth,
                          margin: EdgeInsets.all(7),
                          child: TextFormField(
                            controller: _tasknamecontroller,
                            maxLines: 2,
                            // controller: _controller,
                            // onSaved: (newValue) {
                            //   // setState(() {
                            //   //   projectName = newValue??"";
                            //   // });
                            // },
                            // maxLines: 1,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                    ),
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
                            //Start Time
                            Expanded(
                              child: DateTimeSelectorFormField(
                                controller: _startTimeController,
                                decoration:
                                    AppConstants.inputDecorationTime.copyWith(
                                  labelText: "Start Time",
                                ),
                                validator: (value) {
                                  if (value == null || value == "")
                                    return "Please select start time.";

                                  return null;
                                },
                                textStyle: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 17.0,
                                ),
                                onSave: (startTime) {
                                  setState(() {
                                    _startTime = startTime;
                                  });
                                },
                                onSelect: (startTime) {
                                  setState(() {
                                    _startTime = startTime;
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
                                    _startDate = startdate;
                                  });
                                },
                                onSelect: (startdate) {
                                  setState(() {
                                    _startDate = startdate;
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
                                    AppConstants.inputDecorationTime.copyWith(
                                  labelText: "End Time",
                                ),
                                validator: (value) {
                                  if (value == null || value == "")
                                    return "Please select end time.";

                                  return null;
                                },
                                textStyle: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 17.0,
                                ),
                                onSave: (endTime) {
                                  setState(() {
                                    _endTime = endTime;
                                  });
                                },
                                onSelect: (endTime) {
                                  setState(() {
                                    _endTime = endTime;
                                  });
                                },
                                type: DateTimeSelectionType.time,
                              ),
                            ),
                            //EnDate
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
                                    _endDate = endDate;
                                  });
                                },
                                onSelect: (endDate) {
                                  setState(() {
                                    _endDate = endDate;
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
                              if (mounted) {
                                usersList = values;
                              }
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
                              if (mounted) {
                                tasksList = values;
                              }
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
                          "Description",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 10, right: 10, top: 10, bottom: 10),
                    //decoration: BoxDecoration(border: BorderRadius()),
                    child: Container(
                      height: 100.0,
                      width: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // adding borders around the widget
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                      ),
                      child: SingleChildScrollView(
                        // for Vertical scrolling
                        scrollDirection: Axis.vertical,
                        child: Container(
                          // height: maxheight,
                          // width: maxwidth,
                          margin: EdgeInsets.all(7),
                          child: TextFormField(
                            controller: _longdesccontroller,
                            maxLines: 4,
                            // controller: _controller,
                            // onSaved: (newValue) {
                            //   // setState(() {
                            //   //   projectName = newValue??"";
                            //   // });
                            // },
                            // maxLines: 1,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 50,
                    width: 380,
                    child: ElevatedButton(
                      onPressed: () async {
                        Map data = {
                          "Project": widget.project.code.toString(),
                          "TaskName": _tasknamecontroller.text,
                          "BeginPlan":
                              DateFormat('yyyyMMdd').format(_startDate!) +
                                  DateFormat('hhmmss').format(_startTime!),
                          "FinalPlan":
                              DateFormat('yyyyMMdd').format(_endDate!) +
                                  DateFormat('hhmmss').format(_endTime!),
                          "LongDesc": _longdesccontroller.text,
                          "PredecessorsList": tasksList,
                          "PerformerList": usersList
                        };

                        var result =
                            await Networking.getInstance().createTask(data);

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

                          Get.to(Project());

                          //handle
                        } else {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: Text("false"),
                                  ));
                        }
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
}
