import 'package:card_app/pages/cards_page/controllers/card_controller.dart';
import 'package:get/get.dart';

class CardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CardController>(() => CardController(), fenix: true);
  }
}