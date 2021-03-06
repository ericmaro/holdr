import 'package:holdr/pages/settings_page/widgets/settings_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 5),
      margin: const EdgeInsets.only(top: 40),
      width: Get.width,
      decoration: BoxDecoration(
      color: Theme.of(context).canvasColor,
      borderRadius: BorderRadius.vertical(top: Radius.circular(35))),
      child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        'Settings',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
      const SizedBox(
        height: 20,
      ),
      SettingsList()
    ],
      ),
    );
  }
}
