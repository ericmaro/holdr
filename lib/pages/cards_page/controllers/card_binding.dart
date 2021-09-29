import 'package:get/get.dart';
import 'package:starter/pages/cards_page/controllers/card_controller.dart';

class CardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CardController>(() => CardController(), fenix: true);
  }
}