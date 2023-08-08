import 'package:dio/dio.dart';
import 'package:nuri/config/constants.dart';
import 'package:nuri/data/local/local_storage.dart';

class Api{

  String baseUrl = Constants.baseServerUrl;
  bool needAccessToken = true;

  final dio = Dio();

  Api(){
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (request, handler) async{
          if((LocalStorage().getUserIdToken()).isNotEmpty){
            if(needAccessToken){
              request.headers['Authorization'] = '${LocalStorage().getUserIdToken()}';
            }
          }
          return handler.next(request);
        }
      )
    );
  }
}