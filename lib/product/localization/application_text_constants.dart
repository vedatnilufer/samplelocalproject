import 'package:flutter/cupertino.dart';

class ApplicationText {
  static ApplicationText? _instace;
  static ApplicationText get instance {
    if (_instace != null) return _instace!;
    _instace = ApplicationText._init();
    return _instace!;
  }

  BuildContext? context;
  ApplicationText._init();
  static const login = 'login';
  static const post = 'post';
  static const photos = 'photos';
  static const profile = 'profile';
  static const delete = 'delete';
  static const share = 'share';
  static const reset = 'reset';
  static const comment = 'comment';
  static const comments = 'comments';
  static const following = 'following';
  static const photoAlbum = 'photoAlbum';
  static const unfollow = 'unfollow';
}
