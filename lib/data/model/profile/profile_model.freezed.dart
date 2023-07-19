// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) {
  return _ProfileModel.fromJson(json);
}

/// @nodoc
mixin _$ProfileModel {
  String? get userProfile => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String? get introduce => throw _privateConstructorUsedError;
  String? get bestTravel => throw _privateConstructorUsedError;
  int get postAmount => throw _privateConstructorUsedError;

  /// TODO : List value
  List<PostGrid?> get posts => throw _privateConstructorUsedError;
  int get flowing => throw _privateConstructorUsedError;
  int get flower => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileModelCopyWith<ProfileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileModelCopyWith<$Res> {
  factory $ProfileModelCopyWith(
          ProfileModel value, $Res Function(ProfileModel) then) =
      _$ProfileModelCopyWithImpl<$Res, ProfileModel>;
  @useResult
  $Res call(
      {String? userProfile,
      String userName,
      String? introduce,
      String? bestTravel,
      int postAmount,
      List<PostGrid?> posts,
      int flowing,
      int flower});
}

/// @nodoc
class _$ProfileModelCopyWithImpl<$Res, $Val extends ProfileModel>
    implements $ProfileModelCopyWith<$Res> {
  _$ProfileModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userProfile = freezed,
    Object? userName = null,
    Object? introduce = freezed,
    Object? bestTravel = freezed,
    Object? postAmount = null,
    Object? posts = null,
    Object? flowing = null,
    Object? flower = null,
  }) {
    return _then(_value.copyWith(
      userProfile: freezed == userProfile
          ? _value.userProfile
          : userProfile // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      introduce: freezed == introduce
          ? _value.introduce
          : introduce // ignore: cast_nullable_to_non_nullable
              as String?,
      bestTravel: freezed == bestTravel
          ? _value.bestTravel
          : bestTravel // ignore: cast_nullable_to_non_nullable
              as String?,
      postAmount: null == postAmount
          ? _value.postAmount
          : postAmount // ignore: cast_nullable_to_non_nullable
              as int,
      posts: null == posts
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<PostGrid?>,
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
}

/// @nodoc
abstract class _$$_ProfileModelCopyWith<$Res>
    implements $ProfileModelCopyWith<$Res> {
  factory _$$_ProfileModelCopyWith(
          _$_ProfileModel value, $Res Function(_$_ProfileModel) then) =
      __$$_ProfileModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? userProfile,
      String userName,
      String? introduce,
      String? bestTravel,
      int postAmount,
      List<PostGrid?> posts,
      int flowing,
      int flower});
}

/// @nodoc
class __$$_ProfileModelCopyWithImpl<$Res>
    extends _$ProfileModelCopyWithImpl<$Res, _$_ProfileModel>
    implements _$$_ProfileModelCopyWith<$Res> {
  __$$_ProfileModelCopyWithImpl(
      _$_ProfileModel _value, $Res Function(_$_ProfileModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userProfile = freezed,
    Object? userName = null,
    Object? introduce = freezed,
    Object? bestTravel = freezed,
    Object? postAmount = null,
    Object? posts = null,
    Object? flowing = null,
    Object? flower = null,
  }) {
    return _then(_$_ProfileModel(
      userProfile: freezed == userProfile
          ? _value.userProfile
          : userProfile // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      introduce: freezed == introduce
          ? _value.introduce
          : introduce // ignore: cast_nullable_to_non_nullable
              as String?,
      bestTravel: freezed == bestTravel
          ? _value.bestTravel
          : bestTravel // ignore: cast_nullable_to_non_nullable
              as String?,
      postAmount: null == postAmount
          ? _value.postAmount
          : postAmount // ignore: cast_nullable_to_non_nullable
              as int,
      posts: null == posts
          ? _value._posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<PostGrid?>,
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
class _$_ProfileModel with DiagnosticableTreeMixin implements _ProfileModel {
  const _$_ProfileModel(
      {this.userProfile = null,
      this.userName = "유저",
      this.introduce = "자기소개",
      this.bestTravel = "최고의 여행지",
      this.postAmount = 0,
      final List<PostGrid?> posts = const [],
      this.flowing = 0,
      this.flower = 0})
      : _posts = posts;

  factory _$_ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$$_ProfileModelFromJson(json);

  @override
  @JsonKey()
  final String? userProfile;
  @override
  @JsonKey()
  final String userName;
  @override
  @JsonKey()
  final String? introduce;
  @override
  @JsonKey()
  final String? bestTravel;
  @override
  @JsonKey()
  final int postAmount;

  /// TODO : List value
  final List<PostGrid?> _posts;

  /// TODO : List value
  @override
  @JsonKey()
  List<PostGrid?> get posts {
    if (_posts is EqualUnmodifiableListView) return _posts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_posts);
  }

  @override
  @JsonKey()
  final int flowing;
  @override
  @JsonKey()
  final int flower;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProfileModel(userProfile: $userProfile, userName: $userName, introduce: $introduce, bestTravel: $bestTravel, postAmount: $postAmount, posts: $posts, flowing: $flowing, flower: $flower)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProfileModel'))
      ..add(DiagnosticsProperty('userProfile', userProfile))
      ..add(DiagnosticsProperty('userName', userName))
      ..add(DiagnosticsProperty('introduce', introduce))
      ..add(DiagnosticsProperty('bestTravel', bestTravel))
      ..add(DiagnosticsProperty('postAmount', postAmount))
      ..add(DiagnosticsProperty('posts', posts))
      ..add(DiagnosticsProperty('flowing', flowing))
      ..add(DiagnosticsProperty('flower', flower));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProfileModel &&
            (identical(other.userProfile, userProfile) ||
                other.userProfile == userProfile) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.introduce, introduce) ||
                other.introduce == introduce) &&
            (identical(other.bestTravel, bestTravel) ||
                other.bestTravel == bestTravel) &&
            (identical(other.postAmount, postAmount) ||
                other.postAmount == postAmount) &&
            const DeepCollectionEquality().equals(other._posts, _posts) &&
            (identical(other.flowing, flowing) || other.flowing == flowing) &&
            (identical(other.flower, flower) || other.flower == flower));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userProfile,
      userName,
      introduce,
      bestTravel,
      postAmount,
      const DeepCollectionEquality().hash(_posts),
      flowing,
      flower);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProfileModelCopyWith<_$_ProfileModel> get copyWith =>
      __$$_ProfileModelCopyWithImpl<_$_ProfileModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProfileModelToJson(
      this,
    );
  }
}

