import 'package:hive_flutter/adapters.dart';
import 'package:samplelocalproject/product/constants/hive/hive_constants.dart';

class LocalStorage {
  static LocalStorage? _instace;
  static LocalStorage get instance {
    if (_instace != null) return _instace!;
    _instace = LocalStorage._init();
    return _instace!;
  }

  LocalStorage._init();
  var box = Hive.box(StorageKeys.localStorage);
  putItem(String key, var cache) async {
    await box.put(key, cache);
  }

  getItem(var cacheKey) async => await box.get(cacheKey);
  Future<void> clearAll() async {
    await box.clear();
  }
}
