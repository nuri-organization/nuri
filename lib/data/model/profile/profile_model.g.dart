// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProfileModel _$$_ProfileModelFromJson(Map<String, dynamic> json) =>
    _$_ProfileModel(
      userProfile: json['userProfile'] as String? ?? null,
      userName: json['userName'] as String? ?? "유저",
      introduce: json['introduce'] as String? ?? "자기소개",
      bestTravel: json['bestTravel'] as String? ?? "최고의 여행지",
      postAmount: json['postAmount'] as int? ?? 0,
      posts: (json['posts'] as List<dynamic>?)
              ?.map((e) => e == null
                  ? null
                  : PostGrid.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      flowing: json['flowing'] as int? ?? 0,
      flower: json['flower'] as int? ?? 0,
    );

Map<String, dynamic> _$$_ProfileModelToJson(_$_ProfileModel instance) =>
    <String, dynamic>{
      'userProfile': instance.userProfile,
      'userName': instance.userName,
      'introduce': instance.introduce,
      'bestTravel': instance.bestTravel,
      'postAmount': instance.postAmount,
      'posts': instance.posts,
      'flowing': instance.flowing,
      'flower': instance.flower,
    };

_$_PostGrid _$$_PostGridFromJson(Map<String, dynamic> json) => _$_PostGrid(
      postId: json['postId'] as int? ?? 0,
      firstImage: json['firstImage'] as String? ?? "",
    );

Map<String, dynamic> _$$_PostGridToJson(_$_PostGrid instance) =>
    <String, dynamic>{
      'postId': instance.postId,
      'firstImage': instance.firstImage,
    };
