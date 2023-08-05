// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) {
  return _NotificationModel.fromJson(json);
}

/// @nodoc
mixin _$NotificationModel {
  int get notificationId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  PeerInfoModel? get peer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationModelCopyWith<NotificationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationModelCopyWith<$Res> {
  factory $NotificationModelCopyWith(
          NotificationModel value, $Res Function(NotificationModel) then) =
      _$NotificationModelCopyWithImpl<$Res, NotificationModel>;
  @useResult
  $Res call(
      {int notificationId, String title, String content, PeerInfoModel? peer});

  $PeerInfoModelCopyWith<$Res>? get peer;
}

/// @nodoc
class _$NotificationModelCopyWithImpl<$Res, $Val extends NotificationModel>
    implements $NotificationModelCopyWith<$Res> {
  _$NotificationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationId = null,
    Object? title = null,
    Object? content = null,
    Object? peer = freezed,
  }) {
    return _then(_value.copyWith(
      notificationId: null == notificationId
          ? _value.notificationId
          : notificationId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      peer: freezed == peer
          ? _value.peer
          : peer // ignore: cast_nullable_to_non_nullable
              as PeerInfoModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PeerInfoModelCopyWith<$Res>? get peer {
    if (_value.peer == null) {
      return null;
    }

    return $PeerInfoModelCopyWith<$Res>(_value.peer!, (value) {
      return _then(_value.copyWith(peer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_NotificationModelCopyWith<$Res>
    implements $NotificationModelCopyWith<$Res> {
  factory _$$_NotificationModelCopyWith(_$_NotificationModel value,
          $Res Function(_$_NotificationModel) then) =
      __$$_NotificationModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int notificationId, String title, String content, PeerInfoModel? peer});

  @override
  $PeerInfoModelCopyWith<$Res>? get peer;
}

/// @nodoc
class __$$_NotificationModelCopyWithImpl<$Res>
    extends _$NotificationModelCopyWithImpl<$Res, _$_NotificationModel>
    implements _$$_NotificationModelCopyWith<$Res> {
  __$$_NotificationModelCopyWithImpl(
      _$_NotificationModel _value, $Res Function(_$_NotificationModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notificationId = null,
    Object? title = null,
    Object? content = null,
    Object? peer = freezed,
  }) {
    return _then(_$_NotificationModel(
      notificationId: null == notificationId
          ? _value.notificationId
          : notificationId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      peer: freezed == peer
          ? _value.peer
          : peer // ignore: cast_nullable_to_non_nullable
              as PeerInfoModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotificationModel
    with DiagnosticableTreeMixin
    implements _NotificationModel {
  const _$_NotificationModel(
      {this.notificationId = 0, this.title = "", this.content = "", this.peer});

  factory _$_NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$$_NotificationModelFromJson(json);

  @override
  @JsonKey()
  final int notificationId;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String content;
  @override
  final PeerInfoModel? peer;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'NotificationModel(notificationId: $notificationId, title: $title, content: $content, peer: $peer)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'NotificationModel'))
      ..add(DiagnosticsProperty('notificationId', notificationId))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('content', content))
      ..add(DiagnosticsProperty('peer', peer));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotificationModel &&
            (identical(other.notificationId, notificationId) ||
                other.notificationId == notificationId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.peer, peer) || other.peer == peer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, notificationId, title, content, peer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotificationModelCopyWith<_$_NotificationModel> get copyWith =>
      __$$_NotificationModelCopyWithImpl<_$_NotificationModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotificationModelToJson(
      this,
    );
  }
}

abstract class _NotificationModel implements NotificationModel {
  const factory _NotificationModel(
      {final int notificationId,
      final String title,
      final String content,
      final PeerInfoModel? peer}) = _$_NotificationModel;

  factory _NotificationModel.fromJson(Map<String, dynamic> json) =
      _$_NotificationModel.fromJson;

  @override
  int get notificationId;
  @override
  String get title;
  @override
  String get content;
  @override
  PeerInfoModel? get peer;
  @override
  @JsonKey(ignore: true)
  _$$_NotificationModelCopyWith<_$_NotificationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

PeerInfoModel _$PeerInfoModelFromJson(Map<String, dynamic> json) {
  return _PeerInfoModel.fromJson(json);
}

/// @nodoc
mixin _$PeerInfoModel {
  String get peerId => throw _privateConstructorUsedError;
  String get peerName => throw _privateConstructorUsedError;
  String get peerProfile => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PeerInfoModelCopyWith<PeerInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PeerInfoModelCopyWith<$Res> {
  factory $PeerInfoModelCopyWith(
          PeerInfoModel value, $Res Function(PeerInfoModel) then) =
      _$PeerInfoModelCopyWithImpl<$Res, PeerInfoModel>;
  @useResult
  $Res call({String peerId, String peerName, String peerProfile});
}

/// @nodoc
class _$PeerInfoModelCopyWithImpl<$Res, $Val extends PeerInfoModel>
    implements $PeerInfoModelCopyWith<$Res> {
  _$PeerInfoModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? peerId = null,
    Object? peerName = null,
    Object? peerProfile = null,
  }) {
    return _then(_value.copyWith(
      peerId: null == peerId
          ? _value.peerId
          : peerId // ignore: cast_nullable_to_non_nullable
              as String,
      peerName: null == peerName
          ? _value.peerName
          : peerName // ignore: cast_nullable_to_non_nullable
              as String,
      peerProfile: null == peerProfile
          ? _value.peerProfile
          : peerProfile // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PeerInfoModelCopyWith<$Res>
    implements $PeerInfoModelCopyWith<$Res> {
  factory _$$_PeerInfoModelCopyWith(
          _$_PeerInfoModel value, $Res Function(_$_PeerInfoModel) then) =
      __$$_PeerInfoModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String peerId, String peerName, String peerProfile});
}

/// @nodoc
class __$$_PeerInfoModelCopyWithImpl<$Res>
    extends _$PeerInfoModelCopyWithImpl<$Res, _$_PeerInfoModel>
    implements _$$_PeerInfoModelCopyWith<$Res> {
  __$$_PeerInfoModelCopyWithImpl(
      _$_PeerInfoModel _value, $Res Function(_$_PeerInfoModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? peerId = null,
    Object? peerName = null,
    Object? peerProfile = null,
  }) {
    return _then(_$_PeerInfoModel(
      peerId: null == peerId
          ? _value.peerId
          : peerId // ignore: cast_nullable_to_non_nullable
              as String,
      peerName: null == peerName
          ? _value.peerName
          : peerName // ignore: cast_nullable_to_non_nullable
              as String,
      peerProfile: null == peerProfile
          ? _value.peerProfile
          : peerProfile // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PeerInfoModel with DiagnosticableTreeMixin implements _PeerInfoModel {
  const _$_PeerInfoModel(
      {this.peerId = "", this.peerName = "", this.peerProfile = ""});

  factory _$_PeerInfoModel.fromJson(Map<String, dynamic> json) =>
      _$$_PeerInfoModelFromJson(json);

  @override
  @JsonKey()
  final String peerId;
  @override
  @JsonKey()
  final String peerName;
  @override
  @JsonKey()
  final String peerProfile;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PeerInfoModel(peerId: $peerId, peerName: $peerName, peerProfile: $peerProfile)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PeerInfoModel'))
      ..add(DiagnosticsProperty('peerId', peerId))
      ..add(DiagnosticsProperty('peerName', peerName))
      ..add(DiagnosticsProperty('peerProfile', peerProfile));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PeerInfoModel &&
            (identical(other.peerId, peerId) || other.peerId == peerId) &&
            (identical(other.peerName, peerName) ||
                other.peerName == peerName) &&
            (identical(other.peerProfile, peerProfile) ||
                other.peerProfile == peerProfile));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, peerId, peerName, peerProfile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PeerInfoModelCopyWith<_$_PeerInfoModel> get copyWith =>
      __$$_PeerInfoModelCopyWithImpl<_$_PeerInfoModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PeerInfoModelToJson(
      this,
    );
  }
}

abstract class _PeerInfoModel implements PeerInfoModel {
  const factory _PeerInfoModel(
      {final String peerId,
      final String peerName,
      final String peerProfile}) = _$_PeerInfoModel;

  factory _PeerInfoModel.fromJson(Map<String, dynamic> json) =
      _$_PeerInfoModel.fromJson;

  @override
  String get peerId;
  @override
  String get peerName;
  @override
  String get peerProfile;
  @override
  @JsonKey(ignore: true)
  _$$_PeerInfoModelCopyWith<_$_PeerInfoModel> get copyWith =>
      throw _privateConstructorUsedError;
}
