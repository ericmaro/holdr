import 'package:holdr/pages/pin_page/models/pin.dart';
import 'package:holdr/pages/pin_page/services/pin_service.dart';
import 'package:holdr/pages/settings_page/forms/change_pin.dart';
import 'package:holdr/pages/settings_page/modals/change_pin_modal.dart';
import 'package:holdr/pages/settings_page/model/setting.dart';
import 'package:holdr/shared/helpers/storage.dart';
import 'package:encrypt/encrypt.dart';
import 'package:flutter/material.dart' hide Key;
import 'package:get/get.dart';
import 'package:holdr/theme/themeService.dart';

class SettingsController extends GetxController {
  final _pinService = Get.find<PinService>();
  Rx<String?> decriptedPin = Rx<String?>(null);
  Rx<Pin?> get pin => _pinService.pin;
  final settingOptions = [].obs;
  final showNumbersOnListStatus = false.obs;
  void setShowNumbersOnListStatus(bool state) {
    showNumbersOnListStatus(state);
  }

  final enableIdleLockStatus = false.obs;
  void setEnableIdleLockStatus(bool state) {
    enableIdleLockStatus(state);
  }

  final enablePinOnStartStatus = false.obs;
  void setEnablePinOnStartStatus(bool state) {
    enablePinOnStartStatus(state);
  }

  final isDarkMode = false.obs;
  void setColorSwitch(bool state) {
    isDarkMode(state);
  }

  List<Setting> settings = [
    Setting(
        title: "Hide Numbers on Card List",
        isSwitch: true,
        icon: Icons.wifi_tethering),
    Setting(
        title: "Enable Idle PIN lock",
        isSwitch: true,
        icon: Icons.wifi_tethering),
    Setting(
        title: "Enable PIN on start",
        isSwitch: true,
        icon: Icons.wifi_tethering),
    Setting(
        title: "Change Master PIN", isSwitch: true, icon: Icons.wifi_tethering),
  ];

  flipSwitch(int index) {
    settingOptions[index] = !settingOptions[index];
  }

  @override
  void onInit() {
    getShowNumbersOnListStatus();
    getEnableIdleLockStatus();
    getEnablePinOnStartStatus();
    getPinDetails();
    getThemeMode();
    super.onInit();
  }

  void getPinDetails() async {
    if (pin.value != null) {}
    Pin? _pin = await _pinService.returnPin();

    if (_pin != null) {
      try {
        final iv = IV.fromLength(16);
        final key = Key.fromBase16(_pin.salt);
        final encrypter = Encrypter(AES(key));
        final decrypted = encrypter.decrypt16(_pin.pin, iv: iv);
        decriptedPin(decrypted);
      } catch (e) {
        print("catch error");
        print(e);
      }
    }
  }

  showNumbersOnList(bool value) {
    Storage.setBool("showNumbersOnListStatus", value);
    getShowNumbersOnListStatus();
  }

  getShowNumbersOnListStatus() async {
    bool? _state = await Storage.getBool("showNumbersOnListStatus");
    if (_state != null) {
      setShowNumbersOnListStatus(_state);
    } else {
      setShowNumbersOnListStatus(false);
    }
  }

  enableIdleLock(bool value) {
    Storage.setBool("enableIdleLockStatus", value);
    getEnableIdleLockStatus();
  }

  getEnableIdleLockStatus() async {
    bool? _state = await Storage.getBool("enableIdleLockStatus");
    if (_state != null) {
      setEnableIdleLockStatus(_state);
    } else {
      setEnableIdleLockStatus(false);
    }
  }

  enablePinOnStart(bool value) {
    Storage.setBool("enablePinOnStartStatus", value);
    getEnablePinOnStartStatus();
  }

  getThemeMode() {
    setColorSwitch(Get.isDarkMode);
  }

  switchColorMode(bool value) {
    ThemeService().switchTheme();
    setColorSwitch(value);
  }

  getEnablePinOnStartStatus() async {
    bool? _state = await Storage.getBool("enablePinOnStartStatus");
    if (_state != null) {
      setEnablePinOnStartStatus(_state);
    } else {
      setEnablePinOnStartStatus(false);
    }
  }

  changePinAction() {
    Get.bottomSheet(ChangePinModal(), isScrollControlled: true);
  }
}
