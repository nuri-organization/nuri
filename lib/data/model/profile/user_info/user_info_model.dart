import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user_info_model.freezed.dart';

part 'user_info_model.g.dart';

@freezed
class UserInfoModel with _$UserInfoModel{
  const factory UserInfoModel({
    @Default("") String userId,
    @Default("") String userName,
    @Default(null) String? userProfile
  }) = _UserInfoModel;

  factory UserInfoModel.fromJson(Map<String, Object?>json)
  => _$UserInfoModelFromJson(json);
}