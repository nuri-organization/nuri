import 'package:dio/dio.dart';
import 'package:nuri/config/api.dart';
import 'package:nuri/data/model/travel/travel_post_model.dart';
import 'package:nuri/test/travel_post_data.dart';

class TravelPostApi extends Api{
  static final TravelPostApi _instance = TravelPostApi._internal();
  TravelPostApi._internal();

  factory TravelPostApi(){

    return _instance;
  }

  Future<List<TravelPostModel>> getTravelPostInfo() async{

    Map requestBody =
    {
      "travelAmount": 10
    };

    try{

      Response response = await dio.get("$baseUrl/travel/",data: requestBody);


      List getData = response.data["travels"];


      List<TravelPostModel> data = getData.map((e) => TravelPostModel.fromJson(e)).toList();


      return data;
    }
    catch(e){
      return Future.error(e);
    }
  }

  Future<bool> postTravelPostInfo({required String title, required String content, required List<String> mainTravel, required int cost, required String startData, required String endDate, required int maxPeople}) async{
    try {
      Map requestBody =
      {
        "title": title,
        "content": content,
        "mainTravel": mainTravel,
        "cost": cost,
        "startDate": startData,
        "endDate": endDate,
        "maxPeople": maxPeople
      };


      Response response = await dio.post(
        "$baseUrl/travel/",
        data: requestBody
      );


      return true;
    }
    catch(e){
      return Future.error(e);
    }
  }

  Future<bool> fetchTravelPostInfo({required TravelPostModel travelPostModel}) async{
    try{
      Map requestBody = {};

      Response response = await dio.put(
        "$baseUrl/",
        data: requestBody
      );
      return true;
    }
    catch(e){
      return Future.error(e);
    }
  }

}