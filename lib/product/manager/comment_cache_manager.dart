import 'package:hive_flutter/adapters.dart';
import 'package:samplelocalproject/core/manager/cache_menager.dart';
import 'package:samplelocalproject/product/constants/hive/hive_constants.dart';
import 'package:samplelocalproject/product/model/comment_model.dart';

class CommentCacheManager extends ICacheManager<CommentModel> {
  @override
  Future<void> addItems(List<CommentModel> items) {
    return box!.addAll(items);
  }

  @override
  CommentModel? getItem(dynamic key) {
    return box!.get(key);
  }

  @override
  List<CommentModel>? getValues() {
    return box?.values.toList();
  }

  @override
  Future<void> putItem(var key, CommentModel item) async {
    await box?.put(key, item);
  }

  @override
  Future<void> putItems(List<CommentModel> items) async {
    await box?.putAll(Map.fromEntries(items.map((e) => MapEntry(e.id, e))));
  }

  @override
  Future<void> removeItem(var key) async {
    await box?.delete(key);
  }

  @override
  add(CommentModel value) async {
    box!.add(value);
  }

  @override
  void registerAdapters() {
    if (!Hive.isAdapterRegistered(HiveConstants.comment)) {
      Hive.registerAdapter(CommentModelAdapter());
    }
  }
}
