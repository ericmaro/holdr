import 'package:card_app/shared/controllers/app_controllers/app_controller.dart';
import 'package:get/get.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppController>(() => AppController(), fenix: true);
  }
}
