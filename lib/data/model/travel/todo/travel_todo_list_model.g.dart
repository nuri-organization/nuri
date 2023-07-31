// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'travel_todo_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TravelTodoListModel _$$_TravelTodoListModelFromJson(
        Map<String, dynamic> json) =>
    _$_TravelTodoListModel(
      content: json['content'] as String? ?? "",
      done: json['done'] as bool? ?? false,
    );

Map<String, dynamic> _$$_TravelTodoListModelToJson(
        _$_TravelTodoListModel instance) =>
    <String, dynamic>{
      'content': instance.content,
      'done': instance.done,
    };
