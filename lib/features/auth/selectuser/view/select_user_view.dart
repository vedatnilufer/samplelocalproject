import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:samplelocalproject/core/base/base_view.dart';
import 'package:samplelocalproject/core/widget/random_network_image_widget.dart';
import 'package:samplelocalproject/features/auth/selectuser/viewmodel/select_user_viewmodel.dart';
import 'package:samplelocalproject/product/cache/cache_manager.dart';
import 'package:samplelocalproject/product/constants/hive/hive_constants.dart';
import 'package:samplelocalproject/product/constants/route/application_route_constants.dart';
import 'package:samplelocalproject/product/localization/application_localizations.dart';
import 'package:samplelocalproject/product/localization/application_text_constants.dart';
import 'package:samplelocalproject/product/model/user_model.dart';
import 'package:kartal/kartal.dart';

part 'select_user_view_extension.dart';

class SelectUserView extends StatelessWidget {
  const SelectUserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SelectUserViewModel>(
      viewModel: SelectUserViewModel(),
      onModelReady: (_viewModel) => _viewModel.init(),
      onBuilder: (context, _viewModel) => _userViewBody(_viewModel),
    );
  }
}
