import 'package:nuri/data/remote/push_alarm/notification_api.dart';

abstract class NotificationRepository {
  Future sendNotification({required Map requestBody});
}

class NotificationImpl extends NotificationRepository{

  NotificationApi api;
  NotificationImpl(this.api);

  @override
  Future sendNotification({required Map requestBody}) async{
    // var result = await api.sendNotification(requestBody: requestBody);

    return true;
  }

}