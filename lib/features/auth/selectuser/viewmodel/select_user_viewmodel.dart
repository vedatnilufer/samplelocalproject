import 'package:samplelocalproject/product/manager/user_cache_manager.dart';
import 'package:samplelocalproject/product/model/user_model.dart';
import 'package:mobx/mobx.dart';

part 'select_user_viewmodel.g.dart';

class SelectUserViewModel = _SelectUserViewModelBase with _$SelectUserViewModel;

abstract class _SelectUserViewModelBase with Store {
  @observable
  List<UserModel> _userModel = [];
  final UserCacheManager _userCacheManager = UserCacheManager();
  List<UserModel> get userModel => _userModel;

  @action
  init() async {
    await _userCacheManager.init();
    if (_userCacheManager.getValues()?.isNotEmpty ?? false) {
      _userModel = _userCacheManager.getValues()!;
    }
  }
}
