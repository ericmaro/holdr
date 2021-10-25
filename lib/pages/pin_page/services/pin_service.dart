import 'package:card_app/pages/cards_page/models/bank_card.dart';
import 'package:card_app/pages/cards_page/widgets/card_display.dart';
import 'package:card_app/pages/pin_page/models/pin.dart';
import 'package:card_app/shared/db/db.dart';
import 'package:get/get.dart';
import 'package:sembast/sembast.dart';
import 'package:uuid/uuid.dart';

class PinService extends GetxService {
  //Database Initialization
  static const String folderName = "PinData";
  final _folder = intMapStoreFactory.store(folderName);
  Future<Database> get _db async => await AppDatabase.instance.database;

  Rx<Pin?> pin = Rx<Pin?>(null);

  setPin(Pin value) {
    pin(value);
  }

  Future<void> storePin(Pin data) async {
    int count = await _folder.count(await _db);

    if (count > 0) {
      await _folder.delete(await _db);
      await _folder.add(await _db, data.toMap());
    } else {
      await _folder.add(await _db, data.toMap());
    }
  }

  Future<void> getPin() async {
    try {
      final _record = await _folder.findFirst(await _db);

      if (_record != null) {
        setPin(Pin.fromMap(_record.value));
      }
    } catch (e) {
      print(e);
    }
  }

  Future<Pin?> returnPin() async {
    try {
      final _record = await _folder.findFirst(await _db);
      if (_record != null) {
        return Pin.fromMap(_record.value);
      }
    } catch (e) {
      print(e);
      throw (e);
    }
  }
}
