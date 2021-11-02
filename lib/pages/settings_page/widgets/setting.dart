import 'package:holdr/pages/settings_page/controllers/settings_controller.dart';
import 'package:holdr/pages/settings_page/model/setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingWidget extends GetWidget<SettingsController> {
  final int index;
  SettingWidget({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Setting setting = controller.settings[index];

    return Obx(() => Material(
          elevation: 5,
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          child: ListTile(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              leading: Icon(setting.icon, color: Colors.blue[800]),
              title: Text(
                setting.title,
                style: TextStyle(color: Colors.blue[800]),
              ),
              trailing: Switch(
                  value: controller.settingOptions[index],
                  onChanged: (val) => controller.flipSwitch(index))),
        ));
  }
}
