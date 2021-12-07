part of 'select_user_view.dart';

extension _SelectUserExtension on SelectUserView {
  Scaffold _userViewBody(SelectUserViewModel _viewModel) {
    return Scaffold(
      body: SafeArea(
        child: Observer(builder: (_) {
          return _userListBuilder(_viewModel);
        }),
      ),
    );
  }

  ListView _userListBuilder(SelectUserViewModel _viewModel) {
    return ListView.builder(
        itemCount: _viewModel.userModel.length,
        itemBuilder: (context, index) {
          UserModel _data = _viewModel.userModel[index];
          return _listViewBuilderBody(_data, context);
        });
  }

  Card _listViewBuilderBody(UserModel _data, BuildContext context) {
    return Card(
      child: _userListTile(_data, context),
    );
  }

  ListTile _userListTile(UserModel _data, BuildContext context) {
    return ListTile(
      leading: _userListTileLeading(_data),
      title: _userListTileTitle(_data),
      subtitle: _userListTileSubtitle(_data),
      trailing: _userListTileTrailingElevatedButton(context, _data),
    );
  }

  CircleAvatar _userListTileLeading(UserModel _data) => CircleAvatar(backgroundImage: randomImage(_data.id!));

  Text _userListTileTitle(UserModel _data) => Text(_data.name ?? '');

  Column _userListTileSubtitle(UserModel _data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(_data.website ?? ''),
        Text(_data.email ?? ''),
      ],
    );
  }

  OutlinedButton _userListTileTrailingElevatedButton(BuildContext context, UserModel _data) {
    return OutlinedButton(
      child: Text(getTranslate(context, ApplicationText.login) ?? ApplicationText.login),
      onPressed: () async {
        await LocalStorage.instance.putItem(StorageKeys.currenKey, _data.id);
        context.navigateToReset(ApplicationRoute.rootApp);
      },
    );
  }
}
