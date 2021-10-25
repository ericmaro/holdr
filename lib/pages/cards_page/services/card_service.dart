import 'package:card_app/pages/cards_page/models/bank_card.dart';
import 'package:card_app/shared/db/db.dart';
import 'package:get/get.dart';
import 'package:sembast/sembast.dart';
import 'package:uuid/uuid.dart';

class CardService extends GetxService {
  //Database Initialization
  static const String folderName = "CardsData";
  final _folder = intMapStoreFactory.store(folderName);
  Future<Database> get _db async => await AppDatabase.instance.database;
  var uuid = new Uuid();

  final cards = <BankCard>[].obs;

  setCards(List<BankCard> value) {
    cards(value);
  }

  Future insert(BankCard data) async {
    if (data.id == null) data.id = uuid.v4();
    await _folder.add(await _db, data.toMap());
    getAll();
  }

  Future update(BankCard data) async {
    final finder = Finder(filter: Filter.equals('id', data.id));
    await _folder.update(await _db, data.toMap(), finder: finder);
    getAll();
  }

  Future delete(BankCard data) async {
    final finder = Finder(filter: Filter.equals('id', data.id));
    await _folder.delete(await _db, finder: finder);
    getAll();
  }

  void getAll() async {
    final recordSnapshot = await _folder.find(await _db);
    List<BankCard> _cards = recordSnapshot.map((snapshot) {
      final _c = BankCard.fromMap(snapshot.value);
      return _c;
    }).toList();
    setCards(_cards);
  }
}
