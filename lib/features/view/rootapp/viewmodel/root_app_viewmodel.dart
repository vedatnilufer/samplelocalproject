import 'package:samplelocalproject/product/cache/cache_manager.dart';
import 'package:samplelocalproject/product/constants/hive/hive_constants.dart';
import 'package:samplelocalproject/product/manager/user_cache_manager.dart';
import 'package:samplelocalproject/product/model/user_model.dart';
import 'package:mobx/mobx.dart';
part 'root_app_viewmodel.g.dart';

class RootAppViewModel = _RootAppViewModelBase with _$RootAppViewModel;

abstract class _RootAppViewModelBase with Store {
  @observable
  int pageIndex = 0;
  int? currentUser;
  @observable
  UserModel _userModel = UserModel();
  final UserCacheManager _userCacheManager = UserCacheManager();
  UserModel get userModel => _userModel;
  @action
  init() async {
    currentUser = await LocalStorage.instance.getItem(StorageKeys.currenKey);
    await _userCacheManager.init();
    _userModel = _userCacheManager.getItem(currentUser)!;
  }

  @action
  onPage(int? value) => pageIndex = value!;
}
