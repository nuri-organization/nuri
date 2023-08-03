import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:nuri/config/api.dart';
import 'package:nuri/data/local/local_storage.dart';
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
      Response response = await dio.get("$baseUrl/profile/");

      print(response);

      ProfileModel getData = ProfileModel.fromJson(response.data);


      return getData;
    }
     catch (e){
      return Future.error(e);
    }
  }

  Future<bool> fetchUserProfile({required String userName, String? bestTravel, String? introduce, String? image}) async{
    Map requestBody =
    // {
    //   "userProfile": "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",
    //   "userName": "Here you're",
    //   "introduce": "2023-07-25 created",
    //   "bestTravel": "도쿄 오사카"
    // };
    {
      "userProfile": image,
      "userName": userName,
      "introduce": introduce,
      "bestTravel": bestTravel
    };

    try{
      print(requestBody);

      Response response = await dio.put('$baseUrl/profile/', data: requestBody);

      print(response);

      if(response.data["statusCode"] == 201) {
        return true;
      }
      else return false;
    }
    catch(e){
      Future.error(e);
      return false;
    }
  }

  Future<bool> postUserProfile({required String userName, String? bestTravel, String? introduce, String? image, required String fcmToken}) async{

    Map requestBody =
    {
      "userProfile": image,
      "userName": userName,
      "introduce": introduce,
      "bestTravel": bestTravel,
      "fcmToken": fcmToken
    };

    try{

      print(requestBody);

      Response response = await dio.post("$baseUrl/profile/", data: requestBody,);

      print(response);

      if(response.data["statusCode"] == 201) {
        return true;
      }
      else return false;
    }
    catch(e){
      print(e);
      return false;
    }
  }
}