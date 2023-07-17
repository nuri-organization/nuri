// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProfileInfo _$$_ProfileInfoFromJson(Map<String, dynamic> json) =>
    _$_ProfileInfo(
      user_profile: json['user_profile'] as String? ?? null,
      user_name: json['user_name'] as String? ?? "유저",
      introduce: json['introduce'] as String? ?? "자기소개",
      best_travel: json['best_travel'] as String? ?? "최고의 여행지",
      post_amount: json['post_amount'] as int? ?? 0,
      posts: json['posts'] == null
          ? null
          : PostGrid.fromJson(json['posts'] as Map<String, dynamic>),
      flowing: json['flowing'] as int? ?? 0,
      flower: json['flower'] as int? ?? 0,
    );

Map<String, dynamic> _$$_ProfileInfoToJson(_$_ProfileInfo instance) =>
    <String, dynamic>{
      'user_profile': instance.user_profile,
      'user_name': instance.user_name,
      'introduce': instance.introduce,
      'best_travel': instance.best_travel,
      'post_amount': instance.post_amount,
      'posts': instance.posts,
      'flowing': instance.flowing,
      'flower': instance.flower,
    };

_$_PostGrid _$$_PostGridFromJson(Map<String, dynamic> json) => _$_PostGrid(
      post_id: json['post_id'] as int? ?? 0,
      first_image: json['first_image'] as String? ?? "",
    );

Map<String, dynamic> _$$_PostGridToJson(_$_PostGrid instance) =>
    <String, dynamic>{
      'post_id': instance.post_id,
      'first_image': instance.first_image,
    };
