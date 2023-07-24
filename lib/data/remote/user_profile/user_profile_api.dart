import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:nuri/config/api.dart';
import 'package:nuri/data/model/profile/profile_model.dart';
import 'package:nuri/test/profile_data.dart';

class UserProfileApi extends Api{
  static final UserProfileApi _instance = UserProfileApi._internal();
  UserProfileApi._internal();

  factory UserProfileApi(){
    return _instance;
  }

  Future<ProfileModel> getUserProfileInfo() async{
    try {
      // Response response = await dio.get("$baseUrl/profile/");
      //
      // print(response);
      //
      // ProfileModel getData = response.data["data"];

      ProfileModel getData = TestProfileData().data1;

      return getData;
    }
    on DioError catch (e){
      return Future.error(e);
    }
  }

  Future<bool> fetchUserProfile({required ProfileModel profileModel}) async{
    try{
      Map requestBody = {};

      Response response = await dio.post('$baseUrl/', data: requestBody);
      return true;
    }
    catch(e){
      return false;
    }
  }

  Future<bool> postUserProfile({required String userName, String? bestTravel, String? introduce}) async{
    try{

      Map requestBody = {
        "userProfile": null,
        "userName": userName,
        "introduce": introduce,
        "bestTravel": bestTravel
      };


      Response response = await dio.post('$baseUrl/profile/', data: requestBody);


      return true;
    }
    catch(e){
      print(e);
      return false;
    }
  }
}