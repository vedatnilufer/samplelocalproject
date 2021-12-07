import 'package:flutter/material.dart';
import 'package:samplelocalproject/features/view/profile/viewmodel/profile_viewmodel.dart';
import 'package:samplelocalproject/product/model/photo_model.dart';
import 'package:kartal/kartal.dart';

class PhotosTabBarWidget extends StatelessWidget {
  final ProfileViewModel _viewModel;
  const PhotosTabBarWidget({Key? key, required ProfileViewModel viewModel})
      : _viewModel = viewModel,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _photosTabBarBuilder(context, _viewModel);
  }

  GridView _photosTabBarBuilder(BuildContext context, ProfileViewModel _viewModel) {
    return GridView.count(
      primary: false,
      padding: context.paddingLow,
      crossAxisCount: 2,
      children: _viewModel.photoList.map((e) => _photoListBodyStack(e, _viewModel)).toList(),
    );
  }

  Stack _photoListBodyStack(PhotoModel e, ProfileViewModel _viewModel) {
    return Stack(
      children: [_photoListTile(e), _photoRemoveItemPositioned(_viewModel, e)],
    );
  }

  ListTile _photoListTile(PhotoModel e) {
    return ListTile(
      title: _photoListTileTitleText(e),
      subtitle: _photoListTileSubtitleImage(e),
    );
  }

  Text _photoListTileTitleText(PhotoModel e) => Text('${e.id}', maxLines: 1);

  Image _photoListTileSubtitleImage(PhotoModel e) => Image.network(e.thumbnailUrl ?? '');

  Positioned _photoRemoveItemPositioned(ProfileViewModel _viewModel, PhotoModel e) {
    return Positioned(
        right: 0,
        child: GestureDetector(
            onTap: () async {
              await _viewModel.deleteItem(e.id, e);
              _viewModel.init();
            },
            child: const Icon(Icons.cancel)));
  }
}
