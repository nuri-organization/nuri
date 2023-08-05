import 'package:dio/dio.dart';
import 'package:nuri/config/api.dart';
import 'package:nuri/data/local/local_storage.dart';
import 'package:nuri/data/model/push/notification_model.dart';

class NotificationApi extends Api{
  
  static final NotificationApi _instance = NotificationApi._internal();
  NotificationApi._internal();
  
  factory NotificationApi(){
    return _instance;
  }

  Future<List<NotificationModel>> getNotification() async{
    try{

      Response response = await dio.get("$baseUrl/notification/");

      print(response);

      List getData = response.data;

      List<NotificationModel> data = getData.map((e) => NotificationModel.fromJson(e)).toList();

      return data;
    }
    catch(e){
      return Future.error(e);
    }
  }

}