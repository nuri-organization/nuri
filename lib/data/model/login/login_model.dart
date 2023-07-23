import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:nuri/data/model/profile/user_info/user_info_model.dart';

part 'login_model.freezed.dart';

part 'login_model.g.dart';

@freezed
class LoginModel with _$LoginModel{
  const factory LoginModel({
   @Default("") String loginId,
    @Default("") String loginPassword

  }) = _LoginModel;

  factory LoginModel.fromJson(Map<String, Object?>json)
  => _$LoginModelFromJson(json);
}