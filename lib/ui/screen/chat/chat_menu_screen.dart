
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nuri/config/constants.dart';
import 'package:nuri/data/local/local_storage.dart';
import 'package:nuri/ui/screen/chat/chat_constants/chat_constants.dart';
import 'package:nuri/ui/screen/chat/chat_screen.dart';
import 'package:nuri/ui/screen/chat/model/chat_check_service.dart';
import 'package:nuri/cubit/chat/chat_menu_provider.dart';
import 'package:nuri/ui/screen/chat/model/user_chat.dart';
import 'package:nuri/ui/widget/nuri_dialog.dart';

class ChatMenuScreen extends StatefulWidget {
  const ChatMenuScreen({super.key});

  @override
  State<ChatMenuScreen> createState() => _ChatMenuScreenState();
}

class _ChatMenuScreenState extends State<ChatMenuScreen> {

  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  final ScrollController listScrollController = ScrollController();

  int _limit = 10;
  final int _limitIncrement = 10;
  bool isLoading = false;

  late String currentUserId;
  late ChatMenuProvider chatMenuProvider;

  @override
  void initState() {
    chatMenuProvider = context.read<ChatMenuProvider>();
    currentUserId = LocalStorage().getUserIdToken();

    listScrollController.addListener(scrollListener);
    super.initState();
  }

  void scrollListener() {
    if (listScrollController.offset >=
        listScrollController.position.maxScrollExtent &&
        !listScrollController.position.outOfRange) {
      setState(() {
        _limit += _limitIncrement;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: chatMenuProvider.getStreamFireStore(
                      ChatConstants.pathMessageCollection, _limit, currentUserId
                  ),
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                    if(snapshot.hasData){
                      if((snapshot.data?.docs.length ?? 0) > 0){
                        var items = snapshot.data!.docs.isEmpty
                            ? []
                            : snapshot.data!.docs;
                        var sortField = currentUserId + ChatConstants.lastMsgDate;
                        items.sort((a,b) => b.get(sortField).compareTo(a.get(sortField)));
                        return ListView.separated(
                            itemBuilder: (context, index){
                              return Container();
                            },
                            shrinkWrap: true,
                            separatorBuilder: (context, index) => Divider(
                                height: 1.h,
                                thickness: 1.h,
                                color: Colors.grey,
                              ),
                            itemCount: snapshot.data!.docs.length
                        );
                      }else {
                        return _noChatPage();
                      }
                    }else{
                      print(snapshot);
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Constants.theme4,
                        ),
                      );
                    }
                  },
            ))
          ],
        ),
        Positioned(
          child: isLoading ? Container() : SizedBox.shrink(),
        )
      ],
    );
  }
  Widget _chatBox(BuildContext context, DocumentSnapshot? document){
    UserChat userChat = UserChat.fromDocument(document!, currentUserId);

    return InkWell(
      onTap: () async {
        if(userChat.status == "wait"){

        }
        if(userChat.status == "reject"){

        }
        if(userChat.status == "request"){
          await nuriDialog(context, [
            TextButton(onPressed: (){

            }, child: Text("대화하기")),
            TextButton(onPressed: (){

            }, child: Text("대화거절"))
          ]);
        }
        else{
          ChatScreenArguments _chatArg = ChatScreenArguments(
            peerId: userChat.peerId,
            peerImageUrl: userChat.peerPhotoUrl,
            peerNickname: userChat.peerName,
            myId: userChat.myId,
            myNickname: userChat.myName,
            myImageUrl: userChat.myPhotoUrl,
            openDate: userChat.openDate,
            chatRoomId: userChat.id,
          );
          ChatCheckService().check(context, _chatArg).then((value){
            if(value){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => ChatScreen(chatArg: _chatArg)
                  )
              );
            }
          });
        }
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(14.r),
        color: userChat.status == "accept" ? Constants.theme4 : userChat.unreadMsg ? Constants.theme4 : Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                userChat.peerPhotoUrl.contains('http')
                    ? ClipOval(
                  child: Container(
                    width: 45.w,
                    height: 45.w,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(userChat.peerPhotoUrl))),
                  ),
                )
                    : Icon(Icons.person),
                Positioned(
                  right: 0.0,
                  bottom: 1.w,
                  child: Container(
                    width: 13.w,
                    height: 13.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: userChat.chattingIn
                          ? Constants.theme4
                          : Colors.grey,
                      border: Border.all(
                        color: Colors.white,
                        width: 2.0,
                      ),
                    ),
                  ),),
              ],
            ),
            SizedBox(width: 16.w,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      userChat.myName,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    // 마지막 채팅 메시지 일자
                    Text(
                      userChat.lastMsgDate,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10.sp,
                      ),
                    ),
                    Container(
                      width: 250.w,
                      child: Text(
                        userChat.lastMsg == null
                            ? ''
                            : userChat.lastMsg.replaceAll("\n", ""),
                        style: TextStyle(
                            fontSize: 14.sp,
                            overflow: TextOverflow.ellipsis,
                            height: 1.57),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
  Widget _noChatPage() {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 120.h,
          ),
          // 이미지
          SizedBox(
            height: 30.h,
          ),
          Text(
            '아직 채팅이 없어요.',
            style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                height: 1.22),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            '쇼토리에서 작성자 이름을 클릭하거나,',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.grey, fontSize: 12.sp, height: 1.83),
          ),
          SizedBox(
            height: 1.h,
          ),
          Text(
            '여행에서 채팅 신청을 하면 1:1 채팅을 할 수 있어요!',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.grey, fontSize: 12.sp, height: 1.83),
          ),
        ],
      ),
    );
  }
}
