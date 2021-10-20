import 'package:card_app/pages/pin_page/controller/pin_controller.dart';
import 'package:card_app/pages/pin_page/services/pin_service.dart';
import 'package:get/get.dart';

class PinBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PinController>(() => PinController(), fenix: true);
    Get.lazyPut<PinService>(() => PinService());
  }
}
