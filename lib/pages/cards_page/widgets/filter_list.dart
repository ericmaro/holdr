import 'package:card_app/pages/cards_page/controllers/card_controller.dart';
import 'package:card_app/pages/cards_page/widgets/edit_tags_item.dart';
import 'package:card_app/pages/cards_page/widgets/tag_filters.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DisplayFilterList extends GetWidget<CardController> {
  RxList tagList;
  bool main;
  DisplayFilterList({required this.tagList, required this.main});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        height: 50,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: tagList.length,
            itemBuilder: (contex, index) {
              return Container(
                  padding: EdgeInsets.only(left: index == 0 ? 10 : 0),
                  child: main
                      ? TagFilters(tagName: tagList[index])
                      : EditableTag(tagName: tagList[index]));
            }),
      );
    });
  }
}
