import 'package:hive_flutter/adapters.dart';
import 'package:samplelocalproject/core/manager/cache_menager.dart';
import 'package:samplelocalproject/product/constants/hive/hive_constants.dart';
import 'package:samplelocalproject/product/model/post_model.dart';

class PostCacheManager extends ICacheManager<PostModel> {
  @override
  Future<void> addItems(List<PostModel> items) {
    return box!.addAll(items);
  }

  @override
  PostModel? getItem(dynamic key) {
    return box!.get(key);
  }

  @override
  List<PostModel>? getValues() {
    return box?.values.toList();
  }

  @override
  Future<void> putItem(var key, PostModel item) async {
    await box?.put(key, item);
  }

  @override
  Future<void> putItems(List<PostModel> items) async {
    await box?.putAll(Map.fromEntries(items.map((e) => MapEntry(e.id, e))));
  }

  @override
  Future<void> removeItem(var key) async {
    await box?.delete(key);
  }

  @override
  add(PostModel value) async {
    box!.add(value);
  }

  @override
  void registerAdapters() {
    if (!Hive.isAdapterRegistered(HiveConstants.postModel)) {
      Hive.registerAdapter(PostModelAdapter());
    }
  }
}
