import 'package:get/get.dart';
import 'package:starter/pages/cards_page/models/bank_card.dart';
import 'package:starter/shared/constants/constants.dart';

class CardController extends GetxController {
  final cards = [].obs;
  final visibleCards = [].obs;
  RxList filters = [].obs;
  late BankCard tempCard;
  String filter = '';
  bool edit = false;

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


  editCard(BankCard card) {
    int index = getCardPos(tempCard);
    cards[index] = card;
    refreshFilters();
    visibleCards.value = cards;
    edit = false;
  }

  getCardPos(BankCard card) {
    for (int i = 0; i < cards.length; i++) {
      if (card.cardNumber == cards[i].cardNumber) {
        return i;
      }
    }
  }

  deleteCard(BankCard card) {
    int index = getCardPos(card);
    cards.removeAt(index);
    refreshFilters();
  }

  filterCards(String str) {
    List filteredCards = [];

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
    visibleCards.value = filteredCards;
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

  populateCards() {
    addCard(BankCard(
        cardNumber: "1234 5678 9101 1123",
        cvv: 234,
        validDate: "12/24",
        tags: ['amazon', 'aws']));

    addCard(BankCard(
        cardNumber: "5432 1012 345 6789",
        cvv: 122,
        validDate: "2/28",
        tags: ['aliexpress', 'aws', 'netflix']));

    addCard(BankCard(
        cardNumber: "1111 2222 3333 4444",
        cvv: 313,
        validDate: '5/23',
        tags: ['max' 'h&m', 'ebay']));
  }

  @override
  void onInit() {
    populateCards();
    super.onInit();
  }

}
