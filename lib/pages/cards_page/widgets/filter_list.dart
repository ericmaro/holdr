import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter/pages/cards_page/controllers/card_controller.dart';
import 'package:starter/pages/cards_page/widgets/edit_tags_item.dart';
import 'package:starter/pages/cards_page/widgets/tag_filters.dart';

class DisplayFilterList extends GetWidget<CardController> {
  RxList tagList;
  bool main;
  DisplayFilterList({required this.tagList, required this.main});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        width: MediaQuery.of(context).size.height,
        height: 50,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: tagList.length,
            itemBuilder: (contex, index) {
              return Container(
                margin: EdgeInsets.only(right: 2),
                child: main? TagFilters(tagName: tagList[index]): EditableTag(tagName: tagList[index])
                );
            }),
      );
    });
  }
}
