import 'package:dio/dio.dart';
import 'package:nuri/config/api.dart';
import 'package:nuri/data/model/post/comment/comment_model.dart';
import 'package:nuri/test/comment_data.dart';

class CommentApi extends Api{
  static final CommentApi _instance = CommentApi._internal();
  CommentApi._internal();

  factory CommentApi(){
    return _instance;
  }

  Future<List<CommentModel>> getCommentInfo() async{
    try{
      // Response response = await dio.get("$baseUrl/");
      //
      // List<CommentModel> getCommentData = response.data["data"];

      List<CommentModel> getCommentData = TestCommentData().data1;

      return getCommentData;

    }
    catch(e){
      return Future.error(e);
    }
  }

  Future<bool> postCommentInfo({required CommentModel commentModel}) async{
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

  Future<bool> fetchCommentInfo({required CommentModel commentModel}) async{
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

  Future<bool> deleteCommentInfo({required CommentModel commentModel}) async{
    try{
      Map requestBody = {};

      Response response = await dio.delete(
        "$baseUrl/",
        data: requestBody
      );

      return true;
    }
    catch(e){
      return Future.error(e);
    }
  }
}