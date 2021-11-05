import 'package:holdr/pages/cards_page/controllers/card_controller.dart';
import 'package:holdr/pages/cards_page/widgets/card_list.dart';
import 'package:holdr/pages/cards_page/widgets/empty_cards.dart';
import 'package:holdr/pages/cards_page/widgets/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActiveCards extends GetWidget<CardController> {
  const ActiveCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
      margin: const EdgeInsets.only(top: 40),
      width: Get.width,
      decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(35))),
      child: Obx(() => ListView(
            physics: BouncingScrollPhysics(),
            children: [
              ListTile(
                trailing: MaterialButton(
                    padding: EdgeInsets.all(12),
                    shape: CircleBorder(),
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () => controller.getCards(),
                    child: Icon(
                      Icons.refresh,
                      color: Colors.white,
                    )),
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
              controller.cards.length > 0 ? VisibleCardList() : EmptyCards()
            ],
          )),
    );
  }
}
