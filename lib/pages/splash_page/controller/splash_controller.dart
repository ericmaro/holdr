import 'package:card_app/pages/pin_page/models/pin.dart';
import 'package:card_app/pages/pin_page/services/pin_service.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final isBusy = false.obs;
  final _pinService = Get.find<PinService>();
  Rx<Pin?> get pin => _pinService.pin;

  setIsBusy(bool value) {
    isBusy(value);
  }

  @override
  void onInit() {
    initApp();

    super.onInit();
  }

  initApp() {
    setIsBusy(true);
    Future.delayed(Duration(seconds: 3), () async {
      // initLocale();
      await _pinService.getPin();
      if (pin.value != null) {
        Get.offNamed('/home');
      } else {
        Get.offNamed('/pin');
      }
    });
    setIsBusy(false);
  }
}
