import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:nuri/data/model/profile/user_info/user_info_model.dart';

part 'travel_my_model.freezed.dart';

part 'travel_my_model.g.dart';

@freezed
class TravelMyModel with _$TravelMyModel{
  const factory TravelMyModel({
    @Default(0) int travelId,
    @Default("") String travelName,
    @Default(false) bool isLeader
  }) = _TravelMyModel;

  factory TravelMyModel.fromJson(Map<String, Object?>json)
  => _$TravelMyModelFromJson(json);
}


