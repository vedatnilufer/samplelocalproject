import 'package:flutter/material.dart';
import 'package:samplelocalproject/features/auth/selectuser/view/select_user_view.dart';
import 'package:samplelocalproject/features/auth/splash/view/splash_view.dart';
import 'package:samplelocalproject/features/view/comment/view/comment_view.dart';
import 'package:samplelocalproject/features/view/rootapp/view/root_app.dart';

class ApplicationRoute {
  static ApplicationRoute? _instace;
  static ApplicationRoute get instance {
    if (_instace != null) return _instace!;
    _instace = ApplicationRoute._init();
    return _instace!;
  }

  ApplicationRoute._init();

  static const rootApp = '/rootApp';
  static const selectUser = '/selectUserView';
  static const splashView = '/splashView';
  static const commentView = '/commentView';
  static const photo = '/photo';

  Map<String, WidgetBuilder> get routesWidget {
    return {
      '/rootApp': (context) => const RootApp(),
      '/splashView': (context) => const SplashView(),
      '/selectUserView': (context) => const SelectUserView(),
      '/commentView': (context) => const CommentView(),
    };
  }
}
