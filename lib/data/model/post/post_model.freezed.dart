// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostModel _$PostModelFromJson(Map<String, dynamic> json) {
  return _PostModel.fromJson(json);
}

/// @nodoc
mixin _$PostModel {
  int get postId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  List<ShortoryModel> get shotory => throw _privateConstructorUsedError;
  UserInfoModel get userInfo => throw _privateConstructorUsedError;
  dynamic get likes => throw _privateConstructorUsedError;
  dynamic get liked => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostModelCopyWith<PostModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostModelCopyWith<$Res> {
  factory $PostModelCopyWith(PostModel value, $Res Function(PostModel) then) =
      _$PostModelCopyWithImpl<$Res, PostModel>;
  @useResult
  $Res call(
      {int postId,
      String title,
      String content,
      List<ShortoryModel> shotory,
      UserInfoModel userInfo,
      dynamic likes,
      dynamic liked});

  $UserInfoModelCopyWith<$Res> get userInfo;
}

/// @nodoc
class _$PostModelCopyWithImpl<$Res, $Val extends PostModel>
    implements $PostModelCopyWith<$Res> {
  _$PostModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = null,
    Object? title = null,
    Object? content = null,
    Object? shotory = null,
    Object? userInfo = null,
    Object? likes = freezed,
    Object? liked = freezed,
  }) {
    return _then(_value.copyWith(
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      shotory: null == shotory
          ? _value.shotory
          : shotory // ignore: cast_nullable_to_non_nullable
              as List<ShortoryModel>,
      userInfo: null == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserInfoModel,
      likes: freezed == likes
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as dynamic,
      liked: freezed == liked
          ? _value.liked
          : liked // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
abstract class _$$_PostModelCopyWith<$Res> implements $PostModelCopyWith<$Res> {
  factory _$$_PostModelCopyWith(
          _$_PostModel value, $Res Function(_$_PostModel) then) =
      __$$_PostModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int postId,
      String title,
      String content,
      List<ShortoryModel> shotory,
      UserInfoModel userInfo,
      dynamic likes,
      dynamic liked});

  @override
  $UserInfoModelCopyWith<$Res> get userInfo;
}

/// @nodoc
class __$$_PostModelCopyWithImpl<$Res>
    extends _$PostModelCopyWithImpl<$Res, _$_PostModel>
    implements _$$_PostModelCopyWith<$Res> {
  __$$_PostModelCopyWithImpl(
      _$_PostModel _value, $Res Function(_$_PostModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postId = null,
    Object? title = null,
    Object? content = null,
    Object? shotory = null,
    Object? userInfo = null,
    Object? likes = freezed,
    Object? liked = freezed,
  }) {
    return _then(_$_PostModel(
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      shotory: null == shotory
          ? _value._shotory
          : shotory // ignore: cast_nullable_to_non_nullable
              as List<ShortoryModel>,
      userInfo: null == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserInfoModel,
      likes: freezed == likes ? _value.likes! : likes,
      liked: freezed == liked ? _value.liked! : liked,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PostModel with DiagnosticableTreeMixin implements _PostModel {
  const _$_PostModel(
      {this.postId = 0,
      this.title = "",
      this.content = "",
      final List<ShortoryModel> shotory = const [],
      this.userInfo =
          const UserInfoModel(userId: "", userName: "", userProfile: ""),
      this.likes = 0,
      this.liked = false})
      : _shotory = shotory;

  factory _$_PostModel.fromJson(Map<String, dynamic> json) =>
      _$$_PostModelFromJson(json);

  @override
  @JsonKey()
  final int postId;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String content;
  final List<ShortoryModel> _shotory;
  @override
  @JsonKey()
  List<ShortoryModel> get shotory {
    if (_shotory is EqualUnmodifiableListView) return _shotory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shotory);
  }

  @override
  @JsonKey()
  final UserInfoModel userInfo;
  @override
  @JsonKey()
  final dynamic likes;
  @override
  @JsonKey()
  final dynamic liked;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PostModel(postId: $postId, title: $title, content: $content, shotory: $shotory, userInfo: $userInfo, likes: $likes, liked: $liked)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PostModel'))
      ..add(DiagnosticsProperty('postId', postId))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('content', content))
      ..add(DiagnosticsProperty('shotory', shotory))
      ..add(DiagnosticsProperty('userInfo', userInfo))
      ..add(DiagnosticsProperty('likes', likes))
      ..add(DiagnosticsProperty('liked', liked));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostModel &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality().equals(other._shotory, _shotory) &&
            (identical(other.userInfo, userInfo) ||
                other.userInfo == userInfo) &&
            const DeepCollectionEquality().equals(other.likes, likes) &&
            const DeepCollectionEquality().equals(other.liked, liked));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      postId,
      title,
      content,
      const DeepCollectionEquality().hash(_shotory),
      userInfo,
      const DeepCollectionEquality().hash(likes),
      const DeepCollectionEquality().hash(liked));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostModelCopyWith<_$_PostModel> get copyWith =>
      __$$_PostModelCopyWithImpl<_$_PostModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostModelToJson(
      this,
    );
  }
}

