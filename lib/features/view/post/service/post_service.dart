import 'dart:convert';

import 'package:samplelocalproject/product/enum/base_enum.dart';
import 'package:samplelocalproject/product/enum/network_routes_enum.dart';
import 'package:samplelocalproject/product/model/post_model.dart';
import 'package:http/http.dart' as http;

getUserList() async {
  var response = await http.get(
    Uri.https(BaseEnum.baseUrl.rawValue, NetworkRoute.post.rawValue),
    headers: BaseEnum.baseHeader.rawValue,
  );
  var resBody = (json.decode(response.body) as List).map((dynamic item) {
    return PostModel.fromJson(item);
  }).toList();
  if (response.statusCode == 200) {
    return resBody;
  } else {
    return false;
  }
}
