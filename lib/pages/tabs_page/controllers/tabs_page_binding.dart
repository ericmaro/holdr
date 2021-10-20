import 'package:card_app/pages/tabs_page/controllers/tabs_page_controller.dart';
import 'package:get/get.dart';

class TabsPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabsPageController>(() => TabsPageController(), fenix: true);
  }
}
