import 'package:samplelocalproject/core/enum/page_state_enum.dart';
import 'package:samplelocalproject/product/cache/cache_manager.dart';
import 'package:samplelocalproject/product/constants/hive/hive_constants.dart';
import 'package:samplelocalproject/product/manager/post_cache_manager.dart';
import 'package:samplelocalproject/product/model/post_model.dart';
import 'package:mobx/mobx.dart';
part 'post_viewmodel.g.dart';

class PostViewModel = _PostViewModelBase with _$PostViewModel;

abstract class _PostViewModelBase with Store {
  @observable
  PageState pageState = PageState.normal;
  late int currentUser;
  @observable
  List<PostModel> _postList = [];
  final PostCacheManager _postCacheManager = PostCacheManager();
  List<PostModel> get postModel => _postList;

  @action
  init() async {
    try {
      _postList.clear();
      currentUser = await LocalStorage.instance.getItem(StorageKeys.currenKey);
      await _postCacheManager.init();
      if (_postCacheManager.getValues()?.isNotEmpty ?? false) {
        var _list = _postCacheManager.getValues()!;
        for (var item in _list) {
          if (item.id != currentUser) {
            _postList.add(item);
          }
        }
      }
      postModel;
      pageState = PageState.success;
    } catch (e) {
      pageState = PageState.error;
    }
  }

  deleteItem(var key, var model) async {
    await _postCacheManager.init();
    await _postCacheManager.removeItem(key);
    _postList.remove(model);
  }
}
