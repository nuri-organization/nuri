part of 'notification_cubit.dart';

class NotificationState extends Equatable {

  NotificationState({this.loadingStatus = LoadingStatus.initial, this.notificationModel});

  List<NotificationModel>? notificationModel;
  LoadingStatus loadingStatus;

  @override
  List<Object?> get props => [notificationModel,loadingStatus];
}
