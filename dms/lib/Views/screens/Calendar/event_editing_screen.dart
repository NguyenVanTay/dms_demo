// ignore_for_file: prefer_const_constructors, unused_element, dead_code, unnecessary_import, must_call_super, unused_local_variable, body_might_complete_normally_nullable, prefer_const_declarations, curly_braces_in_flow_control_structures

import 'package:dms/models/event_calendar.dart';
import 'package:dms/controllers/providers/event_provider.dart';
import 'package:dms/utils/utilstTime.dart';
import 'package:dms/Views/widgets/Calendarwidgets/custtom_button.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';

import '../../../sources/app_colors.dart';

class EventEditingScreen extends StatefulWidget {
  // const EventEditingScreen({super.key});

  final Event? event;

  const EventEditingScreen({
    Key? key,
    this.event,
  }) : super(key: key);

  @override
  State<EventEditingScreen> createState() => _EventEditingScreenState();
}

class _EventEditingScreenState extends State<EventEditingScreen> {
  // define from and to date.
  late DateTime fromDate;
  late DateTime toDate;
  Color _color = Colors.blue;
  // define form key
  final _formKey = GlobalKey<FormState>();
  //define controller
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    //if event null => fromdate = today

    if (widget.event == null) {
      fromDate = DateTime.now();
      toDate = DateTime.now().add(Duration(hours: 2));
    } else {
      final event = widget.event!;
      titleController.text = event.title;
      descriptionController.text = event.description;
      fromDate = event.from;
      toDate = event.to;
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();

    super.dispose();
  }

  Future saveForm() async {
    final isValid = _formKey.currentState!.validate();
    if (!(_formKey.currentState?.validate() ?? true)) return;

    _formKey.currentState?.save();

    if (isValid) {
      final event = Event(
        title: titleController.text,
        description: descriptionController.text,
        from: fromDate,
        to: toDate,
        backgroundColor: _color,
        isAllDay: false,
      );
      final isEditing = widget.event != null;
      final provider = Provider.of<EventProvider>(context, listen: false);
      if (isEditing) {
        provider.editEvent(event, widget.event!);
        Navigator.of(context).pop();
      } else {
        provider.addEvent(event);
        Navigator.of(context).pop();
      }

      _resetForm();
    }
  }

  void _resetForm() {
    _formKey.currentState?.reset();
    titleController.text = "";
    descriptionController.text = "";
  }

