import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:samplelocalproject/core/base/base_view.dart';
import 'package:samplelocalproject/features/auth/splash/viewmodel/splash_viewmodel.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
      onModelReady: (_viewModel) => Future.microtask(() => _viewModel.allCacheData(context)),
      viewModel: SplashViewModel(),
      onBuilder: (context, _viewModel) {
        return Scaffold(
          body: Observer(builder: (_) {
            return Center(
              child: _viewModel.image,
            );
          }),
        );
      },
    );
  }
}
