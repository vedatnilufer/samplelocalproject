import 'package:flutter/material.dart';
import 'package:samplelocalproject/core/widget/random_network_image_widget.dart';
import 'package:samplelocalproject/features/view/post/viewmodel/post_viewmodel.dart';
import 'package:samplelocalproject/product/constants/route/application_route_constants.dart';
import 'package:samplelocalproject/product/model/post_model.dart';
import 'package:kartal/kartal.dart';

class PostWidget extends StatelessWidget {
  final PostModel _postModel;
  final PostViewModel _viewModel;
  const PostWidget({Key? key, required PostModel postModel, required PostViewModel viewModel})
      : _postModel = postModel,
        _viewModel = viewModel,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _postCardBody(_postModel, _viewModel, context);
  }

  Card _postCardBody(PostModel _postModel, PostViewModel _viewModel, BuildContext context) =>
      Card(child: _postListTile(_postModel, _viewModel, context));

  ListTile _postListTile(PostModel _postModel, PostViewModel _viewModel, BuildContext context) {
    return ListTile(
      leading: _postListTileLeading(_postModel),
      title: _postListTileTitle(_postModel),
      subtitle: _postListTileSubtitle(_postModel),
      onTap: () => context.navigateName(ApplicationRoute.commentView, data: [_postModel.id, _postModel]),
    );
  }

  CircleAvatar _postListTileLeading(PostModel _postModel) => CircleAvatar(backgroundImage: randomImage(_postModel.id!));

  Text _postListTileTitle(PostModel _postModel) => Text(_postModel.title ?? '');

  Text _postListTileSubtitle(PostModel _postModel) => Text(
        _postModel.body ?? '',
        maxLines: 3,
        overflow: TextOverflow.fade,
      );
}
