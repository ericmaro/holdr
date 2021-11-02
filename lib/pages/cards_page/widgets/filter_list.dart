import 'package:holdr/pages/cards_page/controllers/card_controller.dart';
import 'package:holdr/pages/cards_page/widgets/edit_tags_item.dart';
import 'package:holdr/pages/cards_page/widgets/tag_filters.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DisplayFilterList extends GetWidget<CardController> {
  bool main;
  DisplayFilterList({required this.main});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        height: 50,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: controller.filters.length,
            itemBuilder: (contex, index) {
              return Container(
                  padding: EdgeInsets.only(left: index == 0 ? 10 : 0),
                  child: main
                      ? TagFilters(tagName: controller.filters[index])
                      : EditableTag(tagName: controller.filters[index]));
            }),
      );
    });
  }
}
