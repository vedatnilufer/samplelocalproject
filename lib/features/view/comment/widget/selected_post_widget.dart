import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:samplelocalproject/core/widget/random_network_image_widget.dart';
import 'package:samplelocalproject/features/view/comment/viewmodel/comment_viewmodel.dart';
import 'package:samplelocalproject/product/constants/color/color_constants.dart';
import 'package:samplelocalproject/product/model/post_model.dart';
import 'package:kartal/kartal.dart';

class SelectedPostWidget extends StatelessWidget {
  const SelectedPostWidget({
    Key? key,
    required PostModel postModel,
    required CommentViewModel viewModel,
  })  : _postModel = postModel,
        _viewModel = viewModel,
        super(key: key);
  final PostModel _postModel;
  final CommentViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorConstants.catSkillWhite.withOpacity(0.8),
      child: Card(
        child: _selectedPostListTile(context),
      ),
    );
  }

  ListTile _selectedPostListTile(BuildContext context) {
    return ListTile(
      leading: _listTileLeading(),
      title: _listTileTitle(context),
      subtitle: _listTileSubttile(),
    );
  }

  CircleAvatar _listTileLeading() => CircleAvatar(backgroundImage: randomImage(_postModel.id!));
  Row _listTileTitle(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(_postModel.title ?? ''), _commentCountBody(context)]);
  }

  Text _listTileSubttile() => Text(_postModel.body ?? '');

  Row _commentCountBody(BuildContext context) => Row(children: [_commentCountIcon(context), const SizedBox(width: 5), __commentCountText(context)]);

  Icon _commentCountIcon(BuildContext context) => Icon(CupertinoIcons.plus_rectangle_on_rectangle, color: context.appTheme.primaryColor);

  Text __commentCountText(BuildContext context) =>
      Text('${_viewModel.commentModel.length}', style: context.textTheme.headline6!.copyWith(color: context.appTheme.primaryColor));
}
