import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nuri/repository/notification_repository.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit(this.notificationRepository) : super(NotificationState());

  final NotificationRepository notificationRepository;

  void sendNotification({required Map requestBody}) async{
    var result = await notificationRepository.sendNotification(requestBody: requestBody);


  }

}
