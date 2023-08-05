import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nuri/config/enum.dart';
import 'package:nuri/data/model/push/notification_model.dart';
import 'package:nuri/repository/notification_repository.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit(this.notificationRepository) : super(NotificationState());

  final NotificationRepository notificationRepository;


  void getNotificationList() async{
    List<NotificationModel> result = await notificationRepository.getNotificationList();

    if(result.isEmpty){
      emit(NotificationState(loadingStatus: LoadingStatus.noData));
    }
    if(result.isNotEmpty){
      emit(NotificationState(loadingStatus: LoadingStatus.success, notificationModel: result));
    }
  }

}
