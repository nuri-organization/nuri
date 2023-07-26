// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travel_post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TravelPostModel _$$_TravelPostModelFromJson(Map<String, dynamic> json) =>
    _$_TravelPostModel(
      travelId: json['travelId'] as int? ?? 0,
      title: json['title'] as String? ?? "",
      content: json['content'] as String? ?? "",
      userInfo: json['userInfo'] == null
          ? const UserInfoModel(userProfile: "", userName: "", userId: "")
          : UserInfoModel.fromJson(json['userInfo'] as Map<String, dynamic>),
      mainTravel: (json['mainTravel'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      cost: json['cost'] as int? ?? 0,
      startDate: json['startDate'] as String? ?? "",
      endDate: json['endDate'] as String? ?? "",
      currentPeople: json['currentPeople'] as int? ?? 0,
      maxPeople: json['maxPeople'] as int? ?? 0,
      applied: json['applied'] as bool? ?? false,
    );

Map<String, dynamic> _$$_TravelPostModelToJson(_$_TravelPostModel instance) =>
    <String, dynamic>{
      'travelId': instance.travelId,
      'title': instance.title,
      'content': instance.content,
      'userInfo': instance.userInfo,
      'mainTravel': instance.mainTravel,
      'cost': instance.cost,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'currentPeople': instance.currentPeople,
      'maxPeople': instance.maxPeople,
      'applied': instance.applied,
    };
