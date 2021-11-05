import 'package:flutter/material.dart';
import 'package:holdr/pages/settings_page/forms/change_pin.dart';

class ChangePinModal extends StatelessWidget {
  const ChangePinModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0))),
      padding: EdgeInsets.all(15),
      child: Wrap(
        children: [
          ChangePinForm()
        ]));
  }
}