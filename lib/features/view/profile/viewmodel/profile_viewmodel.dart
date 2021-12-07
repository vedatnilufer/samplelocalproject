import 'package:samplelocalproject/core/enum/page_state_enum.dart';
import 'package:samplelocalproject/product/cache/cache_manager.dart';
import 'package:samplelocalproject/product/constants/hive/hive_constants.dart';
import 'package:samplelocalproject/product/manager/photo_cache_manager.dart';
import 'package:samplelocalproject/product/manager/post_cache_manager.dart';
import 'package:samplelocalproject/product/manager/user_cache_manager.dart';
import 'package:samplelocalproject/product/model/photo_model.dart';
import 'package:samplelocalproject/product/model/post_model.dart';
import 'package:samplelocalproject/product/model/user_model.dart';
import 'package:mobx/mobx.dart';
part 'profile_viewmodel.g.dart';

class ProfileViewModel = _ProfileViewModelBase with _$ProfileViewModel;

abstract class _ProfileViewModelBase with Store {
  @observable
  PageState pageState = PageState.normal;
  late int currentUser;
  UserModel _userModel = UserModel();
  final UserCacheManager _userCacheManager = UserCacheManager();
  final PostCacheManager _postCacheManager = PostCacheManager();
  final PhotoCacheManager _photoCacheManager = PhotoCacheManager();
  final List<PostModel> _postList = [];
  List<UserModel> _userList = [];
  final List<PhotoModel> _photoList = [];
  UserModel get userModel => _userModel;
  List<UserModel> get userList => _userList;
  List<PostModel> get postList => _postList;
  List<PhotoModel> get photoList => _photoList;

  @action
  init() async {
    _postList.clear();
    _photoList.clear();
    try {
      currentUser = await LocalStorage.instance.getItem(StorageKeys.currenKey);
      await _userCacheManager.init();
      _userModel = _userCacheManager.getItem(currentUser)!;
      if (_userCacheManager.getValues()?.isNotEmpty ?? false) {
        _userList = _userCacheManager.getValues()!;
        _userList.remove(userModel);
      }
      await _postCacheManager.init();

      if (_postCacheManager.getValues()?.isNotEmpty ?? false) {
        var _data = _postCacheManager.getValues();
        for (var item in _data!) {
          if (item.userId == currentUser) {
            _postList.add(item);
          }
        }
      }
      await _photoCacheManager.init();

      if (_photoCacheManager.getValues()?.isNotEmpty ?? false) {
        var _data = _photoCacheManager.getValues();
        for (var item in _data!) {
          if (item.albumId == _userModel.id) {
            _photoList.add(item);
          }
        }
      }
      pageState = PageState.success;
    } catch (e) {
      pageState = PageState.error;
    }
  }

  @action
  deleteItem(var key, var model) async {
    if (model is PostModel) {
      await _postCacheManager.init();
      await _postCacheManager.removeItem(key);
      _postList.remove(model);
    } else if (model is PhotoModel) {
      await _photoCacheManager.init();
      await _photoCacheManager.removeItem(key);
      _photoList.remove(model);
    } else if (model is UserModel) {
      await _userCacheManager.init();
      await _userCacheManager.removeItem(key);
      _userList.remove(model);
    }
  }

  logOut() async {
    await LocalStorage.instance.clearAll();
  }
}
