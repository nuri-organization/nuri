// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProfileInfo _$ProfileInfoFromJson(Map<String, dynamic> json) {
  return _ProfileInfo.fromJson(json);
}

/// @nodoc
mixin _$ProfileInfo {
  String? get user_profile => throw _privateConstructorUsedError;
  String get user_name => throw _privateConstructorUsedError;
  String? get introduce => throw _privateConstructorUsedError;
  String? get best_travel => throw _privateConstructorUsedError;
  int get post_amount => throw _privateConstructorUsedError;
  PostGrid? get posts => throw _privateConstructorUsedError;
  int get flowing => throw _privateConstructorUsedError;
  int get flower => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileInfoCopyWith<ProfileInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileInfoCopyWith<$Res> {
  factory $ProfileInfoCopyWith(
          ProfileInfo value, $Res Function(ProfileInfo) then) =
      _$ProfileInfoCopyWithImpl<$Res, ProfileInfo>;
  @useResult
  $Res call(
      {String? user_profile,
      String user_name,
      String? introduce,
      String? best_travel,
      int post_amount,
      PostGrid? posts,
      int flowing,
      int flower});

  $PostGridCopyWith<$Res>? get posts;
}

/// @nodoc
class _$ProfileInfoCopyWithImpl<$Res, $Val extends ProfileInfo>
    implements $ProfileInfoCopyWith<$Res> {
  _$ProfileInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user_profile = freezed,
    Object? user_name = null,
    Object? introduce = freezed,
    Object? best_travel = freezed,
    Object? post_amount = null,
    Object? posts = freezed,
    Object? flowing = null,
    Object? flower = null,
  }) {
    return _then(_value.copyWith(
      user_profile: freezed == user_profile
          ? _value.user_profile
          : user_profile // ignore: cast_nullable_to_non_nullable
              as String?,
      user_name: null == user_name
          ? _value.user_name
          : user_name // ignore: cast_nullable_to_non_nullable
              as String,
      introduce: freezed == introduce
          ? _value.introduce
          : introduce // ignore: cast_nullable_to_non_nullable
              as String?,
      best_travel: freezed == best_travel
          ? _value.best_travel
          : best_travel // ignore: cast_nullable_to_non_nullable
              as String?,
      post_amount: null == post_amount
          ? _value.post_amount
          : post_amount // ignore: cast_nullable_to_non_nullable
              as int,
      posts: freezed == posts
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as PostGrid?,
      flowing: null == flowing
          ? _value.flowing
          : flowing // ignore: cast_nullable_to_non_nullable
              as int,
      flower: null == flower
          ? _value.flower
          : flower // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PostGridCopyWith<$Res>? get posts {
    if (_value.posts == null) {
      return null;
    }

    return $PostGridCopyWith<$Res>(_value.posts!, (value) {
      return _then(_value.copyWith(posts: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ProfileInfoCopyWith<$Res>
    implements $ProfileInfoCopyWith<$Res> {
  factory _$$_ProfileInfoCopyWith(
          _$_ProfileInfo value, $Res Function(_$_ProfileInfo) then) =
      __$$_ProfileInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? user_profile,
      String user_name,
      String? introduce,
      String? best_travel,
      int post_amount,
      PostGrid? posts,
      int flowing,
      int flower});

  @override
  $PostGridCopyWith<$Res>? get posts;
}

/// @nodoc
class __$$_ProfileInfoCopyWithImpl<$Res>
    extends _$ProfileInfoCopyWithImpl<$Res, _$_ProfileInfo>
    implements _$$_ProfileInfoCopyWith<$Res> {
  __$$_ProfileInfoCopyWithImpl(
      _$_ProfileInfo _value, $Res Function(_$_ProfileInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user_profile = freezed,
    Object? user_name = null,
    Object? introduce = freezed,
    Object? best_travel = freezed,
    Object? post_amount = null,
    Object? posts = freezed,
    Object? flowing = null,
    Object? flower = null,
  }) {
    return _then(_$_ProfileInfo(
      user_profile: freezed == user_profile
          ? _value.user_profile
          : user_profile // ignore: cast_nullable_to_non_nullable
              as String?,
      user_name: null == user_name
          ? _value.user_name
          : user_name // ignore: cast_nullable_to_non_nullable
              as String,
      introduce: freezed == introduce
          ? _value.introduce
          : introduce // ignore: cast_nullable_to_non_nullable
              as String?,
      best_travel: freezed == best_travel
          ? _value.best_travel
          : best_travel // ignore: cast_nullable_to_non_nullable
              as String?,
      post_amount: null == post_amount
          ? _value.post_amount
          : post_amount // ignore: cast_nullable_to_non_nullable
              as int,
      posts: freezed == posts
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as PostGrid?,
      flowing: null == flowing
          ? _value.flowing
          : flowing // ignore: cast_nullable_to_non_nullable
              as int,
      flower: null == flower
          ? _value.flower
          : flower // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProfileInfo with DiagnosticableTreeMixin implements _ProfileInfo {
  const _$_ProfileInfo(
      {this.user_profile = null,
      this.user_name = "유저",
      this.introduce = "자기소개",
      this.best_travel = "최고의 여행지",
      this.post_amount = 0,
      this.posts = null,
      this.flowing = 0,
      this.flower = 0});

  factory _$_ProfileInfo.fromJson(Map<String, dynamic> json) =>
      _$$_ProfileInfoFromJson(json);

  @override
  @JsonKey()
  final String? user_profile;
  @override
  @JsonKey()
  final String user_name;
  @override
  @JsonKey()
  final String? introduce;
  @override
  @JsonKey()
  final String? best_travel;
  @override
  @JsonKey()
  final int post_amount;
  @override
  @JsonKey()
  final PostGrid? posts;
  @override
  @JsonKey()
  final int flowing;
  @override
  @JsonKey()
  final int flower;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProfileInfo(user_profile: $user_profile, user_name: $user_name, introduce: $introduce, best_travel: $best_travel, post_amount: $post_amount, posts: $posts, flowing: $flowing, flower: $flower)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProfileInfo'))
      ..add(DiagnosticsProperty('user_profile', user_profile))
      ..add(DiagnosticsProperty('user_name', user_name))
      ..add(DiagnosticsProperty('introduce', introduce))
      ..add(DiagnosticsProperty('best_travel', best_travel))
      ..add(DiagnosticsProperty('post_amount', post_amount))
      ..add(DiagnosticsProperty('posts', posts))
      ..add(DiagnosticsProperty('flowing', flowing))
      ..add(DiagnosticsProperty('flower', flower));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProfileInfo &&
            (identical(other.user_profile, user_profile) ||
                other.user_profile == user_profile) &&
            (identical(other.user_name, user_name) ||
                other.user_name == user_name) &&
            (identical(other.introduce, introduce) ||
                other.introduce == introduce) &&
            (identical(other.best_travel, best_travel) ||
                other.best_travel == best_travel) &&
            (identical(other.post_amount, post_amount) ||
                other.post_amount == post_amount) &&
            (identical(other.posts, posts) || other.posts == posts) &&
            (identical(other.flowing, flowing) || other.flowing == flowing) &&
            (identical(other.flower, flower) || other.flower == flower));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, user_profile, user_name,
      introduce, best_travel, post_amount, posts, flowing, flower);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProfileInfoCopyWith<_$_ProfileInfo> get copyWith =>
      __$$_ProfileInfoCopyWithImpl<_$_ProfileInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProfileInfoToJson(
      this,
    );
  }
}

abstract class _ProfileInfo implements ProfileInfo {
  const factory _ProfileInfo(
      {final String? user_profile,
      final String user_name,
      final String? introduce,
      final String? best_travel,
      final int post_amount,
      final PostGrid? posts,
      final int flowing,
      final int flower}) = _$_ProfileInfo;

  factory _ProfileInfo.fromJson(Map<String, dynamic> json) =
      _$_ProfileInfo.fromJson;

  @override
  String? get user_profile;
  @override
  String get user_name;
  @override
  String? get introduce;
  @override
  String? get best_travel;
  @override
  int get post_amount;
  @override
  PostGrid? get posts;
  @override
  int get flowing;
  @override
  int get flower;
  @override
  @JsonKey(ignore: true)
  _$$_ProfileInfoCopyWith<_$_ProfileInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

PostGrid _$PostGridFromJson(Map<String, dynamic> json) {
  return _PostGrid.fromJson(json);
}

/// @nodoc
mixin _$PostGrid {
  int get post_id => throw _privateConstructorUsedError;
  String get first_image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostGridCopyWith<PostGrid> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostGridCopyWith<$Res> {
  factory $PostGridCopyWith(PostGrid value, $Res Function(PostGrid) then) =
      _$PostGridCopyWithImpl<$Res, PostGrid>;
  @useResult
  $Res call({int post_id, String first_image});
}

/// @nodoc
class _$PostGridCopyWithImpl<$Res, $Val extends PostGrid>
    implements $PostGridCopyWith<$Res> {
  _$PostGridCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? post_id = null,
    Object? first_image = null,
  }) {
    return _then(_value.copyWith(
      post_id: null == post_id
          ? _value.post_id
          : post_id // ignore: cast_nullable_to_non_nullable
              as int,
      first_image: null == first_image
          ? _value.first_image
          : first_image // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PostGridCopyWith<$Res> implements $PostGridCopyWith<$Res> {
  factory _$$_PostGridCopyWith(
          _$_PostGrid value, $Res Function(_$_PostGrid) then) =
      __$$_PostGridCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int post_id, String first_image});
}

/// @nodoc
class __$$_PostGridCopyWithImpl<$Res>
    extends _$PostGridCopyWithImpl<$Res, _$_PostGrid>
    implements _$$_PostGridCopyWith<$Res> {
  __$$_PostGridCopyWithImpl(
      _$_PostGrid _value, $Res Function(_$_PostGrid) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? post_id = null,
    Object? first_image = null,
  }) {
    return _then(_$_PostGrid(
      post_id: null == post_id
          ? _value.post_id
          : post_id // ignore: cast_nullable_to_non_nullable
              as int,
      first_image: null == first_image
          ? _value.first_image
          : first_image // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PostGrid with DiagnosticableTreeMixin implements _PostGrid {
  const _$_PostGrid({this.post_id = 0, this.first_image = ""});

  factory _$_PostGrid.fromJson(Map<String, dynamic> json) =>
      _$$_PostGridFromJson(json);

  @override
  @JsonKey()
  final int post_id;
  @override
  @JsonKey()
  final String first_image;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PostGrid(post_id: $post_id, first_image: $first_image)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PostGrid'))
      ..add(DiagnosticsProperty('post_id', post_id))
      ..add(DiagnosticsProperty('first_image', first_image));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostGrid &&
            (identical(other.post_id, post_id) || other.post_id == post_id) &&
            (identical(other.first_image, first_image) ||
                other.first_image == first_image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, post_id, first_image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostGridCopyWith<_$_PostGrid> get copyWith =>
      __$$_PostGridCopyWithImpl<_$_PostGrid>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostGridToJson(
      this,
    );
  }
}

abstract class _PostGrid implements PostGrid {
  const factory _PostGrid({final int post_id, final String first_image}) =
      _$_PostGrid;

  factory _PostGrid.fromJson(Map<String, dynamic> json) = _$_PostGrid.fromJson;

  @override
  int get post_id;
  @override
  String get first_image;
  @override
  @JsonKey(ignore: true)
  _$$_PostGridCopyWith<_$_PostGrid> get copyWith =>
      throw _privateConstructorUsedError;
}
