import 'package:card_app/pages/cards_page/controllers/card_controller.dart';
import 'package:card_app/pages/cards_page/widgets/card_list.dart';
import 'package:card_app/pages/cards_page/widgets/filter_list.dart';
import 'package:card_app/shared/constants/constants.dart';
import 'package:card_app/shared/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/functions.dart';
import 'package:get/get.dart';

class ActiveCards extends GetWidget<CardController> {
  const ActiveCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 5),
        margin: const EdgeInsets.only(top: 5),
        width: Get.width,
        decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.vertical(top: Radius.circular(35))),
        child: ListView(
          children: [
            const Text(
              'Your Cards',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'You have ${controller.cards.length} ${controller.cards.length == 1 ? 'card' : 'cards'}',
            ),
            Container(
              child: DisplayFilterList(main: true),
            ),
            VisibleCardList()
          ],
        ),
      ),
    );
  }
}
