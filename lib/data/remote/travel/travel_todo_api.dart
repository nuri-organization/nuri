import 'package:dio/dio.dart';
import 'package:nuri/config/api.dart';
import 'package:nuri/data/model/travel/todo/travel_todo_list_model.dart';

class TravelTodoApi extends Api{

  static final TravelTodoApi _instance = TravelTodoApi._internal();
  TravelTodoApi._internal();

  factory TravelTodoApi(){
    return _instance;
  }

  Future<List<TravelTodoListModel>> getTodoListInfo({required String travelId}) async{
    try{

      Response response = await dio.get("$baseUrl/travel/todo-list/$travelId");

      List getData = response.data["todoList"];

      List<TravelTodoListModel> data = getData.map((e) => TravelTodoListModel.fromJson(e)).toList();

      return data;

    }
    catch(e){
      return Future.error(e);
    }
  }

  Future<bool> postTodoListInfo({required String travelId}) async{

    Map requestBody =
    {

    };

    try{

      Response response = await dio.post("$baseUrl/travel/todo-list/$travelId",data: requestBody);

      List getData = response.data["todoList"];

      return true;

    }
    catch(e){
      return Future.error(e);
    }

  }

  Future<bool> fetchTodoListInfo({required String travelId}) async{
    Map requestBody =
    {

    };

    try{

      Response response = await dio.put("$baseUrl/travel/todo-list/$travelId",data: requestBody);

      return true;

    }
    catch(e){
      return Future.error(e);
    }

  }
}