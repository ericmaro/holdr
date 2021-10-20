import 'package:card_app/pages/settings_page/controllers/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Setting extends GetWidget<SettingsController> {
  Setting({ Key? key, required this.index}) : super(key: key);
  int index;

  @override
  Widget build(BuildContext context) {
    List setting = controller.settings[index];

    return Material(
      elevation: 5,
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(15)),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: 
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(setting[1], color: Colors.blue[800]),
            Text(setting[0], style: TextStyle(color: Colors.blue[800]),),
            Obx(() {
                return Switch(value: controller.settingOptions[index], onChanged: (val) => controller.flipSwitch(index));
              }
            )
          ],
        ),
      ),
    );
  }
}