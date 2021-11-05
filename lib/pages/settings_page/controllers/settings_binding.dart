import 'package:holdr/pages/pin_page/controller/pin_controller.dart';
import 'package:holdr/pages/settings_page/controllers/settings_controller.dart';
import 'package:get/get.dart';

class SettingsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsController>(() => SettingsController(), fenix: true);
    Get.lazyPut<PinController>(() => PinController(), fenix: true);
  }
}
