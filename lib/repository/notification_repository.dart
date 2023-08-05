import 'package:nuri/data/model/push/notification_model.dart';
import 'package:nuri/data/remote/push_alarm/notification_api.dart';

abstract class NotificationRepository {
  Future<List<NotificationModel>> getNotificationList();
}

class NotificationImpl extends NotificationRepository{

  NotificationApi api;
  NotificationImpl(this.api);

  @override
  Future<List<NotificationModel>> getNotificationList() async{
    List<NotificationModel> result = await api.getNotification();

    return result;
  }

}