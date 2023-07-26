// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CommentModel _$CommentModelFromJson(Map<String, dynamic> json) {
  return _CommentModel.fromJson(json);
}

/// @nodoc
mixin _$CommentModel {
  int get commentId => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  UserInfoModel get userInfo => throw _privateConstructorUsedError;
  String get commentTime => throw _privateConstructorUsedError;
  int get likes => throw _privateConstructorUsedError;
  bool get liked => throw _privateConstructorUsedError;
  int get totalReplies => throw _privateConstructorUsedError;
  List<RepliesModel> get replies => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentModelCopyWith<CommentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentModelCopyWith<$Res> {
  factory $CommentModelCopyWith(
          CommentModel value, $Res Function(CommentModel) then) =
      _$CommentModelCopyWithImpl<$Res, CommentModel>;
  @useResult
  $Res call(
      {int commentId,
      String content,
      UserInfoModel userInfo,
      String commentTime,
      int likes,
      bool liked,
      int totalReplies,
      List<RepliesModel> replies});

  $UserInfoModelCopyWith<$Res> get userInfo;
}

/// @nodoc
class _$CommentModelCopyWithImpl<$Res, $Val extends CommentModel>
    implements $CommentModelCopyWith<$Res> {
  _$CommentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commentId = null,
    Object? content = null,
    Object? userInfo = null,
    Object? commentTime = null,
    Object? likes = null,
    Object? liked = null,
    Object? totalReplies = null,
    Object? replies = null,
  }) {
    return _then(_value.copyWith(
      commentId: null == commentId
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
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
      totalReplies: null == totalReplies
          ? _value.totalReplies
          : totalReplies // ignore: cast_nullable_to_non_nullable
              as int,
      replies: null == replies
          ? _value.replies
          : replies // ignore: cast_nullable_to_non_nullable
              as List<RepliesModel>,
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
abstract class _$$_CommentModelCopyWith<$Res>
    implements $CommentModelCopyWith<$Res> {
  factory _$$_CommentModelCopyWith(
          _$_CommentModel value, $Res Function(_$_CommentModel) then) =
      __$$_CommentModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int commentId,
      String content,
      UserInfoModel userInfo,
      String commentTime,
      int likes,
      bool liked,
      int totalReplies,
      List<RepliesModel> replies});

  @override
  $UserInfoModelCopyWith<$Res> get userInfo;
}

/// @nodoc
class __$$_CommentModelCopyWithImpl<$Res>
    extends _$CommentModelCopyWithImpl<$Res, _$_CommentModel>
    implements _$$_CommentModelCopyWith<$Res> {
  __$$_CommentModelCopyWithImpl(
      _$_CommentModel _value, $Res Function(_$_CommentModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commentId = null,
    Object? content = null,
    Object? userInfo = null,
    Object? commentTime = null,
    Object? likes = null,
    Object? liked = null,
    Object? totalReplies = null,
    Object? replies = null,
  }) {
    return _then(_$_CommentModel(
      commentId: null == commentId
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
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
      totalReplies: null == totalReplies
          ? _value.totalReplies
          : totalReplies // ignore: cast_nullable_to_non_nullable
              as int,
      replies: null == replies
          ? _value._replies
          : replies // ignore: cast_nullable_to_non_nullable
              as List<RepliesModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CommentModel with DiagnosticableTreeMixin implements _CommentModel {
  const _$_CommentModel(
      {this.commentId = 0,
      this.content = "",
      this.userInfo =
          const UserInfoModel(userProfile: "", userName: "", userId: ""),
      this.commentTime = "",
      this.likes = 0,
      this.liked = false,
      this.totalReplies = 0,
      final List<RepliesModel> replies = const []})
      : _replies = replies;

  factory _$_CommentModel.fromJson(Map<String, dynamic> json) =>
      _$$_CommentModelFromJson(json);

  @override
  @JsonKey()
  final int commentId;
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
  @JsonKey()
  final int totalReplies;
  final List<RepliesModel> _replies;
  @override
  @JsonKey()
  List<RepliesModel> get replies {
    if (_replies is EqualUnmodifiableListView) return _replies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_replies);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CommentModel(commentId: $commentId, content: $content, userInfo: $userInfo, commentTime: $commentTime, likes: $likes, liked: $liked, totalReplies: $totalReplies, replies: $replies)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CommentModel'))
      ..add(DiagnosticsProperty('commentId', commentId))
      ..add(DiagnosticsProperty('content', content))
      ..add(DiagnosticsProperty('userInfo', userInfo))
      ..add(DiagnosticsProperty('commentTime', commentTime))
      ..add(DiagnosticsProperty('likes', likes))
      ..add(DiagnosticsProperty('liked', liked))
      ..add(DiagnosticsProperty('totalReplies', totalReplies))
      ..add(DiagnosticsProperty('replies', replies));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CommentModel &&
            (identical(other.commentId, commentId) ||
                other.commentId == commentId) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.userInfo, userInfo) ||
                other.userInfo == userInfo) &&
            (identical(other.commentTime, commentTime) ||
                other.commentTime == commentTime) &&
            (identical(other.likes, likes) || other.likes == likes) &&
            (identical(other.liked, liked) || other.liked == liked) &&
            (identical(other.totalReplies, totalReplies) ||
                other.totalReplies == totalReplies) &&
            const DeepCollectionEquality().equals(other._replies, _replies));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      commentId,
      content,
      userInfo,
      commentTime,
      likes,
      liked,
      totalReplies,
      const DeepCollectionEquality().hash(_replies));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CommentModelCopyWith<_$_CommentModel> get copyWith =>
      __$$_CommentModelCopyWithImpl<_$_CommentModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CommentModelToJson(
      this,
    );
  }
}

abstract class _CommentModel implements CommentModel {
  const factory _CommentModel(
      {final int commentId,
      final String content,
      final UserInfoModel userInfo,
      final String commentTime,
      final int likes,
      final bool liked,
      final int totalReplies,
      final List<RepliesModel> replies}) = _$_CommentModel;

  factory _CommentModel.fromJson(Map<String, dynamic> json) =
      _$_CommentModel.fromJson;

  @override
  int get commentId;
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
  int get totalReplies;
  @override
  List<RepliesModel> get replies;
  @override
  @JsonKey(ignore: true)
  _$$_CommentModelCopyWith<_$_CommentModel> get copyWith =>
      throw _privateConstructorUsedError;
}
