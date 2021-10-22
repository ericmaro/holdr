import 'package:card_app/pages/cards_page/controllers/card_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCardButton extends GetWidget<CardController> {
  const AddCardButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.blue[800],
      onPressed: () {
        controller.addNewCard();
      },
      child: Icon(Icons.add, color: Colors.white, size: 30),
    );
  }
}
