import 'package:nuri/data/model/travel/todo/travel_todo_list_model.dart';
import 'package:nuri/data/remote/travel/travel_todo_api.dart';

abstract class TravelTodolistRepository{
  Future<List<TravelTodoListModel>> getTodolist({required String travelId});
  Future<bool> postTodoList({required String travelId});
  Future<bool> fetchTodoList({required String travelId});
}

class TravelTodolistRepositoryImpl extends TravelTodolistRepository{

  TravelTodoApi api;
  TravelTodolistRepositoryImpl(this.api);

  @override
  Future<bool> fetchTodoList({required String travelId}) async{

    final bool result = await api.fetchTodoListInfo(travelId: travelId);

    return true;
  }

  @override
  Future<List<TravelTodoListModel>> getTodolist({required String travelId}) async{

    final List<TravelTodoListModel> result = await api.getTodoListInfo(travelId: travelId);

    return result;
  }

  @override
  Future<bool> postTodoList({required String travelId}) async{

    final bool result = await api.postTodoListInfo(travelId: travelId);

    return true;
  }

}