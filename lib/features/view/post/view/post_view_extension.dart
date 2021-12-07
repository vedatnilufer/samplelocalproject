part of 'post_view.dart';

extension _PostViewExtension on PostView {
  Scaffold _postViewBody(BuildContext context, PostViewModel _viewModel) {
    return Scaffold(
      appBar: _appBar(context),
      body: Observer(builder: (_) {
        switch (_viewModel.pageState) {
          case PageState.success:
            return _postListViewBuilderBody(_viewModel);
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

  AppBar _appBar(BuildContext context) => AppBar(title: _appBarTitle(context));

  Text _appBarTitle(BuildContext context) => Text(getTranslate(context, ApplicationText.post) ?? ApplicationText.post);

  ListView _postListViewBuilderBody(PostViewModel _viewModel) {
    return ListView.builder(
      itemCount: _viewModel.postModel.length,
      itemBuilder: (BuildContext context, int index) {
        PostModel _postModel = _viewModel.postModel[index];
        return SlidableWidget(
          child: PostWidget(viewModel: _viewModel, postModel: _postModel),
          model: _postModel,
          viewModel: _viewModel,
          left: false,
        );
      },
    );
  }
}
