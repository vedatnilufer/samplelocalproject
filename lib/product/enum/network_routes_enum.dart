// ignore_for_file: constant_identifier_names

enum NetworkRoute { post, comments, albums, photos, todos, users, posts, posts1 }

extension NetworkRouteExtension on NetworkRoute {
  get rawValue {
    switch (this) {
      case NetworkRoute.post:
        return '/posts';
      case NetworkRoute.comments:
        return '/comments';
      case NetworkRoute.albums:
        return '/albums';
      case NetworkRoute.photos:
        return '/photos';
      case NetworkRoute.todos:
        return '/todos';
      case NetworkRoute.users:
        return '/users';
      case NetworkRoute.posts:
        return '/posts';
      case NetworkRoute.posts1:
        return '/posts/1';
      default:
    }
  }
}
