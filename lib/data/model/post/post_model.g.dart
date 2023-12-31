// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostModel _$$_PostModelFromJson(Map<String, dynamic> json) => _$_PostModel(
      postId: json['postId'] as int? ?? 0,
      title: json['title'] as String? ?? "",
      content: json['content'] as String? ?? "",
      shotory: (json['shotory'] as List<dynamic>?)
              ?.map((e) => ShortoryModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      userInfo: json['userInfo'] == null
          ? const UserInfoModel(userId: "", userName: "", userProfile: "")
          : UserInfoModel.fromJson(json['userInfo'] as Map<String, dynamic>),
      likes: json['likes'] ?? 0,
      liked: json['liked'] ?? false,
    );

Map<String, dynamic> _$$_PostModelToJson(_$_PostModel instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'title': instance.title,
      'content': instance.content,
      'shotory': instance.shotory,
      'userInfo': instance.userInfo,
      'likes': instance.likes,
      'liked': instance.liked,
    };

_$_ShortoryModel _$$_ShortoryModelFromJson(Map<String, dynamic> json) =>
    _$_ShortoryModel(
      url: json['url'] as String? ?? "",
      content: json['content'] as String? ?? "",
    );

Map<String, dynamic> _$$_ShortoryModelToJson(_$_ShortoryModel instance) =>
    <String, dynamic>{
      'url': instance.url,
      'content': instance.content,
    };
