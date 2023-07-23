import 'package:dio/dio.dart';
import 'package:nuri/config/api.dart';
import 'package:nuri/data/model/login/login_model.dart';

class LoginApi extends Api{
  static final LoginApi _instance = LoginApi._internal();
  LoginApi._internal();

  factory LoginApi(){
    // needAccessToken = false;
    return _instance;
  }

  Future<bool> signUp({required String loginId, required String loginPassword}) async{

    Map requestBody =
    {
      "email" : "$loginId",
      "password" : "$loginPassword"
    };

    try{

      Response response = await dio.post("$baseUrl/account/sign-up",data: requestBody);

      return true;
    }
    catch(e){
      return Future.error(e);
    }
  }

  Future<bool> signIn({required LoginModel loginModel}) async{

    Map requestBody =
    {
      "email" : "",
      "password" : ""
    };

    try{
      Response response = await dio.post("$baseUrl/account/sign-in",data: requestBody);

      return true;
    }
    catch(e){
      return Future.error(e);
    }

  }

}