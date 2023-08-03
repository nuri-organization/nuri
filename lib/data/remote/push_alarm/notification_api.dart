import 'package:dio/dio.dart';
import 'package:nuri/config/api.dart';
import 'package:nuri/data/local/local_storage.dart';

class NotificationApi extends Api{
  
  static final NotificationApi _instance = NotificationApi._internal();
  NotificationApi._internal();
  
  factory NotificationApi(){
    _instance.needAccessToken = false;
    return _instance;
  }

  final String clientId = "YOUR_CLIENT_ID";
  final String clientSecret = "YOUR_CLIENT_SECRET";
  final String code = "AUTHORIZATION_CODE";
  final String redirectUri = "YOUR_REDIRECT_URI";

//   Future<String> getAccessToken() async{
//     code=4%2F0AZEOvhVNjNNTEebl4weAnEhIsQm_2QXN64epTGwwd1UhJkFTlUiK5UsJIcQ2Tvv7ewexsw&
//     redirect_uri=https%3A%2F%2Fdevelopers.google.com%2Foauthplayground&
//     client_id=407408718192.apps.googleusercontent.com&
//     client_secret=************&scope=&grant_type=authorization_code
//
//     code=4%2F0Adeu5BWp1-wDKKFQ5IBcfcNGE4ETxe7daFHsVnRmVLW7gOLBwt7gkuP4uFv3_ZIKDbeWcQ&
//     redirect_uri=https%3A%2F%2Fdevelopers.google.com%2Foauthplayground&
//     client_id=407408718192.apps.googleusercontent.com&
//     client_secret=************&scope=&grant_type=authorization_code
//     try{
//
//       Response response = await dio.post(
//           "https://oauth2.googleapis.com/token",
//           options: Options(
//               headers: {
//                 'Authorization' : "Bearer 4/0Adeu5BWSweOo_p16Chh1mPbry0Z6OzYmYaHVOL4e-qeQQDRSs4J2-Pt4-Laoa1hMVdVGAg"
//               },
//           ),
//         data: {
//           "code": code,
//           "client_id": clientId,
//           "client_secret": clientSecret,
//           "redirect_uri": "https://www.googleapis.com/oauth2/v2/userinfo",
//           "grant_type": "authorization_code",
//         }
//       );
//
//       print(response);
//
//       return response.data;
//     }
//
//     catch(e){
//       return Future.error(e);
//     }
// }
  
  Future<bool> sendNotification() async{


    String authonToken = "ya29.a0AfB_byAV1sunJpWh8ZbsNXAhI839iE0nTxLFeq_lJp_QvaJzSTf9SOKGH8wiqmckDsFBGV9eXXhxLQrpATXpL-GtM2X-WirmN9DjyqSMwuY3-2mTlJvqlqzFBbPBKyMbLJMmr5AY0_n_JLT5269fLgv977IXjT4aCgYKAVwSARMSFQHsvYlsFm2AdWAIWB-xh1QMyCs62Q0166";

    try{

      Response response = await dio.post(
          "https://fcm.googleapis.com/v1/projects/nuri-server-auth/messages:send",
          options: Options(
            headers: {
              'Authorization' : "Bearer $authonToken"
            }
          ),
          data: {
      "message": {
        "token": "dYwOKI5zTgu1LRXSDIOlch:APA91bHflHu1Yn0WxNtCh-AzdAoLeMuevdx5qua39UTmD3dQSOQjQ0Y4qXaGpiEWOEP3iNlgEKQNCvgMSKFnTzzIekA8WEHGVQgvphd-umSwuTmJ-ohplF756cTWhBrll99qJKMNlcSr",
        // "topic": "user_uid",

        "notification": {
          "title": "FCM Test Title",
          "body": "FCM Test Body",
        },
        "data": {
          "click_action": "FCM Test Click Action",
        },
        "android": {
          "notification": {
            "click_action": "Android Click Action",
          }
        },
      }
          }
      );

      print(response);

      return true;
    }
    catch(e){
      print(e);
      return false;
    }
  }
}