import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:samplelocalproject/product/constants/hive/hive_constants.dart';

part 'comment_model.g.dart';

@HiveType(typeId: HiveConstants.comment)
@JsonSerializable()
class CommentModel {
  @HiveField(0)
  int? postId;
  @HiveField(1)
  int? id;
  @HiveField(2)
  String? name;
  @HiveField(3)
  String? email;
  @HiveField(4)
  String? body;

  CommentModel({this.postId, this.id, this.name, this.email, this.body});

  factory CommentModel.fromJson(Map<String, dynamic> json) => _$CommentModelFromJson(json);
  Map<String, dynamic> toJson() => _$CommentModelToJson(this);
}
