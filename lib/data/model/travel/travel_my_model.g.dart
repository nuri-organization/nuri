// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travel_my_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TravelMyModel _$$_TravelMyModelFromJson(Map<String, dynamic> json) =>
    _$_TravelMyModel(
      travelId: json['travelId'] as int? ?? 0,
      travelName: json['travelName'] as String? ?? "",
      isLeader: json['isLeader'] as bool? ?? false,
    );

Map<String, dynamic> _$$_TravelMyModelToJson(_$_TravelMyModel instance) =>
    <String, dynamic>{
      'travelId': instance.travelId,
      'travelName': instance.travelName,
      'isLeader': instance.isLeader,
    };
