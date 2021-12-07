import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:samplelocalproject/core/base/base_view.dart';
import 'package:samplelocalproject/core/enum/page_state_enum.dart';
import 'package:samplelocalproject/core/extension/widget_extension.dart';
import 'package:samplelocalproject/core/widget/random_network_image_widget.dart';
import 'package:samplelocalproject/features/view/profile/viewmodel/profile_viewmodel.dart';
import 'package:samplelocalproject/core/widget/custom_tabs_widget.dart';
import 'package:samplelocalproject/features/view/profile/widget/photos_tab_bar_widget.dart';
import 'package:samplelocalproject/features/view/profile/widget/post_tab_bar_widget.dart';
import 'package:samplelocalproject/features/view/profile/widget/user_tab_bar_widget.dart';
import 'package:samplelocalproject/product/constants/color/color_constants.dart';
import 'package:samplelocalproject/product/constants/route/application_route_constants.dart';
import 'package:samplelocalproject/product/localization/application_localizations.dart';
import 'package:samplelocalproject/product/localization/application_text_constants.dart';
import 'package:kartal/kartal.dart';

part 'profile_view_extension.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ProfileViewModel>(
      onModelReady: (_viewModel) => _viewModel.init(),
      viewModel: ProfileViewModel(),
      onBuilder: (context, _viewModel) => _profileScaffoldBody(context, _viewModel),
    );
  }
}
