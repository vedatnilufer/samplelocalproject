import 'package:hive_flutter/adapters.dart';
import 'package:samplelocalproject/core/manager/cache_menager.dart';
import 'package:samplelocalproject/product/constants/hive/hive_constants.dart';
import 'package:samplelocalproject/product/model/photo_model.dart';

class PhotoCacheManager extends ICacheManager<PhotoModel> {
  @override
  Future<void> addItems(List<PhotoModel> items) {
    return box!.addAll(items);
  }

  @override
  PhotoModel? getItem(dynamic key) {
    return box!.get(key);
  }

  @override
  List<PhotoModel>? getValues() {
    return box?.values.toList();
  }

  @override
  Future<void> putItem(var key, PhotoModel item) async {
    await box?.put(key, item);
  }

  @override
  Future<void> putItems(List<PhotoModel> items) async {
    await box?.putAll(Map.fromEntries(items.map((e) => MapEntry(e.id, e))));
  }

  @override
  Future<void> removeItem(var key) async {
    await box?.delete(key);
  }

  @override
  add(PhotoModel value) async {
    box!.add(value);
  }

  @override
  void registerAdapters() {
    if (!Hive.isAdapterRegistered(HiveConstants.photo)) {
      Hive.registerAdapter(PhotoModelAdapter());
    }
  }
}
