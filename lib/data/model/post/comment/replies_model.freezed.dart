// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'replies_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RepliesModel _$RepliesModelFromJson(Map<String, dynamic> json) {
  return _RepliesModel.fromJson(json);
}

/// @nodoc
mixin _$RepliesModel {
  int get repliesId => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  UserInfoModel get userInfo => throw _privateConstructorUsedError;
  String get commentTime => throw _privateConstructorUsedError;
  int get likes => throw _privateConstructorUsedError;
  bool get liked => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RepliesModelCopyWith<RepliesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepliesModelCopyWith<$Res> {
  factory $RepliesModelCopyWith(
          RepliesModel value, $Res Function(RepliesModel) then) =
      _$RepliesModelCopyWithImpl<$Res, RepliesModel>;
  @useResult
  $Res call(
      {int repliesId,
      String content,
      UserInfoModel userInfo,
      String commentTime,
      int likes,
      bool liked});

  $UserInfoModelCopyWith<$Res> get userInfo;
}

/// @nodoc
class _$RepliesModelCopyWithImpl<$Res, $Val extends RepliesModel>
    implements $RepliesModelCopyWith<$Res> {
  _$RepliesModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? repliesId = null,
    Object? content = null,
    Object? userInfo = null,
    Object? commentTime = null,
    Object? likes = null,
    Object? liked = null,
  }) {
    return _then(_value.copyWith(
      repliesId: null == repliesId
          ? _value.repliesId
          : repliesId // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      userInfo: null == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserInfoModel,
      commentTime: null == commentTime
          ? _value.commentTime
          : commentTime // ignore: cast_nullable_to_non_nullable
              as String,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
      liked: null == liked
          ? _value.liked
          : liked // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserInfoModelCopyWith<$Res> get userInfo {
    return $UserInfoModelCopyWith<$Res>(_value.userInfo, (value) {
      return _then(_value.copyWith(userInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_RepliesModelCopyWith<$Res>
    implements $RepliesModelCopyWith<$Res> {
  factory _$$_RepliesModelCopyWith(
          _$_RepliesModel value, $Res Function(_$_RepliesModel) then) =
      __$$_RepliesModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int repliesId,
      String content,
      UserInfoModel userInfo,
      String commentTime,
      int likes,
      bool liked});

  @override
  $UserInfoModelCopyWith<$Res> get userInfo;
}

/// @nodoc
class __$$_RepliesModelCopyWithImpl<$Res>
    extends _$RepliesModelCopyWithImpl<$Res, _$_RepliesModel>
    implements _$$_RepliesModelCopyWith<$Res> {
  __$$_RepliesModelCopyWithImpl(
      _$_RepliesModel _value, $Res Function(_$_RepliesModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? repliesId = null,
    Object? content = null,
    Object? userInfo = null,
    Object? commentTime = null,
    Object? likes = null,
    Object? liked = null,
  }) {
    return _then(_$_RepliesModel(
      repliesId: null == repliesId
          ? _value.repliesId
          : repliesId // ignore: cast_nullable_to_non_nullable
              as int,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      userInfo: null == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserInfoModel,
      commentTime: null == commentTime
          ? _value.commentTime
          : commentTime // ignore: cast_nullable_to_non_nullable
              as String,
      likes: null == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as int,
      liked: null == liked
          ? _value.liked
          : liked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RepliesModel with DiagnosticableTreeMixin implements _RepliesModel {
  const _$_RepliesModel(
      {this.repliesId = 1,
      this.content = "",
      this.userInfo =
          const UserInfoModel(userId: 0, userName: "", userProfile: ""),
      this.commentTime = "",
      this.likes = 0,
      this.liked = false});

  factory _$_RepliesModel.fromJson(Map<String, dynamic> json) =>
      _$$_RepliesModelFromJson(json);

  @override
  @JsonKey()
  final int repliesId;
  @override
  @JsonKey()
  final String content;
  @override
  @JsonKey()
  final UserInfoModel userInfo;
  @override
  @JsonKey()
  final String commentTime;
  @override
  @JsonKey()
  final int likes;
  @override
  @JsonKey()
  final bool liked;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RepliesModel(repliesId: $repliesId, content: $content, userInfo: $userInfo, commentTime: $commentTime, likes: $likes, liked: $liked)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RepliesModel'))
      ..add(DiagnosticsProperty('repliesId', repliesId))
      ..add(DiagnosticsProperty('content', content))
      ..add(DiagnosticsProperty('userInfo', userInfo))
      ..add(DiagnosticsProperty('commentTime', commentTime))
      ..add(DiagnosticsProperty('likes', likes))
      ..add(DiagnosticsProperty('liked', liked));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RepliesModel &&
            (identical(other.repliesId, repliesId) ||
                other.repliesId == repliesId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.userInfo, userInfo) ||
                other.userInfo == userInfo) &&
            (identical(other.commentTime, commentTime) ||
                other.commentTime == commentTime) &&
            (identical(other.likes, likes) || other.likes == likes) &&
            (identical(other.liked, liked) || other.liked == liked));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, repliesId, content, userInfo, commentTime, likes, liked);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RepliesModelCopyWith<_$_RepliesModel> get copyWith =>
      __$$_RepliesModelCopyWithImpl<_$_RepliesModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RepliesModelToJson(
      this,
    );
  }
}

abstract class _RepliesModel implements RepliesModel {
  const factory _RepliesModel(
      {final int repliesId,
      final String content,
      final UserInfoModel userInfo,
      final String commentTime,
      final int likes,
      final bool liked}) = _$_RepliesModel;

  factory _RepliesModel.fromJson(Map<String, dynamic> json) =
      _$_RepliesModel.fromJson;

  @override
  int get repliesId;
  @override
  String get content;
  @override
  UserInfoModel get userInfo;
  @override
  String get commentTime;
  @override
  int get likes;
  @override
  bool get liked;
  @override
  @JsonKey(ignore: true)
  _$$_RepliesModelCopyWith<_$_RepliesModel> get copyWith =>
      throw _privateConstructorUsedError;
}
