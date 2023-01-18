// ignore_for_file: avoid_unnecessary_containers, curly_braces_in_flow_control_structures, unused_field, prefer_final_fields, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:face_pile/face_pile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../sources/app_colors.dart';
import '../../widgets/Project/constants.dart';
import '../../widgets/Project/date_time_selector.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

SampleItem? selectedMenu;

List<DropdownMenuItem<String>> get dropdownStatusItems {
  List<DropdownMenuItem<String>> statusItem = [
    DropdownMenuItem(child: Text("Initial"), value: "Initial"),
    DropdownMenuItem(child: Text("Canada"), value: "Canada"),
    DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
    DropdownMenuItem(child: Text("England"), value: "England"),
  ];
  return statusItem;
}

List<DropdownMenuItem<String>> get dropdownTypeItems {
  List<DropdownMenuItem<String>> typeItems = [
    DropdownMenuItem(child: Text("General"), value: "General"),
    DropdownMenuItem(child: Text("Canada"), value: "Canada"),
    DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
    DropdownMenuItem(child: Text("England"), value: "England"),
  ];
  return typeItems;
}

class CreateTask extends StatefulWidget {
  const CreateTask({super.key});

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  late DateTime _startDate;
  late DateTime _endDate;

  DateTime? _startTime;

  DateTime? _endTime;

  String _title = "";

  String _description = "";

  Color _color = Colors.blue;

  late FocusNode _titleNode;

  late FocusNode _descriptionNode;

  late FocusNode _dateNode;

  final GlobalKey<FormState> _form = GlobalKey();

  late TextEditingController _startDateController;
  late TextEditingController _startTimeController;
  late TextEditingController _endTimeController;
  late TextEditingController _endDateController;

  String status = 'Initial';
  String type = 'General';

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
                          child: Text(
                            "Project Moonsoon",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14.0,
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
                          "Performers",
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
                              radius: 20,
                              space: 60,
                              images: [
                                NetworkImage("https://i.pravatar.cc/300?img=1"),
                                NetworkImage("https://i.pravatar.cc/300?img=2"),
                                NetworkImage("https://i.pravatar.cc/300?img=3"),
                                NetworkImage("https://i.pravatar.cc/300?img=4"),
                                NetworkImage("https://i.pravatar.cc/300?img=5"),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 18),
                              child: FloatingActionButton.small(
                                backgroundColor: Colors.grey,
                                onPressed: () {},
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
                          "Previous Task",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: DropdownButtonFormField(
                        hint: Text('None'),
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
                          "Team",
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
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            "Project Moonsoon",
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
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                            "Project Moonsoon",
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
                      onPressed: () {},
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
