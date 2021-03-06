import 'package:holdr/pages/cards_page/controllers/card_controller.dart';
import 'package:holdr/pages/cards_page/widgets/card_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/functions.dart';
import 'package:get/get.dart';

class VisibleCardList extends GetWidget<CardController> {
  const VisibleCardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          physics: NeverScrollableScrollPhysics(),
          itemCount: controller.visibleCards.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(top: index == 0 ? 0 : 10, bottom: 10),
              child: CardDisplay(
                  card: controller.visibleCards[index],
                  obsecure: !controller.showNumbersOnListStatus.value,
                  onPressed: () {
                    screenLock(
                      context: context,
                      correctString: controller.decriptedPin.value!,
                      confirmation: false,
                      didUnlocked: () {
                        Get.back();
                        controller.selectCard(
                            controller.visibleCards.toList()[index]);
                      },
                    );
                  }),
            );
          });
    });
  }
}
