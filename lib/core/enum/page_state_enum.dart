// ignore_for_file: constant_identifier_names

import 'package:flutter/widgets.dart';
import 'package:samplelocalproject/product/constants/images/assets_path_constants.dart';
import 'package:lottie/lottie.dart';

enum PageState { normal, loading, success, error }

extension PageStateExtension on PageState {
  get rawValue {
    switch (this) {
      case PageState.normal:
        return Center(child: Lottie.asset(AssetsPath.instance.cubeLoader));
      case PageState.loading:
        return Center(child: Lottie.asset(AssetsPath.instance.cloudDownloading));
      case PageState.error:
        return Center(child: Lottie.asset(AssetsPath.instance.erorDoodleAnimation));
      default:
    }
  }
}
