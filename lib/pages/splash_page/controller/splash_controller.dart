import 'package:holdr/pages/pin_page/models/pin.dart';
import 'package:holdr/pages/pin_page/services/pin_service.dart';
import 'package:holdr/shared/helpers/storage.dart';
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
      bool? _state = await Storage.getBool("enablePinOnStartStatus");
      print(_state);
      // initLocale();
      await _pinService.getPin();
      if (pin.value != null) {
        if (_state != null && !_state) {
          Get.offNamed('/home');
        } else {
          Get.offNamed('/enter-pin');
        }
      } else {
        Get.offNamed('/pin');
      }
    });
    setIsBusy(false);
  }
}
