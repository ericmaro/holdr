import 'package:card_app/pages/cards_page/controllers/card_controller.dart';
import 'package:card_app/shared/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TagFilters extends GetWidget<CardController> {

  TagFilters({required this.tagName});
  String tagName;

  @override
  Widget build(BuildContext context) {


    return TextButton(
      onPressed: () {
        controller.filterCards(tagName);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: tagColors[tagName],
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Text(tagName, style: TextStyle(color: Colors.white, fontSize: 17))),
    );
  }
}
