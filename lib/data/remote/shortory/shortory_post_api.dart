import 'package:dio/dio.dart';
import 'package:nuri/config/api.dart';
import 'package:nuri/data/model/post/post_model.dart';
import 'package:nuri/test/post_data.dart';

class ShortoryPostApi extends Api{
  static final ShortoryPostApi _instance = ShortoryPostApi._internal();
  ShortoryPostApi._internal();

  factory ShortoryPostApi(){
    return _instance;
  }

  Future<List> getPostInfo() async{

    Map requestBody =
        {
          "postAmount": 5
        };

    try{
      Response response = await dio.get("$baseUrl/post/",data:requestBody );



      List getData = response.data["post"];


      List data = getData.map((e) => PostModel.fromJson(e)).toList();




      return data;
    }
    catch(e){
      return Future.error(e);
    }
  }

  Future<bool> postPostInfo({required PostModel postModel}) async{
    try{
      Map requestBody = {};

      Response response = await dio.post(
          "$baseUrl/",
          data: requestBody
      );

      return true;
    }
    catch(e){
      return Future.error(e).then((value) => false);
    }
  }

  Future<bool> fetchPostInfo({required PostModel postModel}) async{
    try{
      Map requestBody = {};

      Response response = await dio.put(
          "$baseUrl/",
          data: requestBody
      );

      return true;
    }
    catch(e){
      return Future.error(e).then((value) => false);
    }
  }
}