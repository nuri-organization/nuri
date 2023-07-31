import 'package:dio/dio.dart';
import 'package:nuri/config/api.dart';
import 'package:nuri/data/model/travel/todo/travel_todo_list_model.dart';

class TravelCheckApi extends Api{

  static final TravelCheckApi _instance = TravelCheckApi._internal();
  TravelCheckApi._internal();

  factory TravelCheckApi(){
    return _instance;
  }

  Future<List<TravelTodoListModel>> getCheckListInfo({required String travelId}) async{
    try{

      Response response = await dio.get("$baseUrl/travel/check-list/$travelId");

      List getData = response.data["checkList"];

      List<TravelTodoListModel> data = getData.map((e) => TravelTodoListModel.fromJson(e)).toList();

      return data;

    }
    catch(e){
      return Future.error(e);
    }
  }

  Future<bool> postCheckListInfo({required String travelId}) async{

    Map requestBody =
    {

    };

    try{

      Response response = await dio.post("$baseUrl/travel/check-list/$travelId",data: requestBody);

      List getData = response.data["checkList"];

      return true;

    }
    catch(e){
      return Future.error(e);
    }

  }

  Future<bool> fetchCheckListInfo({required String travelId}) async{
    Map requestBody =
    {

    };

    try{

      Response response = await dio.put("$baseUrl/travel/check-list/$travelId",data: requestBody);

      return true;

    }
    catch(e){
      return Future.error(e);
    }

  }
}