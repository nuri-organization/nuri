import 'package:dio/dio.dart';
import 'package:nuri/config/api.dart';
import 'package:nuri/data/model/profile/user_info/user_info_model.dart';
import 'package:nuri/data/model/travel/travel_my_model.dart';

class TravelMemberApi extends Api{

  static final TravelMemberApi _instance = TravelMemberApi._internal();
  TravelMemberApi._internal();

  factory TravelMemberApi(){
    return _instance;
  }

  Future<List<TravelMyModel>> getMyTravel() async{
    try{
      Response response = await dio.get("$baseUrl/travel/my-travel");

      print(response);

      List getData = response.data["myTravelList"];

      List<TravelMyModel> data = getData.map((e) => TravelMyModel.fromJson(e)).toList();

      return data;

    }
    catch(e){
      return Future.error(e);
    }
  }

  Future<List<UserInfoModel>> getTravelMember({required String travelId}) async{
    try{
      Response response = await dio.get("$baseUrl/travel/travel-member/$travelId");

      print(response);

      List getData = response.data["member"];

      List<UserInfoModel> data = getData.map((e) => UserInfoModel.fromJson(e)).toList();

      return data;

    }
    catch(e){
      return Future.error(e);
    }
  }

  Future<bool> delTravelMember({required String travelId}) async{
    try{
      Response response = await dio.delete("$baseUrl/travel/travel-member/$travelId");

      return true;

    }
    catch(e){
      return Future.error(e);
    }
  }

}