import 'package:nuri/data/model/travel/todo/travel_todo_list_model.dart';

class TodoData{
  List<TravelTodoListModel> travelTodoListModel = [];

  void addList({required String content}) {
    travelTodoListModel.add(TravelTodoListModel(content: content,done: false));
  }
}