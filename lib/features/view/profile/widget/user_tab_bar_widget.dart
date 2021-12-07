import 'package:flutter/material.dart';
import 'package:samplelocalproject/core/extension/widget_extension.dart';
import 'package:samplelocalproject/core/widget/random_network_image_widget.dart';
import 'package:samplelocalproject/features/view/profile/viewmodel/profile_viewmodel.dart';
import 'package:samplelocalproject/product/localization/application_localizations.dart';
import 'package:samplelocalproject/product/localization/application_text_constants.dart';
import 'package:samplelocalproject/product/model/user_model.dart';
import 'package:kartal/kartal.dart';

class UserTabBarWidget extends StatelessWidget {
  final ProfileViewModel _viewModel;
  const UserTabBarWidget({Key? key, required ProfileViewModel viewModel})
      : _viewModel = viewModel,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _userTabBarBuilder;
  }

  ListView get _userTabBarBuilder {
    return ListView.builder(
        itemCount: _viewModel.userList.length,
        itemBuilder: (context, index) {
          UserModel _userModel = _viewModel.userList[index];
          return _userListBody(_userModel, context);
        });
  }

  Card _userListBody(UserModel _userModel, BuildContext context) {
    return Card(
      child: _userListTile(_userModel, context),
    );
  }

  ListTile _userListTile(UserModel _userModel, BuildContext context) {
    return ListTile(
      dense: true,
      leading: _userListTileLeading(_userModel),
      title: _userListTileTitle(_userModel),
      subtitle: _userListTileSubtitle(_userModel),
      trailing: _userListTileTrailing(context, _userModel),
    );
  }

  CircleAvatar _userListTileLeading(UserModel _userModel) => CircleAvatar(backgroundImage: randomImage(_userModel.id!));

  Text _userListTileTitle(UserModel _userModel) => Text(_userModel.name ?? '');

  Text _userListTileSubtitle(UserModel _userModel) => Text('${_userModel.email}');

  SizedBox _userListTileTrailing(BuildContext context, UserModel _userModel) {
    return SizedBox(
      width: context.width * 0.2,
      child: _unfollowElevatedButton(_userModel, context),
    );
  }

  ElevatedButton _unfollowElevatedButton(UserModel _userModel, BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await _viewModel.deleteItem(_userModel.id, _userModel);
        _viewModel.init();
      },
      child: _unfollowButtonText(context).toFitted,
    );
  }

  Text _unfollowButtonText(BuildContext context) => Text(getTranslate(context, ApplicationText.unfollow) ?? ApplicationText.unfollow);
}
