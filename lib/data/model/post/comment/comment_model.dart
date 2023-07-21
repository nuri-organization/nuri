import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:nuri/data/model/post/comment/replies_model.dart';
import 'package:nuri/data/model/post/post_model.dart';

part 'comment_model.freezed.dart';

part 'comment_model.g.dart';

@freezed
class CommentModel with _$CommentModel{
  const factory CommentModel({
    @Default(0) int commentId,
    @Default("") String content,
    @Default(UserInfoModel(userProfile: "", userName: "", userId: 0)) UserInfoModel userInfo,
    @Default("") String commentTime,
    @Default(0) int likes,
    @Default(false) bool liked,
    @Default(0)int totalReplies,
    @Default(RepliesModel(repliesId: 0, content: "",commentTime: "",likes: 0,liked: false,)) RepliesModel replies,
  }) = _CommentModel;

  factory CommentModel.fromJson(Map<String, Object?>json)
  => _$CommentModelFromJson(json);
}
