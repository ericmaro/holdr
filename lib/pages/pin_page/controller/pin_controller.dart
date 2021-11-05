import 'package:holdr/pages/pin_page/models/pin.dart';
import 'package:holdr/pages/pin_page/services/pin_service.dart';
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

  setPinString(String value) async {
    if (value.length == 4) {
      final iv = IV.fromLength(16);
      final Key key = Key.fromSecureRandom(16);
      final encrypter = Encrypter(AES(key));
      final encrypted = encrypter.encrypt(value, iv: iv);
      Pin _pin = Pin(pin: encrypted.base16, salt: key.base16);
      await _pinService.storePin(_pin);
      await _pinService.getPin();
    }
  }

  checkPin(String value) async {
    Pin? _pin = await _pinService.returnPin();

    if (_pin != null) {
      try {
        final iv = IV.fromLength(16);
        final key = Key.fromBase16(_pin.salt);
        final encrypter = Encrypter(AES(key));
        final decrypted = encrypter.decrypt16(_pin.pin, iv: iv);
        if (decrypted == value) {
          Get.offNamed('/home');
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
