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
    return Scaffold(
      appBar: AppBar(
        title: CustomAppBar(),
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
              child: DisplayFilterList(main: true),
            ),
            VisibleCardList()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.addNewCard();
        },
        child: Icon(Icons.add, color: Colors.grey, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