abstract class _ProfileModel implements ProfileModel {
  const factory _ProfileModel(
      {final String? userProfile,
      final String userName,
      final String? introduce,
      final String? bestTravel,
      final int postAmount,
      final List<PostGrid?> posts,
      final int flowing,
      final int flower}) = _$_ProfileModel;

  factory _ProfileModel.fromJson(Map<String, dynamic> json) =
      _$_ProfileModel.fromJson;

  @override
  String? get userProfile;
  @override
  String get userName;
  @override
  String? get introduce;
  @override
  String? get bestTravel;
  @override
  int get postAmount;
  @override

  /// TODO : List value
  List<PostGrid?> get posts;
  @override
  int get flowing;
  @override
  int get flower;
  @override
  @JsonKey(ignore: true)
  _$$_ProfileModelCopyWith<_$_ProfileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

PostGrid _$PostGridFromJson(Map<String, dynamic> json) {
  return _PostGrid.fromJson(json);
}

/// @nodoc
mixin _$PostGrid {
  int get postId => throw _privateConstructorUsedError;
  String get firstImage => throw _privateConstructorUsedError;

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
  $Res call({int postId, String firstImage});
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
    Object? postId = null,
    Object? firstImage = null,
  }) {
    return _then(_value.copyWith(
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int,
      firstImage: null == firstImage
          ? _value.firstImage
          : firstImage // ignore: cast_nullable_to_non_nullable
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
  $Res call({int postId, String firstImage});
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
    Object? postId = null,
    Object? firstImage = null,
  }) {
    return _then(_$_PostGrid(
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int,
      firstImage: null == firstImage
          ? _value.firstImage
          : firstImage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PostGrid with DiagnosticableTreeMixin implements _PostGrid {
  const _$_PostGrid({this.postId = 0, this.firstImage = ""});

  factory _$_PostGrid.fromJson(Map<String, dynamic> json) =>
      _$$_PostGridFromJson(json);

  @override
  @JsonKey()
  final int postId;
  @override
  @JsonKey()
  final String firstImage;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PostGrid(postId: $postId, firstImage: $firstImage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PostGrid'))
      ..add(DiagnosticsProperty('postId', postId))
      ..add(DiagnosticsProperty('firstImage', firstImage));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostGrid &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.firstImage, firstImage) ||
                other.firstImage == firstImage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, postId, firstImage);

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
  const factory _PostGrid({final int postId, final String firstImage}) =
      _$_PostGrid;

  factory _PostGrid.fromJson(Map<String, dynamic> json) = _$_PostGrid.fromJson;

  @override
  int get postId;
  @override
  String get firstImage;
  @override
  @JsonKey(ignore: true)
  _$$_PostGridCopyWith<_$_PostGrid> get copyWith =>
      throw _privateConstructorUsedError;
}
