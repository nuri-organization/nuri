// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NotificationModel _$$_NotificationModelFromJson(Map<String, dynamic> json) =>
    _$_NotificationModel(
      notificationId: json['notificationId'] as int? ?? 0,
      title: json['title'] as String? ?? "",
      content: json['content'] as String? ?? "",
      peer: json['peer'] == null
          ? null
          : PeerInfoModel.fromJson(json['peer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_NotificationModelToJson(
        _$_NotificationModel instance) =>
    <String, dynamic>{
      'notificationId': instance.notificationId,
      'title': instance.title,
      'content': instance.content,
      'peer': instance.peer,
    };

_$_PeerInfoModel _$$_PeerInfoModelFromJson(Map<String, dynamic> json) =>
    _$_PeerInfoModel(
      peerId: json['peerId'] as String? ?? "",
      peerName: json['peerName'] as String? ?? "",
      peerProfile: json['peerProfile'] as String? ?? "",
    );

Map<String, dynamic> _$$_PeerInfoModelToJson(_$_PeerInfoModel instance) =>
    <String, dynamic>{
      'peerId': instance.peerId,
      'peerName': instance.peerName,
      'peerProfile': instance.peerProfile,
    };
