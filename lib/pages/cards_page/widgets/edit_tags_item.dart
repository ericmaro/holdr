import 'package:card_app/pages/cards_page/controllers/card_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditableTag extends GetWidget<CardFormController> {

  EditableTag({required this.tagName});
  String tagName;

  @override
  Widget build(BuildContext context) {


    return TextButton(
      onPressed: () {
        controller.cardTags.remove(tagName);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        margin: EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Row(
          children: [
            Text(tagName, style: TextStyle(color: Colors.black, fontSize: 12)),
            SizedBox(width: 5,),
            Icon(Icons.cancel, size: 20, color: Colors.grey[900])
          ],
        )),
    );
  }
}
