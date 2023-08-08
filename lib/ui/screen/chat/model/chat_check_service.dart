import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuri/cubit/chat/chat_cubit.dart';
import 'package:nuri/data/local/local_storage.dart';
import 'package:nuri/ui/screen/chat/chat_screen.dart';
import 'package:nuri/ui/screen/chat/model/user_chat.dart';
import 'package:nuri/ui/widget/nuri_dialog.dart';

class ChatCheckService {
  // 채팅방 사용 가능 체크
  Future<bool> check(BuildContext context, ChatScreenArguments chatArg) async {
    String userId = chatArg.myId ?? LocalStorage().getUserIdToken();
    String userNickname = chatArg.myNickname ?? LocalStorage().getName();
    var peerId = chatArg.peerId;
    var peerNickname = chatArg.peerNickname;
    UserChat? _userChat;

    if (chatArg.chatRoomId != '') {
      _userChat = await context.read<ChatCubit>().getChatRoom(chatArg.chatRoomId!, userId);
      if (_userChat == null || _userChat.deleted) {
        nuriDialog(
            context,
            [
              Text("채팅방이 삭제되었거나 \n들어갈 수 없는 상태입니다.")
            ]
        );
        return false;
      }
    }
    if (chatArg.peerId == userId) {
      nuriDialog(
          context,
          [
            Text("본인과는 채팅을 할 수 없습니다.")
          ]
      );
      return false;
    }
    if (userId == "" || peerId == "") {
      nuriDialog(
          context,
          [
            Text("채팅방을 열수 앖는 사용자입니다.")
          ]
      );
      return false;
    }
    if (chatArg.chatRoomId == '') {
      // 신규 채팅일 경우 채팅방 정상 여부를 체크하여 .. 채팅방에 사용자가 1인이면 삭제 후 다시 채팅방을 생성한디ㅏ.
      var groupChatId = "";
      // groupChatId = '$userId-$peerId@$userNickname-$peerNickname';
      if (userId.compareTo(peerId) > 0) {
        groupChatId = '${chatArg.isTravel ? "travel" : "common"}-$userId-$peerId@$userNickname-$peerNickname';
      } else {
        groupChatId = '${chatArg.isTravel ? "travel" : "common"}-$peerId-$userId@$peerNickname-$userNickname';
      }
      // var value = await Provider.of<ChatProvider>(context, listen: false).checkValidChattingRoom(groupChatId);
      // if (value == false) {
        // await Provider.of<ChatProvider>(context, listen: false).copyAndDelChattingRoom(groupChatId);
      // }
    }
    return true;
  }
}