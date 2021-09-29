import 'package:card_app/pages/cards_page/controllers/card_form_controller.dart';
import 'package:card_app/pages/cards_page/widgets/card_forms.dart';
import 'package:card_app/pages/cards_page/widgets/dynamic_card_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardBottomSheet extends GetWidget<CardFormController> {
  const CardBottomSheet({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Card Details', style: TextStyle(fontSize: 18),),
                IconButton(onPressed: () {
                  Get.delete<CardFormController>();
                  Get.back();}, icon: Icon(Icons.cancel_sharp))
            ],
          ),

          DynamicCardDisplay(),
    
          CardForm()
        ],
      ),
    );
  }
}