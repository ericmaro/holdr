import 'package:card_app/pages/cards_page/controllers/card_controller.dart';
import 'package:card_app/pages/cards_page/widgets/bottom_sheet.dart';
import 'package:card_app/pages/cards_page/widgets/card_list.dart';
import 'package:card_app/pages/cards_page/widgets/filter_list.dart';
import 'package:card_app/shared/constants/constants.dart';
import 'package:card_app/shared/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActiveCards extends StatelessWidget {
  const ActiveCards({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  CardController _cardController = Get.put(CardController());


    return Scaffold(
      appBar: AppBar(
        title: CustomAppBar(),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: DisplayFilterList(tagList: _cardController.filters, main: true),
            ),
            VisibleCardList()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {editCard(context);},
        child: Icon(Icons.add, color: Colors.grey, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}