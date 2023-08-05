// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'travel_my_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TravelMyModel _$TravelMyModelFromJson(Map<String, dynamic> json) {
  return _TravelMyModel.fromJson(json);
}

/// @nodoc
mixin _$TravelMyModel {
  int get travelId => throw _privateConstructorUsedError;
  String get travelName => throw _privateConstructorUsedError;
  bool get isLeader => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TravelMyModelCopyWith<TravelMyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TravelMyModelCopyWith<$Res> {
  factory $TravelMyModelCopyWith(
          TravelMyModel value, $Res Function(TravelMyModel) then) =
      _$TravelMyModelCopyWithImpl<$Res, TravelMyModel>;
  @useResult
  $Res call({int travelId, String travelName, bool isLeader});
}

/// @nodoc
class _$TravelMyModelCopyWithImpl<$Res, $Val extends TravelMyModel>
    implements $TravelMyModelCopyWith<$Res> {
  _$TravelMyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? travelId = null,
    Object? travelName = null,
    Object? isLeader = null,
  }) {
    return _then(_value.copyWith(
      travelId: null == travelId
          ? _value.travelId
          : travelId // ignore: cast_nullable_to_non_nullable
              as int,
      travelName: null == travelName
          ? _value.travelName
          : travelName // ignore: cast_nullable_to_non_nullable
              as String,
      isLeader: null == isLeader
          ? _value.isLeader
          : isLeader // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TravelMyModelCopyWith<$Res>
    implements $TravelMyModelCopyWith<$Res> {
  factory _$$_TravelMyModelCopyWith(
          _$_TravelMyModel value, $Res Function(_$_TravelMyModel) then) =
      __$$_TravelMyModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int travelId, String travelName, bool isLeader});
}

/// @nodoc
class __$$_TravelMyModelCopyWithImpl<$Res>
    extends _$TravelMyModelCopyWithImpl<$Res, _$_TravelMyModel>
    implements _$$_TravelMyModelCopyWith<$Res> {
  __$$_TravelMyModelCopyWithImpl(
      _$_TravelMyModel _value, $Res Function(_$_TravelMyModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? travelId = null,
    Object? travelName = null,
    Object? isLeader = null,
  }) {
    return _then(_$_TravelMyModel(
      travelId: null == travelId
          ? _value.travelId
          : travelId // ignore: cast_nullable_to_non_nullable
              as int,
      travelName: null == travelName
          ? _value.travelName
          : travelName // ignore: cast_nullable_to_non_nullable
              as String,
      isLeader: null == isLeader
          ? _value.isLeader
          : isLeader // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TravelMyModel with DiagnosticableTreeMixin implements _TravelMyModel {
  const _$_TravelMyModel(
      {this.travelId = 0, this.travelName = "", this.isLeader = false});

  factory _$_TravelMyModel.fromJson(Map<String, dynamic> json) =>
      _$$_TravelMyModelFromJson(json);

  @override
  @JsonKey()
  final int travelId;
  @override
  @JsonKey()
  final String travelName;
  @override
  @JsonKey()
  final bool isLeader;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TravelMyModel(travelId: $travelId, travelName: $travelName, isLeader: $isLeader)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TravelMyModel'))
      ..add(DiagnosticsProperty('travelId', travelId))
      ..add(DiagnosticsProperty('travelName', travelName))
      ..add(DiagnosticsProperty('isLeader', isLeader));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TravelMyModel &&
            (identical(other.travelId, travelId) ||
                other.travelId == travelId) &&
            (identical(other.travelName, travelName) ||
                other.travelName == travelName) &&
            (identical(other.isLeader, isLeader) ||
                other.isLeader == isLeader));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, travelId, travelName, isLeader);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TravelMyModelCopyWith<_$_TravelMyModel> get copyWith =>
      __$$_TravelMyModelCopyWithImpl<_$_TravelMyModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TravelMyModelToJson(
      this,
    );
  }
}

abstract class _TravelMyModel implements TravelMyModel {
  const factory _TravelMyModel(
      {final int travelId,
      final String travelName,
      final bool isLeader}) = _$_TravelMyModel;

  factory _TravelMyModel.fromJson(Map<String, dynamic> json) =
      _$_TravelMyModel.fromJson;

  @override
  int get travelId;
  @override
  String get travelName;
  @override
  bool get isLeader;
  @override
  @JsonKey(ignore: true)
  _$$_TravelMyModelCopyWith<_$_TravelMyModel> get copyWith =>
      throw _privateConstructorUsedError;
}
