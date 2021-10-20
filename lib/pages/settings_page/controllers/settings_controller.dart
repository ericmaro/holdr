import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  final settingOptions = [].obs;

  List settings = [
    ["Contactless Payment", Icons.wifi_tethering],
    ["Online Payments", Icons.mobile_friendly],
    ["ATM Withdrawals,", Icons.account_balance_wallet],
  ];

  flipSwitch(int index) {
    settingOptions[index] = !settingOptions[index];
  }

  @override
  void onInit() {
    settingOptions.value = [false, false, false];
    super.onInit();
  }
}
