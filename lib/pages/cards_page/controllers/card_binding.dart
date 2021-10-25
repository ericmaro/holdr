import 'package:card_app/pages/cards_page/controllers/card_controller.dart';
import 'package:card_app/pages/cards_page/services/card_service.dart';
import 'package:card_app/pages/pin_page/services/pin_service.dart';
import 'package:card_app/pages/settings_page/controllers/settings_controller.dart';
import 'package:get/get.dart';

class CardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CardController>(() => CardController(), fenix: true);
    Get.lazyPut<CardService>(() => CardService(), fenix: true);
    Get.lazyPut<SettingsController>(() => SettingsController(), fenix: true);
    Get.lazyPut<PinService>(() => PinService());
  }
}
