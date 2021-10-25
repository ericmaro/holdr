import 'dart:async';

import 'package:basic_utils/basic_utils.dart';
import 'package:card_app/pages/cards_page/modals/card_modal.dart';
import 'package:card_app/pages/cards_page/models/bank_card.dart';
import 'package:card_app/pages/cards_page/services/card_service.dart';
import 'package:card_app/pages/pin_page/models/pin.dart';
import 'package:card_app/pages/pin_page/services/pin_service.dart';
import 'package:card_app/pages/settings_page/controllers/settings_controller.dart';
import 'package:card_app/shared/constants/constants.dart';
import 'package:card_app/shared/helpers/storage.dart';
import 'package:encrypt/encrypt.dart';
import 'package:flutter/material.dart' hide Key;
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter_fgbg/flutter_fgbg.dart';

class CardController extends GetxController {
  final _cardService = Get.find<CardService>();
  final _settingsController = Get.find<SettingsController>();
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
  late StreamSubscription<FGBGType> subscription;

  final cardTags = <String>[].obs;

  @override
  void onInit() {
    getCards();
    getPinDetails();
    _settingsController.getShowNumbersOnListStatus();
    ever(cards, (List<BankCard> c) => setVisibleCards(c));
    listenToScreenState();
    super.onInit();
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  listenToScreenState() {
    subscription = FGBGEvents.stream.listen((event) async {
      if (event == FGBGType.background) {
        bool? _state = await Storage.getBool("enableIdleLockStatus");
        if (_state != null && _state) {
          Get.offAllNamed('/enter-pin');
        }
      }
    });
  }

  RxBool get showNumbersOnListStatus =>
      _settingsController.showNumbersOnListStatus;

  void getPinDetails() async {
    if (pin.value != null) {}
    Pin? _pin = await _pinService.returnPin();

    if (_pin != null) {
      try {
        final iv = IV.fromLength(16);
        final key = Key.fromBase16(_pin.salt);
        final encrypter = Encrypter(AES(key));
        final decrypted = encrypter.decrypt16(_pin.pin, iv: iv);
        decriptedPin(decrypted);
      } catch (e) {
        print("catch error");
        print(e);
      }
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
