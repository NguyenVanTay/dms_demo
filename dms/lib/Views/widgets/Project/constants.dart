import 'package:flutter/material.dart';

import '../../../sources/app_colors.dart';

class AppConstants {
  AppConstants._();

  static OutlineInputBorder inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(7),
    borderSide: const BorderSide(
      width: 2,
      color: AppColors.lightNavyBlue,
    ),
  );

  static InputDecoration get inputDecoration => InputDecoration(
        border: inputBorder,
        disabledBorder: inputBorder,
        errorBorder: inputBorder.copyWith(
          borderSide: const BorderSide(
            width: 0.5,
            color: AppColors.black,
          ),
        ),
        enabledBorder: inputBorder,
        focusedBorder: inputBorder,
        focusedErrorBorder: inputBorder,
        hintText: "Event Title",
        hintStyle: const TextStyle(
          color: AppColors.black,
          fontSize: 17,
        ),
        labelStyle: const TextStyle(
          color: AppColors.black,
          fontSize: 17,
        ),
        helperStyle: const TextStyle(
          color: AppColors.black,
          fontSize: 17,
        ),
        errorStyle: const TextStyle(
          color: AppColors.red,
          fontSize: 12,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        prefixIcon: const Icon(Icons.calendar_month_outlined),
      );

  static InputDecoration get inputDecorationTime => InputDecoration(
        border: inputBorder,
        disabledBorder: inputBorder,
        errorBorder: inputBorder.copyWith(
          borderSide: const BorderSide(
            width: 0.5,
            color: AppColors.black,
          ),
        ),
        enabledBorder: inputBorder,
        focusedBorder: inputBorder,
        focusedErrorBorder: inputBorder,
        hintText: "Event Title",
        hintStyle: const TextStyle(
          color: AppColors.black,
          fontSize: 17,
        ),
        labelStyle: const TextStyle(
          color: AppColors.black,
          fontSize: 17,
        ),
        helperStyle: const TextStyle(
          color: AppColors.black,
          fontSize: 17,
        ),
        errorStyle: const TextStyle(
          color: AppColors.red,
          fontSize: 12,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        prefixIcon: const Icon(Icons.timer),
      );
  static InputDecoration get inputDecorationInPut => InputDecoration(
        border: inputBorder,
        disabledBorder: inputBorder,
        errorBorder: inputBorder.copyWith(
          borderSide: const BorderSide(
            width: 0.5,
            color: AppColors.black,
          ),
        ),

        focusedErrorBorder: inputBorder,

        labelStyle: const TextStyle(
          color: AppColors.black,
          fontSize: 17,
        ),
        helperStyle: const TextStyle(
          color: AppColors.black,
          fontSize: 17,
        ),
        errorStyle: const TextStyle(
          color: AppColors.red,
          fontSize: 12,
        ),

        filled: true,
        //fillColor: const Color.fromRGBO(243, 243, 243, 1),
        fillColor: Colors.white,
        // hintText: "widget.inputHint",
        hintStyle: TextStyle(
            fontSize: 16, color: Colors.grey[350], fontWeight: FontWeight.w600),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        focusColor: const Color(0x00000000),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xff0962ff)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
        ),
      );
}
