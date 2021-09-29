import 'package:get/get.dart';

class AppController extends GetxController {
  final isBusy = false.obs;

  setIsBusy(bool value) {
    isBusy(value);
  }

  initApp() {
    setIsBusy(true);
    Future.delayed(Duration(seconds: 3), () {
      // initLocale();
      Get.offNamed('/cards');
    });
    setIsBusy(false);
  }

}
