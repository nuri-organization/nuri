// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'replies_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RepliesModel _$$_RepliesModelFromJson(Map<String, dynamic> json) =>
    _$_RepliesModel(
      repliesId: json['repliesId'] as int? ?? 1,
      content: json['content'] as String? ?? "",
      userInfo: json['userInfo'] == null
          ? const UserInfoModel(userId: "", userName: "", userProfile: "")
          : UserInfoModel.fromJson(json['userInfo'] as Map<String, dynamic>),
      commentTime: json['commentTime'] as String? ?? "",
      likes: json['likes'] as int? ?? 0,
      liked: json['liked'] as bool? ?? false,
    );

Map<String, dynamic> _$$_RepliesModelToJson(_$_RepliesModel instance) =>
    <String, dynamic>{
      'repliesId': instance.repliesId,
      'content': instance.content,
      'userInfo': instance.userInfo,
      'commentTime': instance.commentTime,
      'likes': instance.likes,
      'liked': instance.liked,
    };
