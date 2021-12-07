part of 'profile_view.dart';

extension _ProfileViewExtension on ProfileView {
  Scaffold _profileScaffoldBody(BuildContext context, ProfileViewModel _viewModel) {
    return Scaffold(
      appBar: _appBar(context, _viewModel),
      body: Observer(builder: (_) {
        switch (_viewModel.pageState) {
          case PageState.success:
            return _bodyColumn(context, _viewModel);
          case PageState.loading:
            return PageState.loading.rawValue;
          case PageState.error:
            return PageState.error.rawValue;
          default:
            return PageState.error.rawValue;
        }
      }),
    );
  }

  AppBar _appBar(BuildContext context, ProfileViewModel _model) => AppBar(
        title: _appBarTitle(context),
        actions: [_appBarResetText(context).toCenter, _appBarResetIcon(_model, context)],
      );

  Text _appBarTitle(BuildContext context) => Text(getTranslate(context, ApplicationText.profile) ?? ApplicationText.profile);

  IconButton _appBarResetIcon(ProfileViewModel _model, BuildContext context) {
    return IconButton(
      icon: const Icon(CupertinoIcons.refresh_bold, color: ColorConstants.sunsetOrange),
      onPressed: () async {
        await _model.logOut();
        context.navigateToReset(ApplicationRoute.splashView);
      },
    );
  }

  Column _bodyColumn(BuildContext context, ProfileViewModel _viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _userAccountsDrawerHeader(_viewModel),
        Expanded(child: _defaultTabController(_viewModel)),
      ],
    );
  }

  UserAccountsDrawerHeader _userAccountsDrawerHeader(ProfileViewModel _viewModel) {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fitWidth, image: randomImage(_viewModel.userModel.id!))),
      accountName: Text(_viewModel.userModel.name ?? ''),
      accountEmail: Text(_viewModel.userModel.website ?? ''),
    );
  }

  DefaultTabController _defaultTabController(ProfileViewModel _viewModel) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Column(
        children: [
          _tabBarTabBody(_viewModel),
          Expanded(child: _tabBarViewBody(_viewModel)),
        ],
      ),
    );
  }

  TabBar _tabBarTabBody(ProfileViewModel _viewModel) {
    return TabBar(
      overlayColor: MaterialStateProperty.all(ColorConstants.java),
      tabs: <Widget>[
        CustomTabsWidget(count: _viewModel.postList.length, applicationText: ApplicationText.post),
        CustomTabsWidget(count: _viewModel.userList.length, applicationText: ApplicationText.following),
        CustomTabsWidget(count: _viewModel.photoList.length, applicationText: ApplicationText.photos),
      ],
    );
  }

  TabBarView _tabBarViewBody(ProfileViewModel _viewModel) {
    return TabBarView(
      children: <Widget>[
        PostTabBarWidget(viewModel: _viewModel),
        UserTabBarWidget(viewModel: _viewModel),
        PhotosTabBarWidget(viewModel: _viewModel),
      ],
    );
  }
}

Text _appBarResetText(BuildContext context) => Text(getTranslate(context, ApplicationText.reset) ?? ApplicationText.reset);
