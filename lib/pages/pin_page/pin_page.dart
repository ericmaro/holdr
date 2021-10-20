import 'package:card_app/pages/pin_page/controller/pin_controller.dart';
import 'package:card_app/pages/pin_page/widgets/num_pad.dart';
import 'package:card_app/shared/widgets/block_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PinPage extends GetWidget<PinController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Expanded(child: SizedBox()),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 60)
            .copyWith(bottom: 0),
        child: Text(
          'To secure your information you will need to setup your Master PIN',
          textAlign: TextAlign.center,
        ),
      ),
      Container(
        child: Numpad(
            onChange: (value) {
              controller.onChangePin(value);
            },
            length: 4),
      ),
      Container(
        padding: EdgeInsets.all(15),
        child: BlockButton(buttonText: 'Set PIN', onPressed: () => controller.setPin()),
      )
    ]));
  }
}
