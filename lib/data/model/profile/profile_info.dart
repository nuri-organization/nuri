import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'profile_info.freezed.dart';

part 'profile_info.g.dart';

@freezed
class ProfileInfo with _$ProfileInfo{
  const factory ProfileInfo({
    @Default(null) String? user_profile,
    @Default("유저") String user_name,
    @Default("자기소개") String? introduce,
    @Default("최고의 여행지") String? best_travel,
    @Default(0) int post_amount,
    @Default(null) PostGrid? posts,
    @Default(0) int flowing,
    @Default(0) int flower
}) = _ProfileInfo;

  factory ProfileInfo.fromJson(Map<String, Object?>json)
    => _$ProfileInfoFromJson(json);
}


@freezed
class PostGrid with _$PostGrid{
  const factory PostGrid({
    @Default(0) int post_id,
    @Default("") String first_image
  }) = _PostGrid;

  factory PostGrid.fromJson(Map<String, Object?>json)
  => _$PostGridFromJson(json);
}