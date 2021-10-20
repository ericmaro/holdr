import 'package:card_app/pages/pin_page/models/pin.dart';
import 'package:card_app/pages/pin_page/services/pin_service.dart';
import 'package:get/get.dart';
import 'package:string_encryption/string_encryption.dart';

class PinController extends GetxController {
  final currentPin = "".obs;
  final _pinService = Get.find<PinService>();

  final cryptor = StringEncryption();
  setCurrentPin(String value) {
    currentPin(value);
  }

  initApp() {
    ;
    Future.delayed(Duration(seconds: 3), () {
      // initLocale();
      Get.offNamed('/cards');
    });
  }

  void onChangePin(String value) {
    setCurrentPin(value);
  }

  setPin() async {
    final String? salt = await cryptor.generateSalt();
    if (currentPin.value.length == 4 && salt != null) {
      final String? key =
          await cryptor.generateKeyFromPassword(currentPin.value, salt);
      Pin _pin = Pin(pin: key!, salt: salt);
      await _pinService.storePin(_pin);
      Get.toNamed('/cards');
    }
  }
}
