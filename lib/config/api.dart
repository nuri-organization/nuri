import 'package:dio/dio.dart';
import 'package:nuri/config/constants.dart';

class Api{

  String baseUrl = Constants.baseServerUrl;
  bool needAccessToken = true;

  final dio = Dio();

  Api(){
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (request, handler) async{
          if(needAccessToken){
            request.headers['Authorization'] = 'Bearer ';
          }
          return handler.next(request);
        }
      )
    );
  }
}