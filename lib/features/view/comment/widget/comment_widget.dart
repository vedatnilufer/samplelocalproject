import 'package:flutter/material.dart';
import 'package:samplelocalproject/core/widget/random_network_image_widget.dart';
import 'package:samplelocalproject/features/view/comment/viewmodel/comment_viewmodel.dart';
import 'package:samplelocalproject/product/model/comment_model.dart';
import 'package:samplelocalproject/product/widget/slidable_widget.dart';

class CommentWidget extends StatelessWidget {
  final CommentModel _commentModel;
  final CommentViewModel _viewModel;
  const CommentWidget({Key? key, required CommentViewModel viewModel, required CommentModel commentModel})
      : _viewModel = viewModel,
        _commentModel = commentModel,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _commentListViewBuilder;
  }

  get _commentListViewBuilder {
    return SlidableWidget(
      child: _commentCardBody,
      model: _commentModel,
      viewModel: _viewModel,
      left: true,
    );
  }

  Card get _commentCardBody => Card(child: _commentListTile);

  ListTile get _commentListTile {
    return ListTile(
      leading: _commentListTileLeading,
      title: _commentListTileTitle,
      subtitle: _commentListTileSubtitle,
      onTap: () {},
    );
  }

  CircleAvatar get _commentListTileLeading => CircleAvatar(backgroundImage: randomImage(_commentModel.id!));

  Text get _commentListTileTitle => Text(_commentModel.email ?? '');

  Text get _commentListTileSubtitle => Text(_commentModel.body ?? '');
}
