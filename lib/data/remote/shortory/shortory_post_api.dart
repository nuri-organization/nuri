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

  Future<List<PostModel>> getPostInfo() async{
    try{
      // Response response = await dio.get("$baseUrl/");

      // List<ProfileModel> getPostData = response.data["data"];

      List<PostModel> getPostData = TestPostData().data1;

      return getPostData;
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