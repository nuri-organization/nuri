// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'travel_todo_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TravelTodoListModel _$TravelTodoListModelFromJson(Map<String, dynamic> json) {
  return _TravelTodoListModel.fromJson(json);
}

/// @nodoc
mixin _$TravelTodoListModel {
  String get content => throw _privateConstructorUsedError;
  bool get done => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TravelTodoListModelCopyWith<TravelTodoListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TravelTodoListModelCopyWith<$Res> {
  factory $TravelTodoListModelCopyWith(
          TravelTodoListModel value, $Res Function(TravelTodoListModel) then) =
      _$TravelTodoListModelCopyWithImpl<$Res, TravelTodoListModel>;
  @useResult
  $Res call({String content, bool done});
}

/// @nodoc
class _$TravelTodoListModelCopyWithImpl<$Res, $Val extends TravelTodoListModel>
    implements $TravelTodoListModelCopyWith<$Res> {
  _$TravelTodoListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? done = null,
  }) {
    return _then(_value.copyWith(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      done: null == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TravelTodoListModelCopyWith<$Res>
    implements $TravelTodoListModelCopyWith<$Res> {
  factory _$$_TravelTodoListModelCopyWith(_$_TravelTodoListModel value,
          $Res Function(_$_TravelTodoListModel) then) =
      __$$_TravelTodoListModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String content, bool done});
}

/// @nodoc
class __$$_TravelTodoListModelCopyWithImpl<$Res>
    extends _$TravelTodoListModelCopyWithImpl<$Res, _$_TravelTodoListModel>
    implements _$$_TravelTodoListModelCopyWith<$Res> {
  __$$_TravelTodoListModelCopyWithImpl(_$_TravelTodoListModel _value,
      $Res Function(_$_TravelTodoListModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? content = null,
    Object? done = null,
  }) {
    return _then(_$_TravelTodoListModel(
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      done: null == done
          ? _value.done
          : done // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TravelTodoListModel
    with DiagnosticableTreeMixin
    implements _TravelTodoListModel {
  const _$_TravelTodoListModel({this.content = "", this.done = false});

  factory _$_TravelTodoListModel.fromJson(Map<String, dynamic> json) =>
      _$$_TravelTodoListModelFromJson(json);

  @override
  @JsonKey()
  final String content;
  @override
  @JsonKey()
  final bool done;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TravelTodoListModel(content: $content, done: $done)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TravelTodoListModel'))
      ..add(DiagnosticsProperty('content', content))
      ..add(DiagnosticsProperty('done', done));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TravelTodoListModel &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.done, done) || other.done == done));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, content, done);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TravelTodoListModelCopyWith<_$_TravelTodoListModel> get copyWith =>
      __$$_TravelTodoListModelCopyWithImpl<_$_TravelTodoListModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TravelTodoListModelToJson(
      this,
    );
  }
}

abstract class _TravelTodoListModel implements TravelTodoListModel {
  const factory _TravelTodoListModel({final String content, final bool done}) =
      _$_TravelTodoListModel;

  factory _TravelTodoListModel.fromJson(Map<String, dynamic> json) =
      _$_TravelTodoListModel.fromJson;

  @override
  String get content;
  @override
  bool get done;
  @override
  @JsonKey(ignore: true)
  _$$_TravelTodoListModelCopyWith<_$_TravelTodoListModel> get copyWith =>
      throw _privateConstructorUsedError;
}
