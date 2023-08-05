import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'notification_model.freezed.dart';

part 'notification_model.g.dart';

@freezed
class NotificationModel with _$NotificationModel{
  const factory NotificationModel({
    @Default(0) int notificationId,
    @Default("") String title,
    @Default("") String content,
    PeerInfoModel? peer
  }) = _NotificationModel;

  factory NotificationModel.fromJson(Map<String, Object?>json)
  => _$NotificationModelFromJson(json);
}

@freezed
class PeerInfoModel with _$PeerInfoModel{
  const factory PeerInfoModel({
    @Default("") String peerId,
    @Default("") String peerName,
    @Default("") String peerProfile
  }) = _PeerInfoModel;

  factory PeerInfoModel.fromJson(Map<String, Object?>json)
  => _$PeerInfoModelFromJson(json);
}