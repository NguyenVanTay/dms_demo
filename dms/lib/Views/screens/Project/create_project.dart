// ignore_for_file: avoid_unnecessary_containers, curly_braces_in_flow_control_structures, unused_field, prefer_final_fields, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, sized_box_for_whitespace, unused_import

import 'dart:convert';

import 'package:dms/Views/screens/Project/project.dart';
import 'package:dms/models/statusmodel.dart';
import 'package:dms/models/foldermodel.dart';
import 'package:dms/models/util_storage.dart';
import 'package:dms/Views/widgets/Task/task_widget.dart';
import 'package:dms/network/network_request.dart';
import 'package:face_pile/face_pile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import '../../../models/usermodel.dart';
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

  List<FolderModel> _tempListOfCities = [];
  String projectfolder = "";
  List<FolderModel> folders = <FolderModel>[];
  List projectTeamList = [];
  String projectTeams = '';
  List<UserModel> usersList = UtilStorage.users;
  final TextEditingController textController = TextEditingController();
  final TextEditingController _searchfolderController = TextEditingController();
  final TextEditingController _createfolderController = TextEditingController();
//----- Test area-------
  late DateTime? _startDate;
  late DateTime? _endDate;

  DateTime _startTime = DateTime.parse("0000-00-00 08:00:00");

  DateTime _endTime = DateTime.parse("0000-00-00 17:00:00");

  Color _color = Colors.blue;
  OverlayEntry? entry;

  final GlobalKey<FormState> _form = GlobalKey();
  final _multiSelectKey = GlobalKey<FormFieldState>();
  late TextEditingController _startDateController;
  late TextEditingController _endDateController;

  late TextEditingController _projectnamecontroller;
  late TextEditingController _longdesccontroller;

  //decalre initial status, type, user, projectName
  String? status = UtilStorage.statuses[0].state;
  String? type = UtilStorage.types[0].description;
  String? user = UtilStorage.users[0].description;
  late List<MultiSelectItem<UserModel>> _userItems = [];
  String projectName = "";

  @override
  void initState() {
    // List<FolderModel> _tempListOfCities = [];
    // String projectfolder = "";
    super.initState();
    Networking.getInstance().getAllFolder().then((folderData) {
      setState(() {
        folders = folderData;
      });
    });

    _startDateController = TextEditingController();
    _endDateController = TextEditingController();

    _projectnamecontroller = TextEditingController();
    _longdesccontroller = TextEditingController();
    _userItems = usersList
        .map((user) =>
            MultiSelectItem<UserModel>(user, user.description.toString()))
        .toList();
  }

  @override
  void dispose() {
    _projectnamecontroller.dispose();

    _startDateController.dispose();
    _endDateController.dispose();
    _longdesccontroller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: true,
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
                      // height: deviceHeight * 0.1,
                      // width: deviceWidth,
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
                          margin: EdgeInsets.all(7),
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
                            borderRadius: BorderRadius.circular(10),
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
                            if (mounted) user = newValue!;
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
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: MultiSelectDialogField(
                          searchable: true,
                          items: _userItems,
                          dialogHeight: 200,
                          title: const Text(
                            "Select Project Team ",
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
                            "Select Your ",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          onConfirm: (values) {
                            setState(() {
                              usersList = values;
                              projectTeamList = [];
                              for (var userItem in values) {
                                projectTeamList.add(userItem.description);
                              }

                              projectTeams = projectTeamList
                                  .toString()
                                  .substring(
                                      1, projectTeamList.toString().length - 1);
                            });

                            //_multiSelectKey.currentState?.validate();
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
                        // height: deviceHeight * 0.07,
                        // width: deviceWidth,
                        margin: EdgeInsets.only(bottom: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          // adding borders around the widget
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              projectfolder,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      if (mounted) _showModal(context);
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
                            if (mounted) type = newValue!;
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
                          //height: maxheight,
                          // width: maxwidth,
                          margin: EdgeInsets.only(left: 10),
                          child: TextFormField(
                            controller: _longdesccontroller,
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
                          "ProjectBegin":
                              DateFormat('yyyyMMdd').format(_startDate!) +
                                  DateFormat('hhmmss').format(_startTime),
                          "ProjectFinal":
                              DateFormat('yyyyMMdd').format(_endDate!) +
                                  DateFormat('hhmmss').format(_endTime),
                          "LongDesc": _longdesccontroller.text,
                          "State": status,
                          "Manager": user,
                          "ProjectType": type,
                          "ProjecTeamList": projectTeams,
                          "ProjectFolder": projectfolder
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
    // double deviceWidth = MediaQuery.of(context).size.width;
    // double deviceHeight = MediaQuery.of(context).size.height;
    bool clickbutton_addfolder = false;
    String foldername = "";
    showModalBottomSheet<void>(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
      ),
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return DraggableScrollableSheet(
                expand: false,
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Expanded(
                                child: TextField(
                                    controller: _searchfolderController,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(8),
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        borderSide: BorderSide(),
                                      ),
                                      prefixIcon: Icon(Icons.search),
                                    ),
                                    onChanged: (value) {
                                      //4
                                      setState(() {
                                        if (mounted)
                                          _tempListOfCities =
                                              _buildSearchList(value);
                                      });
                                    })),
                            IconButton(
                                icon: Icon(Icons.add_box_outlined),
                                color: Color(0xFF1F91E7),
                                onPressed: () {
                                  setState(() {
                                    if (mounted)
                                      (clickbutton_addfolder)
                                          ? clickbutton_addfolder = false
                                          : clickbutton_addfolder = true;
                                  });
                                }),
                          ],
                        ),
                      ),
                      // -- Create folder area
                      (clickbutton_addfolder)
                          ? Padding(
                              padding: EdgeInsets.all(8),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  // adding borders around the widget
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(8, 0, 0, 4),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Create folder",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: TextField(
                                                  autofocus: true,
                                                  controller:
                                                      _createfolderController,
                                                  decoration: InputDecoration(
                                                    contentPadding:
                                                        EdgeInsets.all(8),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0),
                                                      borderSide: BorderSide(),
                                                    ),
                                                    //prefixIcon: Icon(Icons.search),
                                                  ),
                                                  onChanged: (foldervalue) {
                                                    //4
                                                    foldername = foldervalue;
                                                  })),
                                          IconButton(
                                              onPressed: () async {
                                                String createDate =
                                                    DateTime.now()
                                                        .year
                                                        .toString();
                                                (DateTime.now()
                                                            .month
                                                            .toString()
                                                            .length ==
                                                        2)
                                                    ? createDate = createDate +
                                                        DateTime.now()
                                                            .month
                                                            .toString()
                                                    : createDate = createDate +
                                                        "0" +
                                                        DateTime.now()
                                                            .month
                                                            .toString();
                                                (DateTime.now()
                                                            .day
                                                            .toString()
                                                            .length ==
                                                        2)
                                                    ? createDate = createDate +
                                                        DateTime.now()
                                                            .day
                                                            .toString()
                                                    : createDate = createDate +
                                                        "0" +
                                                        DateTime.now()
                                                            .day
                                                            .toString() +
                                                        "0000";
                                                Map data = {
                                                  "FolderName": foldername,
                                                  "CreationDate": createDate
                                                };
                                                Map dataadd = {
                                                  "Code": foldername,
                                                  "Description": foldername
                                                };
                                                var result = await Networking
                                                        .getInstance()
                                                    .createProjectFolder(data);

                                                if (result) {
                                                  await showDialog(
                                                    context: context,
                                                    builder: (context) =>
                                                        AlertDialog(
                                                      title: Text('Done'),
                                                      content: Text(
                                                          'Create Success'),
                                                      actions: <Widget>[
                                                        TextButton(
                                                          child: Text('Ok'),
                                                          onPressed: () {
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  );

                                                  //Get.to(Project());
                                                  setState(() {
                                                    clickbutton_addfolder =
                                                        false;
                                                    Networking.getInstance()
                                                        .getAllFolder()
                                                        .then((folderData) {
                                                      setState(() {
                                                        folders = folderData;
                                                      });
                                                    });
                                                  });
                                                  //handle
                                                } else {
                                                  showDialog(
                                                      context: context,
                                                      builder: (context) =>
                                                          AlertDialog(
                                                            title:
                                                                Text("false"),
                                                          ));
                                                }
                                              },
                                              icon: Icon(Icons.done)),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox(),
                      //-- Create folder end
                      Expanded(
                        //height: deviceHeight * 0.4,
                        child: ListView.separated(
                            itemCount: (_tempListOfCities.isNotEmpty)
                                ? _tempListOfCities.length
                                : folders.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: InkWell(
                                  child: (_tempListOfCities.isNotEmpty)
                                      ? _showBottomSheetWithSearch(
                                          index, _tempListOfCities)
                                      : _showBottomSheetWithSearch(
                                          index, folders),
                                  onTap: () {
                                    this.setState(() {
                                      (_tempListOfCities.isNotEmpty)
                                          ? projectfolder =
                                              _tempListOfCities[index]
                                                  .description!
                                          : projectfolder =
                                              folders[index].description!;
                                    });
                                    Navigator.of(context).pop();
                                    print(projectfolder);
                                  },
                                ),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const Divider()),
                      )
                    ],
                  );
                },
              );
            },
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
  List<FolderModel> _buildSearchList(String userSearchTerm) {
    //final _searchList = List.filled(3, null, growable: false);
    List<FolderModel> _searchList = <FolderModel>[];
    for (int i = 0; i < folders.length; i++) {
      String? name = folders[i].description;
      if (name
          .toString()
          .toLowerCase()
          .contains(userSearchTerm.toLowerCase())) {
        _searchList.add(folders[i]);
      }
    }
    return _searchList;
  }
}
