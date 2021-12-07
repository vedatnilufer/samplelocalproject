import 'package:samplelocalproject/core/enum/page_state_enum.dart';
import 'package:samplelocalproject/product/manager/comment_cache_manager.dart';
import 'package:samplelocalproject/product/model/comment_model.dart';
import 'package:mobx/mobx.dart';
part 'comment_viewmodel.g.dart';

class CommentViewModel = _CommentViewModelBase with _$CommentViewModel;

abstract class _CommentViewModelBase with Store {
  @observable
  PageState pageState = PageState.normal;
  late int postId;
  final List<CommentModel> _list = [];
  final CommentCacheManager _commentCacheManager = CommentCacheManager();
  List<CommentModel> get commentModel => _list;

  @action
  init() async {
    _list.clear();
    pageState = PageState.loading;
    try {
      await _commentCacheManager.init();
      if (_commentCacheManager.getValues()?.isNotEmpty ?? false) {
        List<CommentModel> _data = _commentCacheManager.getValues()!;
        for (var item in _data) {
          if (item.postId == postId) {
            _list.add(item);
          }
        }
      }
      pageState = PageState.success;
    } catch (e) {
      pageState = PageState.error;
    }
  }

  deleteItem(var key, var model) async {
    await _commentCacheManager.init();
    await _commentCacheManager.removeItem(key);
    _list.remove(model);
  }
}
