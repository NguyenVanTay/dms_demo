// ignore_for_file: avoid_unnecessary_containers, curly_braces_in_flow_control_structures, unused_field, prefer_final_fields, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, sized_box_for_whitespace, unused_import

import 'dart:convert';

import 'package:dms/Views/screens/Project/project.dart';
import 'package:dms/models/statusmodel.dart';
import 'package:dms/models/util_storage.dart';
import 'package:dms/network/network_request.dart';
import 'package:face_pile/face_pile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../sources/app_colors.dart';
import '../../widgets/Project/constants.dart';
import '../../widgets/Project/date_time_selector.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

SampleItem? selectedMenu;

// List Status dropDown
List<DropdownMenuItem<String>> get dropdownStatusItems {
  List<DropdownMenuItem<String>> statusItem = UtilStorage.statuses
      .map(
        (e) =>
            DropdownMenuItem(child: Text(e.state ?? ""), value: e.state ?? ""),
      )
      .toList();

  return statusItem;
}

// List Type dropdown
List<DropdownMenuItem<String>> get dropdownTypeItems {
  List<DropdownMenuItem<String>> typeItem = UtilStorage.types
      .map(
        (e) => DropdownMenuItem(
            child: Text(e.description ?? ""), value: e.description ?? ""),
      )
      .toList();

  return typeItem;
}

// List User dropdown.
List<DropdownMenuItem<String>> get dropdownUserItems {
  List<DropdownMenuItem<String>> userItem = UtilStorage.users
      .map(
        (e) => DropdownMenuItem(
            child: Text(e.description ?? ""), value: e.description ?? ""),
      )
      .toList();

  return userItem;
}

class CreateProject extends StatefulWidget {
  const CreateProject({super.key});

  @override
  State<CreateProject> createState() => _CreateProjectState();
}

class _CreateProjectState extends State<CreateProject> {
  //List<StatusModel> statusList = <StatusModel>[];

  late DateTime _startDate;
  late DateTime _endDate;

  DateTime? _startTime;

  DateTime? _endTime;

  Color _color = Colors.blue;
  OverlayEntry? entry;

  late FocusNode _titleNode;

  late FocusNode _descriptionNode;

  late FocusNode _dateNode;

  final GlobalKey<FormState> _form = GlobalKey();

  late TextEditingController _startDateController;

  late TextEditingController _endDateController;

  late TextEditingController _projectnamecontroller;
  late TextEditingController _projectmanagercontroller;
  late TextEditingController _statuscontroller;
  late TextEditingController _typecontroller;

  // decalre initial status, type, user, projectName
  String? status = UtilStorage.statuses[0].state;
  String? type = UtilStorage.types[0].description;
  String? user = UtilStorage.users[0].description;
  String projectName = "";

  @override
  void initState() {
    super.initState();

    _titleNode = FocusNode();
    _descriptionNode = FocusNode();
    _dateNode = FocusNode();

    _startDateController = TextEditingController();
    _endDateController = TextEditingController();

    _projectnamecontroller = TextEditingController();
    _projectmanagercontroller = TextEditingController();
    _statuscontroller = TextEditingController();
    _typecontroller = TextEditingController();
  }

