import 'package:holdr/pages/settings_page/controllers/settings_controller.dart';
import 'package:holdr/pages/settings_page/widgets/setting.dart';
import 'package:holdr/pages/settings_page/widgets/setting_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_lock/functions.dart';
import 'package:get/get.dart';
import 'package:holdr/theme/themeService.dart';

class SettingsList extends GetWidget<SettingsController> {
  const SettingsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView(
          shrinkWrap: true,
          children: [
            SettingCard(
                leading: Icon(Icons.password_outlined,
                    color: Theme.of(context).colorScheme.primaryVariant),
                title: "Show Numbers on Card List",
                trailing: CupertinoSwitch(
                    value: controller.showNumbersOnListStatus.value,
                    onChanged: (val) => {
                          if (!val)
                            {controller.showNumbersOnList(val)}
                          else
                            {
                              screenLock(
                                context: context,
                                correctString: controller.decriptedPin.value!,
                                confirmation: false,
                                didUnlocked: () {
                                  Get.back();
                                  controller.showNumbersOnList(val);
                                },
                              )
                            }
                        })),
            SettingCard(
                leading: Icon(Icons.phonelink_lock_outlined,
                    color: Theme.of(context).colorScheme.primaryVariant),
                title: "Enable Idle PIN lock",
                trailing: CupertinoSwitch(
                    value: controller.enableIdleLockStatus.value,
                    onChanged: (val) => controller.enableIdleLock(val))),
            SettingCard(
                leading: Icon(Icons.lock_outlined,
                    color: Theme.of(context).colorScheme.primaryVariant),
                title: "Enable PIN on start",
                trailing: CupertinoSwitch(
                    value: controller.enablePinOnStartStatus.value,
                    onChanged: (val) => controller.enablePinOnStart(val))),
            SettingCard(
                leading: Icon(Icons.color_lens,
                    color: Theme.of(context).colorScheme.primaryVariant),
                title: "Switch to Dark Mode",
                trailing: CupertinoSwitch(
                    value: ThemeService().getThemeState(),
                    onChanged: (val) => ThemeService().switchTheme())),
            SettingCard(
              onPress: () async {
                await controller.getPinDetails();
                screenLock(
                  context: context,
                  correctString: controller.decriptedPin.value!,
                  confirmation: false,
                  didUnlocked: () {
                    Get.back();
                    controller.changePinAction();
                  },
                );
              },
              leading: Icon(Icons.security_outlined,
                  color: Theme.of(context).colorScheme.primaryVariant),
              title: "Change Master PIN",
            ),
          ],
        ));
  }
}
