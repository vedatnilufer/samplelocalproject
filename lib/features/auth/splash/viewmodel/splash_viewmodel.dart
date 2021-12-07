import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:samplelocalproject/core/enum/page_state_enum.dart';
import 'package:samplelocalproject/product/constants/route/application_route_constants.dart';
import 'package:samplelocalproject/product/enum/base_enum.dart';
import 'package:samplelocalproject/product/enum/network_routes_enum.dart';
import 'package:samplelocalproject/product/manager/comment_cache_manager.dart';
import 'package:samplelocalproject/product/manager/photo_cache_manager.dart';
import 'package:samplelocalproject/product/manager/post_cache_manager.dart';
import 'package:samplelocalproject/product/manager/user_cache_manager.dart';
import 'package:samplelocalproject/product/model/comment_model.dart';
import 'package:samplelocalproject/product/model/photo_model.dart';
import 'package:samplelocalproject/product/model/post_model.dart';
import 'package:samplelocalproject/product/model/user_model.dart';
import 'package:mobx/mobx.dart';

part 'splash_viewmodel.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase with Store {
  @observable
  Widget image = PageState.loading.rawValue;
  final List<UserModel> _userModel = [];
  final List<CommentModel> _commentModel = [];
  final List<PhotoModel> _photoModel = [];
  final List<PostModel> _postModel = [];
  final UserCacheManager _userCacheManager = UserCacheManager();
  final PostCacheManager _postCacheManager = PostCacheManager();
  final CommentCacheManager _commentCacheManager = CommentCacheManager();
  final PhotoCacheManager _photoCacheManager = PhotoCacheManager();
  Dio dio = Dio();
  @action
  Future<bool> allCacheData(BuildContext context) async {
    dio.options.baseUrl = BaseEnum.baseUrl.rawValue;
    try {
      await init;
      var responseUser = await dio.get(NetworkRoute.users.rawValue);
      if (responseUser.data is List) {
        var res = (responseUser.data!).map((item) => UserModel.fromJson(item)).toList();
        for (var item in res) {
          _userModel.add(item);
        }
      }
      final responsePhoto = await dio.get(NetworkRoute.photos.rawValue);
      if (responsePhoto.data is List) {
        var res = (responsePhoto.data!).map((item) => PhotoModel.fromJson(item)).toList();
        for (var item in res) {
          _photoModel.add(item);
        }
      }
      final responseComment = await dio.get(NetworkRoute.comments.rawValue);
      if (responseComment.data is List) {
        var res = (responseComment.data!).map((item) => CommentModel.fromJson(item)).toList();
        for (var item in res) {
          _commentModel.add(item);
        }
      }

      final responsePost = await dio.get(NetworkRoute.post.rawValue);
      if (responsePost.data is List) {
        var res = (responsePost.data!).map((item) => PostModel.fromJson(item)).toList();
        for (var item in res) {
          _postModel.add(item);
        }
      }

      await _userCacheManager.putItems(_userModel);
      await _postCacheManager.putItems(_postModel);
      await _commentCacheManager.putItems(_commentModel);
      await _photoCacheManager.putItems(_photoModel);
      Navigator.pushNamed(context, ApplicationRoute.selectUser);

      return true;
    } catch (e) {
      image = PageState.error.rawValue;
      return false;
    }
  }

  get init async {
    await _userCacheManager.init();
    await _postCacheManager.init();
    await _commentCacheManager.init();
    await _photoCacheManager.init();
    await _userCacheManager.clearAll();
    await _postCacheManager.clearAll();
    await _commentCacheManager.clearAll();
    await _postCacheManager.clearAll();
  }
}
