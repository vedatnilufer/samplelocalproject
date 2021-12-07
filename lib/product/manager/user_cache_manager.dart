import 'package:hive_flutter/adapters.dart';
import 'package:samplelocalproject/core/manager/cache_menager.dart';
import 'package:samplelocalproject/product/constants/hive/hive_constants.dart';
import 'package:samplelocalproject/product/model/user_model.dart';

class UserCacheManager extends ICacheManager<UserModel> {
  @override
  Future<void> addItems(List<UserModel> items) {
    return box!.addAll(items);
  }

  @override
  UserModel? getItem(dynamic key) {
    return box!.get(key);
  }

  @override
  List<UserModel>? getValues() {
    return box?.values.toList();
  }

  @override
  Future<void> putItem(var key, UserModel item) async {
    await box?.put(key, item);
  }

  @override
  Future<void> putItems(List<UserModel> items) async {
    await box?.putAll(Map.fromEntries(items.map((e) => MapEntry(e.id, e))));
  }

  @override
  Future<void> removeItem(var key) async {
    await box?.delete(key);
  }

  @override
  add(UserModel value) async {
    box!.add(value);
  }

  @override
  void registerAdapters() {
    if (!Hive.isAdapterRegistered(HiveConstants.userModel)) {
      Hive.registerAdapter(UserModelAdapter());
      Hive.registerAdapter(AddressAdapter());
      Hive.registerAdapter(GeoAdapter());
      Hive.registerAdapter(CompanyAdapter());
    }
  }
}
