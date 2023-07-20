import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'post_model.freezed.dart';

part 'post_model.g.dart';

@freezed
class PostModel with _$PostModel{
  const factory PostModel({
    @Default(0) int postId,
    @Default("") String title,
    @Default("") String content,
    @Default([]) List<ShortoryModel> shortory,
    @Default(UserInfoModel(userId: 0, userName: "", userProfile: "")) UserInfoModel userInfo,
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

@freezed
class UserInfoModel with _$UserInfoModel{
  const factory UserInfoModel({
    @Default(0) int userId,
    @Default("") String userName,
    @Default("") String userProfile
  }) = _UserInfoModel;

  factory UserInfoModel.fromJson(Map<String, Object?>json)
  => _$UserInfoModelFromJson(json);
}