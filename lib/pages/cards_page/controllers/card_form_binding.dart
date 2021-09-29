import 'package:get/get.dart';
import 'package:starter/pages/cards_page/controllers/card_form_controller.dart';

class CardFormBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CardFormController>(() => CardFormController(), fenix: true);
  }
}