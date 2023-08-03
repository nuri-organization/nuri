import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'notification_model.freezed.dart';

part 'notification_model.g.dart';

@freezed
class NotificationModel with _$NotificationModel{
  const factory NotificationModel({
    int? id,
    final int? type,
    final String? timestamp,
    final DateTime? date,
    final String? title,
    final int? myId,
    final String? myNickname,
    final int? peerId,
    final String? peerNickname,
    final String? contents,
    final bool? read,
    final String? fcmToken,
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, Object?>json)
  => _$NotificationModelFromJson(json);
}