import 'package:dio/dio.dart';
import 'package:nuri/config/api.dart';
import 'package:nuri/data/model/post/post_model.dart';

class ShortoryPostApi extends Api{
  static final ShortoryPostApi _instance = ShortoryPostApi._internal();
  ShortoryPostApi._internal();

  factory ShortoryPostApi(){
    return _instance;
  }

  Future<List<PostModel>> getPostInfo() async{

    Map requestBody =
        {
          "postAmount": 10
        };

    try{
      Response response = await dio.get("$baseUrl/post/",data:requestBody );


      List getData =  response.data["post"];

      List<PostModel> data = getData.map((e) => PostModel.fromJson(e)).toList();

      return data;
    }
    catch(e){
      return Future.error(e);
    }
  }

  Future<bool> postPostInfo({required List<ShortoryModel> shortoryModel, required String title, required String content}) async{


    List<Map<String, dynamic>> shortory = [];
    for (int index = 0; index < shortoryModel.length -1; index++) {
      shortory.add({
        "url" : shortoryModel[index].url,
        "content" : shortoryModel[index].content
      });
    }
    Map requestBody =
    {
      "title": title,
      "content": content,
      "shotory": shortory

    };

    try{


      Response response = await dio.post(
          "$baseUrl/post/",
          data: requestBody
      );


      return true;
    }
    catch(e){
      return Future.error(e).then((value) => false);
    }
  }

  Future<bool> fetchPostInfo({required List<ShortoryModel> shortoryModel, required String title, required String content}) async{
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

  Future<bool> postLike({required int postId}) async{
    try{
      Response response = await dio.put(
        "$baseUrl/post/likes/$postId",
      );

      return true;

    }
    catch(e){
      return Future.error(e).then((value) => false);
    }
  }

  Future<bool> postBookmark({required int postId}) async{
    try{
      Response response = await dio.put(
        "$baseUrl/post/bookmarks/$postId",
      );

      return true;

    }
    catch(e){
      return Future.error(e).then((value) => false);
    }
  }

}