abstract class _PostModel implements PostModel {
  const factory _PostModel(
      {final int postId,
      final String title,
      final String content,
      final List<ShortoryModel> shotory,
      final UserInfoModel userInfo,
      final dynamic likes,
      final dynamic liked}) = _$_PostModel;

  factory _PostModel.fromJson(Map<String, dynamic> json) =
      _$_PostModel.fromJson;

  @override
  int get postId;
  @override
  String get title;
  @override
  String get content;
  @override
  List<ShortoryModel> get shotory;
  @override
  UserInfoModel get userInfo;
  @override
  dynamic get likes;
  @override
  dynamic get liked;
  @override
  @JsonKey(ignore: true)
  _$$_PostModelCopyWith<_$_PostModel> get copyWith =>
      throw _privateConstructorUsedError;
}

ShortoryModel _$ShortoryModelFromJson(Map<String, dynamic> json) {
  return _ShortoryModel.fromJson(json);
}

/// @nodoc
mixin _$ShortoryModel {
  String get url => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShortoryModelCopyWith<ShortoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShortoryModelCopyWith<$Res> {
  factory $ShortoryModelCopyWith(
          ShortoryModel value, $Res Function(ShortoryModel) then) =
      _$ShortoryModelCopyWithImpl<$Res, ShortoryModel>;
  @useResult
  $Res call({String url, String content});
}

/// @nodoc
class _$ShortoryModelCopyWithImpl<$Res, $Val extends ShortoryModel>
    implements $ShortoryModelCopyWith<$Res> {
  _$ShortoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ShortoryModelCopyWith<$Res>
    implements $ShortoryModelCopyWith<$Res> {
  factory _$$_ShortoryModelCopyWith(
          _$_ShortoryModel value, $Res Function(_$_ShortoryModel) then) =
      __$$_ShortoryModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String url, String content});
}

/// @nodoc
class __$$_ShortoryModelCopyWithImpl<$Res>
    extends _$ShortoryModelCopyWithImpl<$Res, _$_ShortoryModel>
    implements _$$_ShortoryModelCopyWith<$Res> {
  __$$_ShortoryModelCopyWithImpl(
      _$_ShortoryModel _value, $Res Function(_$_ShortoryModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? content = null,
  }) {
    return _then(_$_ShortoryModel(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ShortoryModel with DiagnosticableTreeMixin implements _ShortoryModel {
  const _$_ShortoryModel({this.url = "", this.content = ""});

  factory _$_ShortoryModel.fromJson(Map<String, dynamic> json) =>
      _$$_ShortoryModelFromJson(json);

  @override
  @JsonKey()
  final String url;
  @override
  @JsonKey()
  final String content;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ShortoryModel(url: $url, content: $content)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ShortoryModel'))
      ..add(DiagnosticsProperty('url', url))
      ..add(DiagnosticsProperty('content', content));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShortoryModel &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, url, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ShortoryModelCopyWith<_$_ShortoryModel> get copyWith =>
      __$$_ShortoryModelCopyWithImpl<_$_ShortoryModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ShortoryModelToJson(
      this,
    );
  }
}

abstract class _ShortoryModel implements ShortoryModel {
  const factory _ShortoryModel({final String url, final String content}) =
      _$_ShortoryModel;

  factory _ShortoryModel.fromJson(Map<String, dynamic> json) =
      _$_ShortoryModel.fromJson;

  @override
  String get url;
  @override
  String get content;
  @override
  @JsonKey(ignore: true)
  _$$_ShortoryModelCopyWith<_$_ShortoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}
