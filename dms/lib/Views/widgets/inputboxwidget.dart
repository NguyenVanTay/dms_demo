import 'package:flutter/material.dart';

class MyCustomInputBox extends StatefulWidget {
  String label;
  String inputHint;
  final TextEditingController? controller;

  MyCustomInputBox(
      {required this.label, required this.inputHint, this.controller});
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
          child: Padding(
            padding: const EdgeInsets.only(left: 14.0, bottom: 0),
            child: Text(
              widget.label,
              style: TextStyle(
                  fontFamily: 'Product Sans',
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        //
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 15),
          child: TextFormField(
            //obscureText: widget.label == 'Password' ? true : false,
            // this can be changed based on usage -
            // such as - onChanged or onFieldSubmitd
            controller: widget.controller,
            onChanged: (value) {
              setState(() {
                isSubmitted = true;
              });
            },
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              //fontWeight: FontWeight.bold
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Color.fromRGBO(243, 243, 243, 1),
              hintText: widget.inputHint,
              hintStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[350],
                  fontWeight: FontWeight.w600),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              focusColor: Color(0xff0962ff),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color(0xff0962ff)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        //
      ],
    );
  }
}
