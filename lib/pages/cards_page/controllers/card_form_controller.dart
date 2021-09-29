import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:starter/pages/cards_page/controllers/card_controller.dart';

class CardFormController extends GetxController {
  CardController _cardController = Get.put(CardController());

  Rx<TextEditingController> cardNum = TextEditingController().obs;
  Rx<TextEditingController> cvvNum = TextEditingController().obs;
  Rx<TextEditingController> dateNum = TextEditingController().obs;
  RxList cardTags = [].obs;

  setUpForm() {
    cardNum.value.text = _cardController.tempCard.cardNumber;
    cvvNum.value.text = _cardController.tempCard.cvv.toString();
    dateNum.value.text = _cardController.tempCard.validDate;
    cardTags.value = _cardController.tempCard.tags;
  }

  emptyForm() {
    cardNum.value.text = "0000 0000 0000 0000";
    cvvNum.value.text = "";
    dateNum.value.text = "9/29";
    cardTags.value = ["sample"];
  }

  void changeCardNum(String val) {
    cardNum.value.text =val;
  }

  @override
  void onInit() {
    if (_cardController.edit) {
      setUpForm();
    }
    else {
      emptyForm();
    }
    super.onInit();
  }

  @override
  void onClose() {
    _cardController.edit = false;
    super.onClose();
  }
}
