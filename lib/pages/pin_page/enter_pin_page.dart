import 'package:holdr/pages/pin_page/controller/pin_controller.dart';
import 'package:holdr/pages/pin_page/forms/change_pin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EnterPinPage extends GetWidget<PinController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: Get.width,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 60)
                  .copyWith(bottom: 0),
              child: Text(
                'Please Enter PIN to continue',
                textAlign: TextAlign.center,
              ),
            ),
            ChangePinForm(
                confirm: false,
                onSubmit: (val) {
                  controller.checkPin(val);
                })
          ]),
    ));
  }
}
