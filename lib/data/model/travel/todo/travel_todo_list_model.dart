import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'travel_todo_list_model.freezed.dart';

part 'travel_todo_list_model.g.dart';

@freezed
class TravelTodoListModel with _$TravelTodoListModel{
  const factory TravelTodoListModel({
    @Default("") String content,
    @Default(false) bool done
  }) = _TravelTodoListModel;

  factory TravelTodoListModel.fromJson(Map<String, Object?>json)
  => _$TravelTodoListModelFromJson(json);
}


