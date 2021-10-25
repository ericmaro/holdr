import 'package:card_app/pages/pin_page/models/pin.dart';
import 'package:card_app/pages/pin_page/services/pin_service.dart';
import 'package:get/get.dart';
import 'package:encrypt/encrypt.dart';

class PinController extends GetxController {
  final currentPin = "".obs;
  Rx<Pin?> get pin => _pinService.pin;
  final _pinService = Get.find<PinService>();

  setCurrentPin(String value) {
    currentPin(value);
  }

  void onChangePin(String value) {
    setCurrentPin(value);
  }

  setPin() async {
    if (currentPin.value.length == 4) {
      final iv = IV.fromLength(16);
      final Key key = Key.fromSecureRandom(16);
      final encrypter = Encrypter(AES(key));
      final encrypted = encrypter.encrypt(currentPin.value, iv: iv);
      Pin _pin = Pin(pin: encrypted.base16, salt: key.base16);
      await _pinService.storePin(_pin);
      Get.toNamed('/home');
    }
  }

  checkPin() async {
    if (pin.value != null) {}
    Pin? _pin = await _pinService.returnPin();

    if (_pin != null) {
      try {
        final iv = IV.fromLength(16);
        final key = Key.fromBase16(_pin.salt);
        final encrypter = Encrypter(AES(key));
        final decrypted = encrypter.decrypt16(_pin.pin, iv: iv);
        if (decrypted == currentPin.value) {
          Get.toNamed('/home');
        } else {
          setCurrentPin("");
        }
      } catch (e) {
        print("catch error");
        print(e);
      }
    }
  }
}
