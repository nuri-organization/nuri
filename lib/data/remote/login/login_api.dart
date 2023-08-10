import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:nuri/config/api.dart';
import 'package:nuri/data/model/login/login_model.dart';

class LoginApi extends Api{
  static final LoginApi _instance = LoginApi._internal();
  LoginApi._internal();

  factory LoginApi(){
    // needAccessToken = false;
    return _instance;
  }

  Future signUp({required String loginId, required String loginPassword}) async{

    Map requestBody =
    {
      "email" : "$loginId",
      "password" : "$loginPassword"
    };

    try{

      Response response = await dio.post("$baseUrl/account/sign-up",data: requestBody);


      var data = response.data["userId"];

      return data;
    }
    catch(e){
      return Future.error(e);
    }
  }

  Future signIn({required String loginId, required String loginPassword}) async{

    Map requestBody =
    {
      "email" : "$loginId",
      "password" : "$loginPassword"
    };

    try{

      Response response = await dio.post("$baseUrl/account/sign-in",data: requestBody);

      Logger().i(response);
      var data = response.data["userId"];

      return data;
    }
    catch(e){
      Future.error(e);
      return false;
    }

  }

}