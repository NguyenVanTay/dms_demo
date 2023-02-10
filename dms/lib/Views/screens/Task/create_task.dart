// ignore_for_file: avoid_unnecessary_containers, curly_braces_in_flow_control_structures, unused_field, prefer_final_fields, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, must_be_immutable

import 'package:dms/models/task_model.dart';
import 'package:dms/models/typemodel.dart';
import 'package:dms/models/usermodel.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../../../constants.dart';
import '../../../helpers/create_options.dart';
import '../../../helpers/multiple_search_selection.dart';
import '../../../models/util_storage.dart';
import '../../../network/network_request.dart';
import '../../../sources/app_colors.dart';

import '../../widgets/Project/constants.dart';
import '../../widgets/Project/date_time_selector.dart';

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
  // TaskModel task;

  const CreateTask({super.key});

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  List<TaskModel> tasks = UtilStorage.tasks;
  List<UserModel> users = UtilStorage.users;

  //List<TypeModel> types = UtilStorage.types;

  //late List<UserModel> users = <UserModel>[];

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

  late List<MultiSelectItem<UserModel>> _items;

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

    _items = users
        .map((user) =>
            MultiSelectItem<UserModel>(user, user.description.toString()))
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
                            // controller: _projectnamecontroller,
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
                          "Previous Task",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    child: MultiSelectBottomSheetField<UserModel>(
                      key: _multiSelectKey,
                      initialChildSize: 0.7,
                      maxChildSize: 0.95,
                      title: Text("Animals"),
                      buttonText: Text("Favorite Animals"),
                      items: _items,
                      searchable: true,
                      onConfirm: (values) {
                        setState(() {
                          users = values;
                        });
                        _multiSelectKey.currentState?.validate();
                      },
                      chipDisplay: MultiSelectChipDisplay(
                        onTap: (item) {
                          setState(() {
                            users.remove(item);
                          });
                          _multiSelectKey.currentState?.validate();
                        },
                      ),
                    ),
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
                            borderRadius: BorderRadius.circular(10),
                          ),

                          // adding borders around the widget

                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, width: 0.5),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          filled: true,
                          fillColor: Colors.grey[50],
                        ),
                        dropdownColor: Colors.white,
                        value: prev,
                        onChanged: (String? newValue) {
                          setState(() {
                            prev = newValue!;
                          });
                        },
                        items: dropdownPreviousTask),
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
                            // controller: _projectnamecontroller,
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

void _showModal(context) {
  showModalBottomSheet<void>(
      //isScrollControlled: true,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
      ),
      context: context,
      builder: (BuildContext context) {
        return Scaffold(
          body: SingleChildScrollView(
            child: MultipleSearchSelection<Country>.creatable(
              title: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SizedBox(
                    height: 40,
                    width: 100,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Save",
                      ),
                    ),
                  )),
              // onItemAdded: (c) {},
              // showClearSearchFieldButton: true,
              showShowedItemsScrollbar: true,
              createOptions: CreateOptions(
                createItem: (text) {
                  return Country(name: text, iso: text);
                },
                onItemCreated: (c) => print('Country ${c.name} created'),
                createItemBuilder: (text) => Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Create "$text"'),
                  ),
                ),
                pickCreatedItem: false,
              ),
              items: countries, // List<Country>
              fieldToCheck: (c) {
                return c.name;
              },
              itemBuilder: (country, index) {
                return Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 12,
                      ),
                      child: Text(country.name),
                    ),
                  ),
                );
              },
              pickedItemBuilder: (country) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey[400]!),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(country.name),
                  ),
                );
              },
              sortShowedItems: true,

              sortPickedItems: true,
              selectAllButton: Padding(
                padding: const EdgeInsets.all(12.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Select All',
                      style: kStyleDefault,
                    ),
                  ),
                ),
              ),
              showItemsButton: Padding(
                padding: const EdgeInsets.all(12.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.red),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Show Item',
                      style: kStyleDefault,
                    ),
                  ),
                ),
              ),
              // clearAllButton: Padding(
              //   padding: const EdgeInsets.all(12.0),
              //   child: DecoratedBox(
              //     decoration: BoxDecoration(
              //       border: Border.all(color: Colors.red),
              //     ),
              //     child: Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: Text(
              //         'Clear All',
              //         style: kStyleDefault,
              //       ),
              //     ),
              //   ),
              // ),
              caseSensitiveSearch: false,
              fuzzySearch: FuzzySearch.none,
              itemsVisibility: ShowedItemsVisibility.alwaysOn,
              showSelectAllButton: true,

              // maximumShowItemsHeight: 200,
            ),
          ), // This trailing comma makes auto-formatting nicer for build methods.
        );
      });
}
