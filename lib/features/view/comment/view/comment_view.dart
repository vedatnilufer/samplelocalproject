import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:samplelocalproject/core/base/base_view.dart';
import 'package:samplelocalproject/core/enum/page_state_enum.dart';
import 'package:samplelocalproject/features/view/comment/viewmodel/comment_viewmodel.dart';
import 'package:samplelocalproject/features/view/comment/widget/comment_widget.dart';
import 'package:samplelocalproject/features/view/comment/widget/selected_post_widget.dart';
import 'package:samplelocalproject/product/localization/application_localizations.dart';
import 'package:samplelocalproject/product/localization/application_text_constants.dart';
import 'package:samplelocalproject/product/model/comment_model.dart';
import 'package:samplelocalproject/product/model/post_model.dart';

part 'comment_view_extension.dart';

class CommentView extends StatelessWidget {
  const CommentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List _data = ModalRoute.of(context)!.settings.arguments as List;
    PostModel _postModel = _data.last;
    return BaseView<CommentViewModel>(
      viewModel: CommentViewModel(),
      onModelReady: (_viewModel) {
        _viewModel.postId = _data.first;
        _viewModel.init();
      },
      onBuilder: (context, _viewModel) => _commentView(context, _viewModel, _postModel),
    );
  }
}
