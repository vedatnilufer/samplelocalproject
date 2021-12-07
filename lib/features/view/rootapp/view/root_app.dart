import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:samplelocalproject/core/base/base_view.dart';
import 'package:samplelocalproject/features/view/post/view/post_view.dart';
import 'package:samplelocalproject/features/view/profile/view/profile_view.dart';
import 'package:samplelocalproject/features/view/rootapp/viewmodel/root_app_viewmodel.dart';
import 'package:samplelocalproject/product/localization/application_localizations.dart';
import 'package:samplelocalproject/product/localization/application_text_constants.dart';

class RootApp extends StatelessWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<RootAppViewModel>(
        viewModel: RootAppViewModel(),
        onModelReady: (model) => model.init(),
        onBuilder: (context, model) => Observer(builder: (_) {
              return _rootAppBody(model, context);
            }));
  }

  Scaffold _rootAppBody(RootAppViewModel model, BuildContext context) {
    return Scaffold(
      body: rootWidget[model.pageIndex],
      bottomNavigationBar: _bottomNavigationBar(context, model),
    );
  }

  BottomNavigationBar _bottomNavigationBar(BuildContext context, RootAppViewModel model) {
    return BottomNavigationBar(
      currentIndex: model.pageIndex,
      onTap: model.onPage,
      items: [
        BottomNavigationBarItem(icon: const Icon(Icons.post_add), label: getTranslate(context, ApplicationText.post) ?? ApplicationText.post),
        BottomNavigationBarItem(
            icon: const Icon(CupertinoIcons.person_fill), label: getTranslate(context, ApplicationText.profile) ?? ApplicationText.profile),
      ],
    );
  }

  get rootWidget => [const PostView(), const ProfileView()];
}
