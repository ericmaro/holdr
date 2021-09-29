import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starter/pages/cards_page/controllers/card_controller.dart';
import 'package:starter/pages/cards_page/widgets/card_display.dart';
import 'package:starter/shared/constants/constants.dart';

class VisibleCardList extends GetWidget<CardController> {
  const VisibleCardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Obx(() {
          return ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.visibleCards.length,
              itemBuilder: (context, index) {
                return TextButton(
                  onPressed: () {
                     controller.tempCard = controller.visibleCards[index];
                    controller.edit = true;
                    editCard(context);
                  }, 
                  child: CardDisplay(card: controller.visibleCards[index])
                  );
              });
        })
      ],
    );
  }
}
