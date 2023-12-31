// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CommentModel _$$_CommentModelFromJson(Map<String, dynamic> json) =>
    _$_CommentModel(
      commentId: json['commentId'] as int? ?? 0,
      content: json['content'] as String? ?? "",
      userInfo: json['userInfo'] == null
          ? const UserInfoModel(userProfile: "", userName: "", userId: "")
          : UserInfoModel.fromJson(json['userInfo'] as Map<String, dynamic>),
      commentTime: json['commentTime'] as String? ?? "",
      likes: json['likes'] as int? ?? 0,
      liked: json['liked'] as bool? ?? false,
      totalReplies: json['totalReplies'] as int? ?? 0,
      replies: (json['replies'] as List<dynamic>?)
              ?.map((e) => RepliesModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_CommentModelToJson(_$_CommentModel instance) =>
    <String, dynamic>{
      'commentId': instance.commentId,
      'content': instance.content,
      'userInfo': instance.userInfo,
      'commentTime': instance.commentTime,
      'likes': instance.likes,
      'liked': instance.liked,
      'totalReplies': instance.totalReplies,
      'replies': instance.replies,
    };
