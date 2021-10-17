import 'dart:math';

import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const textColor = Color(0xFF535353);
const textLightColor = Color(0xFFACACAC);
const defaultPaddin = 20.0;

const InputDecoration blueform = InputDecoration(
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.blue),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.blue),
    ),
    border: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.blue),
    ),
    counterText: "");

List<MaterialColor> colors = [
  Colors.blue,
  Colors.pink,
  Colors.amber,
  Colors.red,
  Colors.purple,
  Colors.brown
];

var tagColors = {
  "netflix": Colors.red,
  "amazon": Colors.blue,
  "aliexpress": Colors.pink,
  "aws": Colors.purple
};

addtagColor(String tag) {
  if (!tagColors.containsKey(tag)) {
    tagColors[tag] = colors[Random().nextInt(colors.length)];
  }
}

String hideCardNumber(String num) {
  String sanitize = num.replaceAll(' ', '');
  String? s = StringUtils.hidePartial(sanitize, end: 12);
  String? wSpaces = StringUtils.addCharAtPosition(s!, " ", 4, repeat: true);
  return wSpaces;
}

dateValidator(String str) {
  List newDate = str.split(" ");
  int month = int.parse(newDate[0]);
  int year = int.parse(newDate[1]);

  int currentYear = int.parse(DateFormat('y').format(DateTime.now()));
  currentYear = currentYear % 100;

  if ((month > 12 || month < 1) || (year < currentYear || year > 2050)) {
    return true;
  }

  return false;
}
