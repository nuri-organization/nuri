// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotificationModel _$$_NotificationModelFromJson(Map<String, dynamic> json) =>
    _$_NotificationModel(
      id: json['id'] as int?,
      type: json['type'] as int?,
      timestamp: json['timestamp'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      title: json['title'] as String?,
      myId: json['myId'] as int?,
      myNickname: json['myNickname'] as String?,
      peerId: json['peerId'] as int?,
      peerNickname: json['peerNickname'] as String?,
      contents: json['contents'] as String?,
      read: json['read'] as bool?,
      fcmToken: json['fcmToken'] as String?,
    );

Map<String, dynamic> _$$_NotificationModelToJson(
        _$_NotificationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'timestamp': instance.timestamp,
      'date': instance.date?.toIso8601String(),
      'title': instance.title,
      'myId': instance.myId,
      'myNickname': instance.myNickname,
      'peerId': instance.peerId,
      'peerNickname': instance.peerNickname,
      'contents': instance.contents,
      'read': instance.read,
      'fcmToken': instance.fcmToken,
    };
