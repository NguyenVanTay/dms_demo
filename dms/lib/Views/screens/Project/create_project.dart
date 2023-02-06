// ignore_for_file: avoid_unnecessary_containers, curly_braces_in_flow_control_structures, unused_field, prefer_final_fields, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, sized_box_for_whitespace, unused_import

import 'dart:convert';

import 'package:carbon_icons/carbon_icons.dart';
import 'package:dms/Views/screens/Project/project.dart';
import 'package:dms/models/statusmodel.dart';
import 'package:dms/models/util_storage.dart';
import 'package:dms/Views/widgets/Task/task_widget.dart';
import 'package:dms/models/foldermodel.dart';
import 'package:dms/models/statusmodel.dart';
import 'package:dms/models/util_storage.dart';
import 'package:dms/network/network_request.dart';
import 'package:face_pile/face_pile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
  List<FolderModel> folders = <FolderModel>[];
  //----- Test area-------
  late List _tempListOfCities;
  //1
  final _scaffoldKey = GlobalKey();
  final TextEditingController textController = new TextEditingController();

  //2
  static List _listOfCities = [
    "Tokyo",
    "New York",
    "London",
    "Paris",
    "Madrid",
    "Dubai",
    "Rome",
    "Barcelona",
    "Cologne",
    "Monte Carlo",
    "Puebla",
    "Florence",
    "Tokyo",
    "New York",
    "London",
    "Paris",
    "Madrid",
    "Dubai",
    "Rome",
  ];
//----- Test area-------
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

  late TextEditingController _endTimeController;
  late TextEditingController _startTimeController;

  late TextEditingController _projectnamecontroller;

  // decalre initial status, type, user, projectName
  String? status = UtilStorage.statuses[0].state;
  String? type = UtilStorage.types[0].description;
  String? user = UtilStorage.users[0].description;
  String projectName = "";

  @override
  void initState() {
    super.initState();
    Networking.getInstance().getAllFolder().then((folderData) {
      setState(() {
        folders = folderData;
      });
    });

    _titleNode = FocusNode();
    _descriptionNode = FocusNode();
    _dateNode = FocusNode();

    _startDateController = TextEditingController();
    _endDateController = TextEditingController();
    _startTimeController = TextEditingController();
    _endTimeController = TextEditingController();

    _projectnamecontroller = TextEditingController();
  }

  @override
  void dispose() {
    _titleNode.dispose();
    _descriptionNode.dispose();
    _dateNode.dispose();
    _projectnamecontroller.dispose();

    _startDateController.dispose();
    _endDateController.dispose();
    _startTimeController.dispose();
    _endTimeController.dispose();

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
                  // Project Name
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
                      height: 52.0,
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
                          margin: EdgeInsets.all(3),
                          child: TextFormField(
                            controller: _projectnamecontroller,
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

                  //Project Manager
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
                                    //_startDate = startdate;
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
                                    //_endDate = endDate;
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
                          "Folder",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    child: Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: Container(
                        height: 52.0,
                        width: 400,
                        margin: EdgeInsets.only(bottom: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          // adding borders around the widget
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      _showModal(context);
                    },
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
                          "BeginPlan":
                              DateFormat('yyyyMMdd').format(_startDate!) +
                                  DateFormat('hhmmss').format(_startTime!),
                          "FinalPlan":
                              DateFormat('yyyyMMdd').format(_endDate!) +
                                  DateFormat('hhmmss').format(_endTime!),
                          "LongDesc": "Happy New Year",
                          "State": status,
                          "Manager": user,
                          "ProjectType": type,
                          "ProjecTeamList":
                              "Trịnh Vân Thương-Leader,Chung Thành Bảo Long-Project Owner,Thuong TV-Dev",
                          "ProjectFolder": "Dự án tuần 2 - 2023"
                        };

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

  //----

  void _showModal(context) {
    showModalBottomSheet<void>(
      // isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
      ),
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 1000,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Expanded(
                              child: TextField(
                                  controller: textController,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(8),
                                    border: new OutlineInputBorder(
                                      borderRadius:
                                          new BorderRadius.circular(15.0),
                                      borderSide: new BorderSide(),
                                    ),
                                    prefixIcon: Icon(Icons.search),
                                  ),
                                  onChanged: (value) {
                                    //4
                                    setState(() {
                                      _tempListOfCities =
                                          _buildSearchList(value);
                                    });
                                  })),
                          IconButton(
                              icon: Icon(Icons.add_box_outlined),
                              color: Color(0xFF1F91E7),
                              onPressed: () {
                                // setState(() {
                                //   textController.clear();
                                //   _tempListOfCities.clear();
                                // });
                              }),
                        ],
                      ),
                    ),
                    Container(
                      height: 400,
                      child: ListView.separated(
                          itemCount: folders.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: InkWell(
                                child:
                                    _showBottomSheetWithSearch(index, folders),
                                onTap: () {},
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider()),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _showBottomSheetWithSearch(int index, List listOfCities) {
    return Text(listOfCities[index].description,
        style: TextStyle(color: Colors.black, fontSize: 16),
        textAlign: TextAlign.center);
  }

  //9
  List _buildSearchList(String userSearchTerm) {
    final _searchList = List.filled(3, null, growable: false);

    for (int i = 0; i < _listOfCities.length; i++) {
      String name = _listOfCities[i];
      if (name.toLowerCase().contains(userSearchTerm.toLowerCase())) {
        _searchList.add(_listOfCities[i]);
      }
    }
    return _searchList;
  }
}
