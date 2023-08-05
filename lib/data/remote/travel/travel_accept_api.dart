import 'package:dio/dio.dart';
import 'package:nuri/config/api.dart';

class TravelAcceptApi extends Api{

  static final TravelAcceptApi _instance = TravelAcceptApi._internal();
  TravelAcceptApi._internal();

  factory TravelAcceptApi(){
    return _instance;
  }

  Future<bool> userAccept({required String userId, required bool respond, required int travelId}) async{

    Map requestBody =
    {
      "appliedUserId": userId,
      "respond": respond
    };

    try{

      Response response = await dio.post("$baseUrl/travel/apply-accept/$travelId",data: requestBody);

      return true;
    }
    catch(e){
      return Future.error(e);
    }
  }
  Future<bool> userApply({required int travelId}) async{

    try{

      Response response = await dio.post("$baseUrl/travel/apply/$travelId");

      return true;
    }
    catch(e){
      return Future.error(e);
    }
  }
}