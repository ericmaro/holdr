import 'package:get/get.dart';

class TabsPageController extends GetxController {
  final tabIndex = 0.obs;

  setTabIndex(int val) {
    tabIndex(val);
  }
}