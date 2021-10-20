import 'package:card_app/pages/settings_page/controllers/settings_controller.dart';
import 'package:card_app/pages/settings_page/widgets/setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsList extends GetWidget<SettingsController> {
  const SettingsList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: controller.settings.length,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: Setting(index: index));
      }
    );
  }
}