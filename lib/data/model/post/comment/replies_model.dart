import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:nuri/data/model/post/post_model.dart';
import 'package:nuri/data/model/profile/user_info/user_info_model.dart';

part 'replies_model.freezed.dart';

part 'replies_model.g.dart';

@freezed
class RepliesModel with _$RepliesModel{
  const factory RepliesModel({
    @Default(1) int repliesId,
    @Default("") String content,
    @Default(UserInfoModel(userId: 0,userName: "",userProfile: "")) UserInfoModel userInfo,
    @Default("") String commentTime,
    @Default(0) int likes,
    @Default(false) bool liked,
  }) = _RepliesModel;

  factory RepliesModel.fromJson(Map<String, Object?>json)
  => _$RepliesModelFromJson(json);
}
