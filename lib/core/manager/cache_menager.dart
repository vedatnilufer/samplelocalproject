import 'package:hive_flutter/adapters.dart';

abstract class ICacheManager<T> {
  Box<T>? box;

  ICacheManager();

  Future<void> init() async {
    registerAdapters();
    if (!(box?.isOpen ?? false)) {
      box = await Hive.openBox(T.toString());
    }
  }

  void registerAdapters();

  Future<void> clearAll() async {
    await box?.clear();
  }

  Future<void> addItems(List<T> items);
  Future<void> putItems(List<T> items);

  T? getItem(String key);
  List<T>? getValues();
  Future<void> add(T value);

  Future<void> putItem(var key, T item);
  Future<void> removeItem(var key);
}
