import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holdr/pages/pin_page/controller/pin_controller.dart';
import 'package:holdr/pages/pin_page/forms/change_pin.dart';

class ChangePinModal extends GetWidget<PinController> {
  const ChangePinModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                topRight: Radius.circular(25.0))),
        padding: EdgeInsets.all(15),
        child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            children: [
              ChangePinForm(
                confirm: true,
                onSubmit: (val) {
                  controller.setPinString(val);
                  Get.back();
                },
              )
            ]));
  }
}
