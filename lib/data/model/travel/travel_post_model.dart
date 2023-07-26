import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:nuri/data/model/profile/user_info/user_info_model.dart';

part 'travel_post_model.freezed.dart';

part 'travel_post_model.g.dart';

@freezed
class TravelPostModel with _$TravelPostModel{
  const factory TravelPostModel({
    @Default(0) int travelId,
    @Default("") String title,
    @Default("") String content,
    @Default(
        UserInfoModel(
            userProfile: "",
            userName: "",
            userId: ""
        )
    ) UserInfoModel userInfo,
    @Default([]) List<String> mainTravel,
    @Default(0) int cost,
    @Default("") String startDate,
    @Default("") String endDate,
    @Default(0) int currentPeople,
    @Default(0) int maxPeople,
    @Default(false) bool applied
  }) = _TravelPostModel;

  factory TravelPostModel.fromJson(Map<String, Object?>json)
  => _$TravelPostModelFromJson(json);
}


