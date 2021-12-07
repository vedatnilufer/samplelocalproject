import 'package:flutter/material.dart';
import 'package:samplelocalproject/features/view/profile/viewmodel/profile_viewmodel.dart';
import 'package:samplelocalproject/product/constants/route/application_route_constants.dart';
import 'package:samplelocalproject/product/model/post_model.dart';
import 'package:samplelocalproject/product/widget/slidable_widget.dart';

import 'package:kartal/kartal.dart';

class PostTabBarWidget extends StatelessWidget {
  final ProfileViewModel _viewModel;
  const PostTabBarWidget({Key? key, required ProfileViewModel viewModel})
      : _viewModel = viewModel,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _postTabBarBuilder(_viewModel);
  }

  ListView _postTabBarBuilder(ProfileViewModel _viewModel) {
    return ListView.builder(
      itemCount: _viewModel.postList.length,
      itemBuilder: (BuildContext context, int index) {
        PostModel _postModel = _viewModel.postList[index];
        return SlidableWidget(child: _userListTileCard(_postModel, context), viewModel: _viewModel, model: _postModel, left: false);
      },
    );
  }

  Card _userListTileCard(PostModel _postModel, BuildContext context) => Card(child: _postListTile(_postModel, context));

  ListTile _postListTile(PostModel _postModel, BuildContext context) {
    return ListTile(
      dense: true,
      trailing: _postListTileTrailing(_postModel),
      title: _postListTileTitle(_postModel),
      subtitle: _postListTileSubtitle(_postModel),
      onTap: () {
        context.navigateName(ApplicationRoute.commentView, data: [_postModel.id, _postModel]);
      },
    );
  }

  Text _postListTileTrailing(PostModel _postModel) => Text('${_postModel.id}');

  Text _postListTileTitle(PostModel _postModel) => Text(_postModel.title ?? '');

  Text _postListTileSubtitle(PostModel _postModel) => Text(_postModel.body ?? '');
}
