import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:nuri/data/model/profile/user_info/user_info_model.dart';

part 'post_model.freezed.dart';

part 'post_model.g.dart';

@freezed
class PostModel with _$PostModel{
  const factory PostModel({
    @Default(0) int postId,
    @Default("") String title,
    @Default("") String content,
    @Default([]) List<ShortoryModel> shotory,
    @Default(UserInfoModel(userId: "", userName: "", userProfile: "")) UserInfoModel userInfo,
    @Default(0) likes,
    @Default(false) liked,

  }) = _PostModel;

  factory PostModel.fromJson(Map<String, Object?>json)
  => _$PostModelFromJson(json);
}

@freezed
class ShortoryModel with _$ShortoryModel{
  const factory ShortoryModel({
  @Default("") String url,
  @Default("") String content,
}) = _ShortoryModel;

factory ShortoryModel.fromJson(Map<String, Object?>json)
=> _$ShortoryModelFromJson(json);
}