import 'package:card_app/pages/cards_page/controllers/card_form_controller.dart';
import 'package:get/get.dart';

class CardFormBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CardFormController>(() => CardFormController(), fenix: true);
  }
}