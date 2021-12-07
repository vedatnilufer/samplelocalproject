import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:samplelocalproject/product/enum/base_enum.dart';
import 'package:samplelocalproject/product/enum/network_routes_enum.dart';
import 'package:samplelocalproject/product/model/post_model.dart';

void main() {
  Dio _dio = Dio();
  _dio.options.baseUrl = BaseEnum.baseUrl.rawValue;
  _dio.options.headers = BaseEnum.baseHeader.rawValue;
  PostModel _postModel = PostModel(id: 1, userId: 1, body: "test", title: "test");
  test("Users GET", () async {
    var response = await _dio.get(NetworkRoute.users.rawValue);
    expect(response.data is List, true);
  });
  test("Photos GET", () async {
    final response = await _dio.get(NetworkRoute.photos.rawValue);
    expect(response.data is List, true);
  });
  test("Comments GET", () async {
    var response = await _dio.get(NetworkRoute.comments.rawValue);
    expect(response.data is List, true);
  });
  test("Post GET", () async {
    var response = await _dio.get(NetworkRoute.comments.rawValue);
    expect(response.data is List, true);
  });
  test("Post POST", () async {
    var response = await _dio
        .post(NetworkRoute.posts.rawValue, queryParameters: {"title": _postModel.title, "body": _postModel.body, "userId": _postModel.userId});
    expect(response.statusCode, 201);
  });

  test("Post PUT", () async {
    var response = await _dio.put(NetworkRoute.posts1.rawValue, queryParameters: _postModel.toJson());
    expect(response.statusCode, 200);
  });

  test("Post PATCH", () async {
    var response = await _dio.patch(NetworkRoute.posts1.rawValue, queryParameters: {"title": _postModel.title});
    print(response.data);
    expect(response.statusCode, 200);
  });
}
