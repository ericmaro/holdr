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
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        leading: Icon(setting[1], color: Colors.blue[800]),
        title: Text(setting[0], style: TextStyle(color: Colors.blue[800]),),
        trailing: Obx(() {
                  return Switch(value: controller.settingOptions[index], onChanged: (val) => controller.flipSwitch(index));
                }
              )
      ),
    );

  }
}