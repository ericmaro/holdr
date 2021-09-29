import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:starter/pages/cards_page/widgets/bottom_sheet.dart';

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

editCard(context) {
  showModalBottomSheet(
      isDismissible: false,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
      isScrollControlled: true,
      context: context,
      builder: (context) => Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: CardBottomSheet(),
          ));
}

List<MaterialColor> colors = [Colors.blue, Colors.pink, Colors.amber, Colors.red, Colors.purple, Colors.brown];

var tagColors = {
  "netflix" : Colors.red,
  "amazon" : Colors.blue,
  "aliexpress" : Colors.pink,
  "aws" : Colors.purple
};

addtagColor(String tag) {
  if(!tagColors.containsKey(tag)){
    tagColors[tag] = colors[Random().nextInt(colors.length)];
  }
}

hideCardNumber(String num) {
  List hiddenNumber= ['****', '****', '****'];
  hiddenNumber.add(num.split(" ")[3].toString());
  return hiddenNumber;
}

dateValidator(String str) {
  List newDate = str.split("/");
  int month = int.parse(newDate[0]);
  int year = int.parse(newDate[1]);
  int currentYear = int.parse(DateFormat('y').format(DateTime.now()));
  currentYear = currentYear%100;

  if((month>12 || month<1) || (year<currentYear)) {
    return true;
  }

  return false;
}