  List<Widget> buildEditingActions() => [
        ElevatedButton.icon(
          onPressed: saveForm,
          icon: Icon(Icons.done),
          label: Text("SAVE"),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent),
        )
      ];

  Future<DateTime?> pickDateTime(
    DateTime initialDate, {
    required bool pickDate,
    DateTime? firstDate,
  }) async {
    if (pickDate) {
      final date = await showDatePicker(
          context: context,
          initialDate: initialDate,
          firstDate: firstDate ?? DateTime(2015, 8),
          lastDate: DateTime(2222));
      if (date == null) return null;
      final time =
          Duration(hours: initialDate.hour, minutes: initialDate.minute);
      return date.add(time);
    } else {
      final timeOfDay = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(initialDate),
      );
      if (timeOfDay == null) return null;
      final date =
          DateTime(initialDate.year, initialDate.month, initialDate.day);
      final time = Duration(
        hours: timeOfDay.hour,
        minutes: timeOfDay.minute,
      );
      return date.add(time);
    }
  }

  Future pickFromDateTime({required bool pickDate}) async {
    final date = await pickDateTime(fromDate, pickDate: pickDate);
    if (date == null) return;
    if (date.isAfter(toDate)) {
      toDate = DateTime(date.year, date.month, date.day);
    }
    setState(() {
      fromDate = date;
    });
  }

  Future pickToDateTime({required bool pickDate}) async {
    final date = await pickDateTime(toDate,
        pickDate: pickDate, firstDate: pickDate ? fromDate : null);
    if (date == null) return;

    setState(() {
      toDate = date;
    });
  }

  //Widget Title
  Widget buildTitle() => TextFormField(
        style: TextStyle(fontSize: 18),
        decoration: InputDecoration(
            border: UnderlineInputBorder(), hintText: "Add Title"),
        onFieldSubmitted: (_) => saveForm(),
        validator: (title) =>
            title != null && title.isEmpty ? 'Title cannot empty' : null,
        controller: titleController,
        minLines: 3,
        maxLines: 10,
        maxLength: 1000,
      );

  Widget buildColor() => Row(
        children: [
          Text(
            "Event Color: ",
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
            ),
          ),
          GestureDetector(
            onTap: _displayColorPicker,
            child: CircleAvatar(
              radius: 15,
              backgroundColor: _color,
            ),
          ),
          SizedBox(
            height: 12,
          ),
        ],
      );

  void _displayColorPicker() {
    Color color = _color;
    showDialog(
      context: context,
      useSafeArea: true,
      barrierColor: Colors.black26,
      builder: (_) => SimpleDialog(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          side: BorderSide(
            color: AppColors.bluishGrey,
            width: 2,
          ),
        ),
        contentPadding: EdgeInsets.all(20.0),
        children: [
          Text(
            "Event Color",
            style: TextStyle(
              color: AppColors.black,
              fontSize: 25.0,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20.0),
            height: 1.0,
            color: AppColors.bluishGrey,
          ),
          ColorPicker(
            displayThumbColor: true,
            enableAlpha: false,
            pickerColor: _color,
            onColorChanged: (c) {
              color = c;
            },
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 50.0, bottom: 30.0),
              child: CustomButton(
                title: "Select",
                onTap: () {
                  if (mounted)
                    setState(() {
                      _color = color;
                    });
                  Navigator.pop(context);
                  ;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  //Widget DrodownField
  Widget buildDropdownField({
    required String text,
    required VoidCallback onClicked,
  }) =>
      ListTile(
        title: Text(text),
        trailing: Icon(Icons.arrow_drop_down),
        onTap: onClicked,
      );
  //Widget Header (from or To)
  Widget buildHeader({required String header, required Widget child}) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            header,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          child,
        ],
      );
  //Widget From
  Widget buildFrom() => buildHeader(
        header: "FROM",
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: buildDropdownField(
                text: UtilsTime.toDate(fromDate),
                onClicked: () => pickFromDateTime(pickDate: true),
              ),
            ),
            Expanded(
              child: buildDropdownField(
                text: UtilsTime.toTime(fromDate),
                onClicked: () => pickFromDateTime(pickDate: false),
              ),
            )
          ],
        ),
      );
  //Widget To
  Widget buildTo() => buildHeader(
        header: "TO",
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: buildDropdownField(
                text: UtilsTime.toDate(toDate),
                onClicked: () => pickToDateTime(pickDate: true),
              ),
            ),
            Expanded(
              child: buildDropdownField(
                text: UtilsTime.toTime(toDate),
                onClicked: () => pickToDateTime(pickDate: false),
              ),
            )
          ],
        ),
      );
  //Widget Datetime picker.
  Widget buildDateTimePickers() => Column(
        children: [
          buildFrom(),
          buildTo(),
        ],
      );
  Widget buildDescription() => TextFormField(
        style: TextStyle(fontSize: 18),
        decoration: InputDecoration(
            border: UnderlineInputBorder(), hintText: "Add Description"),
        onFieldSubmitted: (_) => saveForm(),
        validator: (title) =>
            title != null && title.isEmpty ? 'Description cannot empty' : null,
        controller: descriptionController,
        minLines: 3,
        maxLines: 10,
        maxLength: 1000,
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Event"),
        centerTitle: true,
        leading: CloseButton(),
        actions: buildEditingActions(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Form(
          // form key need to put at least
          key: _formKey,
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            // handle Title
            buildTitle(),

            //handle DateTimePicker

            SizedBox(height: 12),
            buildDateTimePickers(),
            SizedBox(height: 24),
            buildDescription(),
            buildColor(),
          ]),
        ),
      ),
    );
  }
}
