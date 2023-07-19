import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'profile_model.freezed.dart';

part 'profile_model.g.dart';

@freezed
class ProfileModel with _$ProfileModel{
  const factory ProfileModel({
    @Default(null) String? userProfile,
    @Default("유저") String userName,
    @Default("자기소개") String? introduce,
    @Default("최고의 여행지") String? bestTravel,
    @Default(0) int postAmount,
    /// TODO : List value
    @Default([]) List<PostGrid?> posts,
    @Default(0) int flowing,
    @Default(0) int flower
}) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, Object?>json)
    => _$ProfileModelFromJson(json);
}


@freezed
class PostGrid with _$PostGrid{
  const factory PostGrid({
    @Default(0) int postId,
    @Default("") String firstImage
  }) = _PostGrid;

  factory PostGrid.fromJson(Map<String, Object?>json)
  => _$PostGridFromJson(json);
}