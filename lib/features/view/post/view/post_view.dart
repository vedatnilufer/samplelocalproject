import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:samplelocalproject/core/base/base_view.dart';
import 'package:samplelocalproject/core/enum/page_state_enum.dart';
import 'package:samplelocalproject/features/view/post/viewmodel/post_viewmodel.dart';
import 'package:samplelocalproject/features/view/post/widget/post_body_widget.dart';
import 'package:samplelocalproject/product/widget/slidable_widget.dart';
import 'package:samplelocalproject/product/localization/application_localizations.dart';
import 'package:samplelocalproject/product/localization/application_text_constants.dart';
import 'package:samplelocalproject/product/model/post_model.dart';
part 'post_view_extension.dart';

class PostView extends StatelessWidget {
  const PostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<PostViewModel>(
      viewModel: PostViewModel(),
      onModelReady: (_viewModel) {
        _viewModel.init();
      },
      onBuilder: (context, _viewModel) => _postViewBody(context, _viewModel),
    );
  }
}
