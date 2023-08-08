import 'package:flutter/material.dart';

Future nuriDatePicker (BuildContext context){

  final now = DateTime.now();

  return showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(2023, 6),
      lastDate: DateTime(2025)
  );
}