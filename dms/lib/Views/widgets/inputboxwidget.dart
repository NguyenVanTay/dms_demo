// ignore_for_file: library_private_types_in_public_api, must_be_immutable, prefer_typing_uninitialized_variables

import 'package:dms/Views/widgets/Project/constants.dart';
import 'package:flutter/material.dart';

class MyCustomInputBox extends StatefulWidget {
  String label;
  String inputHint;
  String text;
  var maxline;
  String waringText;
  final TextEditingController? controller;

  MyCustomInputBox(
      {super.key,
      required this.label,
      required this.inputHint,
      required this.maxline,
      required this.text,
      required this.waringText,
      this.controller});
  @override
  _MyCustomInputBoxState createState() => _MyCustomInputBoxState();
}

class _MyCustomInputBoxState extends State<MyCustomInputBox> {
  bool isSubmitted = false;

  //final checkBoxIcon = 'assets/checkbox.svg';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.only(top: 20, left: 10, bottom: 10),
            child: Text(
              widget.label,
              style: const TextStyle(
                  fontFamily: 'Product Sans',
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        //
        Container(
          // padding: const EdgeInsets.fromLTRB(16, 8, 16, 15),
          margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
          child: TextFormField(
              //obscureText: widget.label == 'Password' ? true : false,
              // this can be changed based on usage -
              // such as - onChanged or onFieldSubmitd
              maxLines: widget.maxline,
              controller: widget.controller,
              validator: (value) {
                if (value == null || value == "") {
                  return widget.waringText;
                }
                return null;
              },
              onSaved: (value) => widget.text = value!,
              onChanged: (value) {
                setState(() {
                  isSubmitted = true;
                });
              },
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                //fontWeight: FontWeight.bold
              ),
              decoration: AppConstants.inputDecorationInPut

              // InputDecoration(
              //   filled: true,
              //   //fillColor: const Color.fromRGBO(243, 243, 243, 1),
              //   fillColor: Colors.white,
              //   hintText: widget.inputHint,
              //   hintStyle: TextStyle(
              //       fontSize: 16,
              //       color: Colors.grey[350],
              //       fontWeight: FontWeight.w600),
              //   contentPadding:
              //       const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              //   focusColor: const Color(0xff0962ff),
              //   focusedBorder: OutlineInputBorder(
              //     borderRadius: BorderRadius.circular(10),
              //     borderSide: const BorderSide(color: Color(0xff0962ff)),
              //   ),
              //   enabledBorder: OutlineInputBorder(
              //     borderRadius: BorderRadius.circular(10),
              //     borderSide: const BorderSide(
              //       color: Colors.grey,
              //     ),
              //   ),
              // ),
              ),
        ),
        //
      ],
    );
  }
}