  @override
  void dispose() {
    _titleNode.dispose();
    _descriptionNode.dispose();
    _dateNode.dispose();
    _projectnamecontroller.dispose();

    _projectmanagercontroller.dispose();
    _statuscontroller.dispose();
    _typecontroller.dispose();

    _startDateController.dispose();
    _endDateController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "Create Project",
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
                          "Project Name",
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
                            controller: _projectnamecontroller,
                            onSaved: (newValue) {
                              // setState(() {
                              //   projectName = newValue??"";
                              // });
                            },
                            maxLines: 2,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: Row(
                      children: [
                        Text(
                          "Project Manager",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                    child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 0.5),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 0.5),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        dropdownColor: Colors.white,
                        value: user,
                        onChanged: (String? newValue) {
                          setState(() {
                            user = newValue!;
                          });
                        },
                        items: dropdownUserItems),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: DateTimeSelectorFormField(
                            controller: _startDateController,
                            decoration: AppConstants.inputDecoration.copyWith(
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
                            onSave: (date) => _startDate = date,
                            type: DateTimeSelectionType.date,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: DateTimeSelectorFormField(
                            controller: _endDateController,
                            decoration: AppConstants.inputDecoration.copyWith(
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
                            onSave: (date) => _endDate = date,
                            type: DateTimeSelectionType.date,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 15, 10, 5),
                    child: Row(
                      children: const [
                        Text(
                          "Project Teams",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            FacePile(
                              radius: 28,
                              space: 50,
                              images: [
                                NetworkImage("https://i.pravatar.cc/300?img=1"),
                                NetworkImage("https://i.pravatar.cc/300?img=2"),
                                NetworkImage("https://i.pravatar.cc/300?img=3"),
                                NetworkImage("https://i.pravatar.cc/300?img=4"),
                                NetworkImage("https://i.pravatar.cc/300?img=5"),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              child: FloatingActionButton(
                                backgroundColor: Colors.grey,
                                onPressed: () {
                                  Future.delayed(const Duration(seconds: 0),
                                      () async {
                                    await Get.dialog(AlertDialog(
                                      //title: const Text("Members"),
                                      content: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.75,
                                        height: 300,
                                        child: SingleChildScrollView(
                                          child: Column(
                                            children: <Widget>[
                                              Stack(
                                                alignment: AlignmentDirectional
                                                    .centerEnd,
                                                children: <Widget>[
                                                  TextFormField(
                                                    decoration: InputDecoration(
                                                      labelText: 'Name',
                                                      hintText: 'Enter Name',
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                        borderSide: BorderSide(
                                                          width: 1,
                                                          style:
                                                              BorderStyle.solid,
                                                        ),
                                                      ),
                                                      fillColor: Colors.blue,
                                                      filled: false,
                                                      contentPadding:
                                                          EdgeInsets.all(16),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: IconButton(
                                                      icon: Icon(Icons.search),
                                                      onPressed: () {},
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              ListTile(
                                                onTap: () {},
                                                leading: Image.network(
                                                  "https://i.pravatar.cc/300?img=1",
                                                  fit: BoxFit.cover,
                                                ),
                                                title: Text('Trinh Van Thuong'),
                                                subtitle: Text('Developer'),
                                              ),
                                              ListTile(
                                                onTap: () {},
                                                leading: Image.network(
                                                  "https://i.pravatar.cc/300?img=2",
                                                  fit: BoxFit.cover,
                                                ),
                                                title: Text('Jimmy'),
                                                subtitle: Text('Developer'),
                                              ),
                                              ListTile(
                                                onTap: () {},
                                                leading: Image.network(
                                                  "https://i.pravatar.cc/300?img=3",
                                                  fit: BoxFit.cover,
                                                ),
                                                title: Text('Juliwan'),
                                                subtitle: Text('Designer'),
                                              ),
                                              ListTile(
                                                onTap: () {},
                                                leading: Image.network(
                                                  "https://i.pravatar.cc/300?img=4",
                                                  fit: BoxFit.cover,
                                                ),
                                                title: Text('steafun'),
                                                subtitle:
                                                    Text('leader Developer'),
                                              ),
                                              ListTile(
                                                leading: Image.network(
                                                  "https://i.pravatar.cc/300?img=5",
                                                  fit: BoxFit.cover,
                                                ),
                                                title: Text('Trinh Van Thuong'),
                                                subtitle: Text('Developer'),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ));
                                  });
                                },
                                child: Icon(
                                  Icons.add,
                                  size: 40,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 15, 10, 5),
                    child: Row(
                      children: [
                        Text(
                          "Status",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 0.5),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 0.5),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        dropdownColor: Colors.white,
                        value: status,
                        onChanged: (String? newValue) {
                          setState(() {
                            status = newValue!;
                          });
                        },
                        items: dropdownStatusItems),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 15, 10, 5),
                    child: Row(
                      children: [
                        Text(
                          "Type",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 0.5),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 0.5),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        dropdownColor: Colors.white,
                        value: type,
                        onChanged: (String? newValue) {
                          setState(() {
                            type = newValue!;
                          });
                        },
                        items: dropdownTypeItems),
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
                    margin: EdgeInsets.all(5),
                    //decoration: BoxDecoration(border: BorderRadius()),
                    child: Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      // height: 100.0,
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
                          margin: EdgeInsets.only(left: 10),
                          child: TextFormField(
                            maxLines: 6,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
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
                          "ProjectName": _projectnamecontroller.text,
                          "BeginPlan": "20230131150000",
                          "FinalPlan": "20230131150000",
                          "LongDesc": "Happy New Year",
                          "State": "Initiated",
                          "Manager": "Administrator",
                          "ProjectType": "Development project",
                          "ProjecTeamList":
                              "Trịnh Vân Thương-Leader,Chung Thành Bảo Long-Project Owner,Thuong TV-Dev",
                          "ProjectFolder": "Dự án tuần 1 - 2023"
                        };
                        // print(statusList);
                        var result =
                            await Networking.getInstance().createProject(data);
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
                          // Navigator.pushNamed(context, "/project");
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
                        'Create Project',
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
