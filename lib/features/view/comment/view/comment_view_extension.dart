part of 'comment_view.dart';

extension _CommentViewExtension on CommentView {
  Scaffold _commentView(BuildContext context, CommentViewModel _viewModel, PostModel _postModel) {
    return Scaffold(
      appBar: _appBar(context),
      body: Observer(builder: (_) {
        switch (_viewModel.pageState) {
          case PageState.success:
            return _commentBody(_postModel, _viewModel);
          case PageState.loading:
            return PageState.loading.rawValue;
          case PageState.normal:
            return PageState.normal.rawValue;
          case PageState.error:
            return PageState.error.rawValue;
          default:
            return PageState.error.rawValue;
        }
      }),
    );
  }

  AppBar _appBar(BuildContext context) => AppBar(title: Text(getTranslate(context, ApplicationText.comments) ?? ApplicationText.comments));

  Column _commentBody(PostModel _postModel, CommentViewModel _viewModel) {
    return Column(
      children: [
        SelectedPostWidget(postModel: _postModel, viewModel: _viewModel),
        Expanded(child: _commentListViewBuilder(_viewModel)),
      ],
    );
  }

  ListView _commentListViewBuilder(CommentViewModel _viewModel) {
    return ListView.builder(
      itemCount: _viewModel.commentModel.length,
      itemBuilder: (BuildContext context, int index) {
        CommentModel _commentModel = _viewModel.commentModel[index];
        return CommentWidget(viewModel: _viewModel, commentModel: _commentModel);
      },
    );
  }
}
