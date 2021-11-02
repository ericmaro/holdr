import 'package:holdr/pages/cards_page/controllers/card_controller.dart';
import 'package:holdr/pages/cards_page/widgets/card_list.dart';
import 'package:holdr/pages/cards_page/widgets/filter_list.dart';
import 'package:holdr/shared/constants/constants.dart';
import 'package:holdr/shared/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/functions.dart';
import 'package:get/get.dart';

class ActiveCards extends GetWidget<CardController> {
  const ActiveCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 15, 0, 5),
        margin: const EdgeInsets.only(top: 5),
        width: Get.width,
        decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.vertical(top: Radius.circular(35))),
        child: Obx(() => ListView(
              children: [
                ListTile(
                  title: Text('Your Cards',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  subtitle: Text(
                      'You have ${controller.cards.length} ${controller.cards.length == 1 ? 'card' : 'cards'}'),
                ),
                controller.filters.length > 0
                    ? Container(
                        child: DisplayFilterList(main: true),
                      )
                    : Container(),
                VisibleCardList()
              ],
            )),
      ),
    );
  }
}
