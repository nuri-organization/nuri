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
    try{
      // Response response = await dio.get("$baseUrl/");
      //
      // List<TravelPostModel> getData = response.data["data"];

      List<TravelPostModel> getData = TestTravelPostData().data1;

      return getData;
    }
    catch(e){
      return Future.error(e);
    }
  }

  Future<bool> postTravelPostInfo({required TravelPostModel travelPostModel}) async{
    try {
      Map requestBody = {};

      Response response = await dio.post(
        "$baseUrl/",
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