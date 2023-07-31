import 'package:nuri/data/model/travel/todo/travel_todo_list_model.dart';
import 'package:nuri/data/remote/travel/travel_check.dart';

abstract class TravelChecklistRepository{
  Future<List<TravelTodoListModel>> getChecklist({required String travelId});
  Future<bool> postCheckList({required String travelId});
  Future<bool> fetchCheckList({required String travelId});
}

class TravelChecklistRepositoryImpl extends TravelChecklistRepository{

  TravelCheckApi api;
  TravelChecklistRepositoryImpl(this.api);

  @override
  Future<bool> fetchCheckList({required String travelId}) async{

    final bool result = await api.fetchCheckListInfo(travelId: travelId);

    return true;
  }

  @override
  Future<List<TravelTodoListModel>> getChecklist({required String travelId}) async{

    final List<TravelTodoListModel> result = await api.getCheckListInfo(travelId: travelId);

    return result;
  }

  @override
  Future<bool> postCheckList({required String travelId}) async{

    final bool result = await api.postCheckListInfo(travelId: travelId);

    return true;
  }

}