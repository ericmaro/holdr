import 'package:card_app/pages/cards_page/controllers/card_controller.dart';
import 'package:card_app/pages/cards_page/widgets/card_display.dart';
import 'package:card_app/pages/cards_page/widgets/card_forms.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardModal extends GetWidget<CardController> {
  const CardModal();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0))),
      child: ListView(shrinkWrap: true, children: [
        Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ).copyWith(top: 15),
            margin: EdgeInsets.only(bottom: 15),
            child: Obx(() => CardDisplay(
                  card: controller.currentCard.value!,
                  obsecure: false,
                ))),
        CardForm(),
      ]),
    );
  }
}
