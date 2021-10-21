import 'package:basic_utils/basic_utils.dart';
import 'package:card_app/pages/cards_page/modals/card_modal.dart';
import 'package:card_app/pages/cards_page/models/bank_card.dart';
import 'package:card_app/pages/cards_page/services/card_service.dart';
import 'package:card_app/pages/pin_page/models/pin.dart';
import 'package:card_app/pages/pin_page/services/pin_service.dart';
import 'package:card_app/shared/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:string_encryption/string_encryption.dart';

class CardController extends GetxController {
  final _cardService = Get.find<CardService>();
  final _pinService = Get.find<PinService>();
  Rx<Pin?> get pin => _pinService.pin;
  Rx<String?> decriptedPin = Rx<String?>(null);
  RxList<BankCard> get cards => _cardService.cards;
  final visibleCards = <BankCard>[].obs;
  final filters = <String>[].obs;
  late BankCard tempCard;
  String filter = '';
  bool edit = false;
  final Rx<BankCard?> currentCard = Rx<BankCard?>(null);
  final cryptor = StringEncryption();

  final cardTags = <String>[].obs;

  @override
  void onInit() {
    getCards();
    getPinDetails();
    ever(cards, (List<BankCard> c) => setVisibleCards(c));

    super.onInit();
  }

  void getPinDetails() async {
    await _pinService.getPin();
    if (pin.value != null) {
      String? decrypted =
          await cryptor.decrypt(pin.value!.pin, pin.value!.salt);
      print("decrypted");
      print(decrypted);
    }
  }

  setVisibleCards(List<BankCard> c) {
    visibleCards(c);
    refreshFilters();
  }

  setCurrentCard(BankCard value) {
    currentCard(value);
  }

  addCard(BankCard card) {
    for (int i = 0; i < cards.length; i++) {
      if (card.cardNumber == cards[i].cardNumber) {
        return;
      }
    }
    cards.add(card);
    refreshFilters();
    visibleCards.value = cards;
  }

  getCardPos(BankCard card) {
    for (int i = 0; i < cards.length; i++) {
      if (card.cardNumber == cards[i].cardNumber) {
        return i;
      }
    }
  }

  deleteCard(BankCard card) {
    _cardService.delete(card);
    Get.back();
  }

  filterCards(String str) {
    List<BankCard> filteredCards = [];

    if (filter == str) {
      filteredCards = cards;
      filter = '';
    } else {
      for (int i = 0; i < cards.length; i++) {
        if (cards[i].tags.contains(str)) {
          filteredCards.add(cards[i]);
        }
      }
      filter = str;
    }
    setVisibleCards(filteredCards);
  }

  refreshFilters() {
    filters.value = [];
    for (int j = 0; j < cards.length; j++) {
      for (int i = 0; i < cards[j].tags.length; i++) {
        if (!filters.contains(cards[j].tags[i])) {
          addtagColor(cards[j].tags[i]);
          filters.add(cards[j].tags[i]);
        }
      }
    }
  }

  getCards() {
    _cardService.getAll();
  }

  selectCard(visibleCard) {
    setCurrentCard(visibleCard);
    Get.bottomSheet(CardModal(), isScrollControlled: true);
  }

  addNewCard() {
    selectCard(BankCard(
        color: Colors.deepOrange,
        cardNumber: "0000 0000 0000 0000",
        cardHolder: "Your Name",
        cvv: "222",
        validDate: "2/22",
        tags: []));
  }

  editCard(BankCard data) {
    String sanitize = data.cardNumber!.length > 0
        ? data.cardNumber!.replaceAll(' ', '')
        : "0";
    var f = NumberFormat('0000000000000000');
    String? wSpaces = StringUtils.addCharAtPosition(
        f.format(int.parse(sanitize)), " ", 4,
        repeat: true);
    BankCard _card = currentCard.value!.copyWith(
      cardNumber: wSpaces,
      cardHolder: data.cardHolder,
      cvv: data.cvv,
      validDate: data.validDate,
    );
    setCurrentCard(_card);
  }

  void save() {
    if (currentCard.value!.id != null) {
      _cardService.update(currentCard.value!);
    } else {
      _cardService.insert(currentCard.value!);
    }
  }

  selectColor(Color color) {
    BankCard _card = currentCard.value!.copyWith(color: color);
    setCurrentCard(_card);
  }

  void addTag(List<String> value) {
    // print(value);
    // String newString = currentCard.value!.tags
    //     .toSet()
    //     .difference(value.toSet())
    //     .toList()
    //     .first;
    // _tagService.save(newString);
    currentCard.value!.tags = value;
    currentCard..refresh();
  }

  void deleteTag(int index) {
    print(index);
    List<String> _tags = currentCard.value!.tags;
    // _tagService.remove(_tags[index]);
    _tags.removeAt(index);
    BankCard _card = currentCard.value!.copyWith(tags: _tags);
    setCurrentCard(_card);
  }
}
