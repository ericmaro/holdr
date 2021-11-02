import 'package:holdr/pages/pin_page/controller/pin_controller.dart';
import 'package:holdr/pages/pin_page/services/pin_service.dart';
import 'package:holdr/pages/splash_page/controller/splash_controller.dart';
import 'package:get/get.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController(), fenix: true);
    Get.lazyPut<PinService>(() => PinService());
  }
}
