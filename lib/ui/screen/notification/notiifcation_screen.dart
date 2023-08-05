import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuri/config/enum.dart';
import 'package:nuri/config/scaffold.dart';
import 'package:nuri/cubit/notification/notification_cubit.dart';
import 'package:nuri/cubit/travel/accept/travel_accept_cubit.dart';
import 'package:nuri/data/local/local_storage.dart';
import 'package:nuri/ui/screen/chat/chat_screen.dart';
import 'package:nuri/ui/screen/chat/model/chat_check_service.dart';
import 'package:nuri/ui/screen/profile/widget/profile_detail_screen.dart';
import 'package:nuri/ui/widget/nuri_dialog.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  @override
  void initState() {
    context.read<NotificationCubit>().getNotificationList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NuriScaffold(
      child: BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) {
          if(state.loadingStatus == LoadingStatus.success){
            return SingleChildScrollView(
              child: ListView.builder(
                shrinkWrap: true,
                  itemCount: state.notificationModel!.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () async{
                        state.notificationModel![index].peer?.peerId != null ?
                        await nuriDialog(
                            context,
                            [
                              TextButton(
                                  onPressed: (){
                                    ChatScreenArguments _chatArg = ChatScreenArguments(
                                        peerId: state.notificationModel![index].peer!.peerId,
                                        peerImageUrl: state.notificationModel![index].peer!.peerProfile,
                                        peerNickname: state.notificationModel![index].peer!.peerName,
                                        myNickname: LocalStorage().getName(),
                                        chatRoomId: '',
                                        isTravel: false
                                    );
                                    ChatCheckService().check(context, _chatArg).then((value) {
                                      if (value) {
                                        Navigator.push(context, MaterialPageRoute(builder: (_) => ChatScreen(chatArg: _chatArg) ));
                                      }
                                    });
                                  },
                                  child: const Text("채팅하기")
                              ),
                              TextButton(
                                  onPressed: (){
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => ProfileDetailScreen(
                                              userId: state.notificationModel![index].peer!.peerId,
                                            )
                                        )
                                    );
                                  },
                                  child: const Text("프로필 보기")
                              ),
                              TextButton(
                                  onPressed: (){
                                    context.read<TravelAcceptCubit>().userAccept(
                                        userId: state.notificationModel![index].peer!.peerId,
                                        respond: true,
                                        travelId: 1
                                    );
                                  },
                                  child: const Text("수락하기")
                              ),
                              TextButton(
                                  onPressed: (){
                                    context.read<TravelAcceptCubit>().userAccept(
                                        userId: state.notificationModel![index].peer!.peerId,
                                        respond: true,
                                        travelId: 1
                                    );
                                  },
                                  child: const Text("거절하기")
                              )
                            ]
                        ) : SizedBox();
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(state.notificationModel![index].title),
                          Text(state.notificationModel![index].content),
                          const SizedBox(height: 10,)
                        ],
                      ),
                    );
                  }
              ),
            );
          }
          if(state.loadingStatus == LoadingStatus.noData){
            return Container(
              child: Center(
                child: Text("아직 온 알림이 없습니다."),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
