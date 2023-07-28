import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nuri/ui/screen/chat/chat_constants/chat_constants.dart';
import 'package:nuri/ui/screen/chat/model/message_chat.dart';
import 'package:nuri/ui/screen/chat/model/user_chat.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final FirebaseStorage firebaseStorage;
  final FirebaseFirestore firebaseFirestore;

  ChatCubit({required this.firebaseFirestore, required this.firebaseStorage})
      : super(ChatState());

  UploadTask uploadFile(File image, String fileName, String myId) {
    Reference reference =
    firebaseStorage.ref().child("chat/" + myId + "/" + fileName);
    UploadTask uploadTask = reference.putFile(image);
    return uploadTask;
  }

  // 채팅방 섹제
  Future<void> delChattingRoom(String docPath) async {
    final collection = await firebaseFirestore
        .collection(ChatConstants.pathMessageCollection)
        .doc(docPath)
        .collection(docPath)
        .get();
    final batch = firebaseFirestore.batch();
    for (final doc in collection.docs) {
      batch.delete(doc.reference);
    }
    batch.commit();
    firebaseFirestore
        .collection(ChatConstants.pathMessageCollection)
        .doc(docPath)
        .delete();
  }

  // 채팅방 접속 가능 여부
  Future<bool> checkValidChattingRoom(String docPath) async {
    var value = await firebaseFirestore
        .collection(ChatConstants.pathMessageCollection)
        .doc(docPath)
        .get();
    if (value.exists) {
      var users = value.get('users');
      return (users.length > 1) ? true : false;
    }
    return true;
  }

  // 채팅 참여
  Future<bool> attendChattingRoom(
      {required String collectionPath, required String docPath, required String myName, required String peerName, required String myId, required String peerId,}) async {
    var value = await firebaseFirestore
        .collection(ChatConstants.pathMessageCollection)
        .doc(docPath)
        .get();
    if (value.exists) {
      final _chatData = <String, dynamic>{
        peerId + "unreadMsg": false,
        myId + "chattingIn": true,
      };
      firebaseFirestore
          .collection(ChatConstants.pathMessageCollection)
          .doc(docPath)
          .update(_chatData);
      var users = value.get('users');
      return (users.length > 1) ? true : false;
    } else {
      final _chatData = <String, dynamic>{
        "users": [myId, peerId],
        "reported": false,
        peerId + "nickName": peerName,
        peerId + "deleted": false,
        peerId + "chattingIn": false,
        peerId + "unreadMsg": false,
        peerId + "lastMsg": "",
        peerId + "lastMsgDate": DateTime
            .now()
            .millisecondsSinceEpoch
            .toString(),
        myId + "nickName": myName,
        myId + "deleted": false,
        myId + "chattingIn": true,
        myId + "unreadMsg": false,
        myId + "lastMsg": "",
        myId + "lastMsgDate": DateTime
            .now()
            .millisecondsSinceEpoch
            .toString(),
        ChatConstants.timestamp: DateTime
            .now()
            .millisecondsSinceEpoch
            .toString(),
      };
      firebaseFirestore
          .collection(ChatConstants.pathMessageCollection)
          .doc(docPath)
          .set(_chatData);
      return true;
    }
  }

  // 채팅룸 갖고오기
  Future<UserChat?> getChatRoom(String groupChatId, String myId) async {
    print('짝크루 채팅방을 갖고왔습니다');
    var value = await firebaseFirestore
        .collection(ChatConstants.pathMessageCollection)
        .doc(groupChatId)
        .get();
    if (value.exists) {
      UserChat _userChat = UserChat.fromDocument(value, myId);
      return _userChat;
    } else {
      return null;
    }
  }

  // 채팅 신청 거절
  Future<bool> rejectJJCrewChattingRoom(BuildContext context,
      {required String collectionPath,
        required String docPath,
        required String myId,
        required String peerId}) async {
    var value = await firebaseFirestore
        .collection(ChatConstants.pathMessageCollection)
        .doc(docPath)
        .get();
    if (value.exists) {
      UserChat _userChat = UserChat.fromDocument(value, myId);
      if (_userChat.status == 'accept') {
        return false;
      } else {
        // NotificationService().sendPush(
        //     context,
        //     PushType.jcrew_failed,
        //     _userChat.userId,
        //     _userChat.userNickname,
        //     _userChat.peerId,
        //     _userChat.nickName,
        //     "",
        //     -1,
        //     -1,
        //     "",
        //     _userChat.id);
        firebaseFirestore
            .collection(ChatConstants.pathMessageCollection)
            .doc(docPath)
            .delete();
        return true;
      }
    } else {
      return false;
    }
  }

  // 채팅방 접속 상태 변경
  Future<bool> chattingInRoom(
      {required String collectionPath, required String docPath, required String myId}) async {
    var value = await firebaseFirestore
        .collection(ChatConstants.pathMessageCollection)
        .doc(docPath)
        .get();
    if (value.exists) {
      final _chatData = <String, dynamic>{
        myId + "chattingIn": true,
      };
      var users = value.get('users');
      firebaseFirestore
          .collection(ChatConstants.pathMessageCollection)
          .doc(docPath)
          .update(_chatData);
      return (users.length > 1) ? true : false;
    } else {
      return false;
    }
  }

  // 채팅방 접속 종료
  Future<bool> chattingOutRoom(
      {required String collectionPath, required String docPath, required String myId}) async {
    var value = await firebaseFirestore
        .collection(ChatConstants.pathMessageCollection)
        .doc(docPath)
        .get();
    if (value.exists) {
      var users = value.get('users');
      final _chatData = <String, dynamic>{
        myId + "chattingIn": false,
      };
      firebaseFirestore
          .collection(ChatConstants.pathMessageCollection)
          .doc(docPath)
          .update(_chatData);
      return (users.length == 1 && users.contains(myId)) ? true : false;
    } else {
      return false;
    }
  }

  // 채팅방 떠나기
  Future<void> leaveChattingRoom({required bool blocked,
    required bool deleted,
    required String content,
    required int type,
    required String groupChatId,
    required String myId,
    required String peerId}) async {
    var value = await firebaseFirestore
        .collection(ChatConstants.pathMessageCollection)
        .doc(groupChatId)
        .get();
    if (value.exists) {
      var users = value.get('users');
      var userNickname = value.get(myId + 'nickName');
      users.remove(myId);
      if (users.length == 0) {
        delChattingRoom(groupChatId);
      } else {
        DocumentReference documentReference = firebaseFirestore
            .collection(ChatConstants.pathMessageCollection)
            .doc(groupChatId)
            .collection(groupChatId)
            .doc(DateTime
            .now()
            .millisecondsSinceEpoch
            .toString());
        final _chatData = <String, dynamic>{
          "blocked": blocked,
          "users": users,
          myId + "nickName": "종료된 채팅방",
          myId + "deleted": deleted,
          myId + "lastMsg": content.replaceAll("@nickName@", userNickname),
          myId + "lastMsgDate": DateTime
              .now()
              .millisecondsSinceEpoch
              .toString(),
          ChatConstants.timestamp: DateTime
              .now()
              .millisecondsSinceEpoch
              .toString(),
        };
        firebaseFirestore
            .collection(ChatConstants.pathMessageCollection)
            .doc(groupChatId)
            .update(_chatData);
        MessageChat messageChat = MessageChat(
          idFrom: myId,
          idTo: peerId,
          timestamp: DateTime
              .now()
              .millisecondsSinceEpoch
              .toString(),
          content: content,
          type: type,
        );
        FirebaseFirestore.instance.runTransaction((transaction) async {
          transaction.set(
            documentReference,
            messageChat.toJson(),
          );
        });
      }
    }
  }

  // 채팅 스트리밍 연결
  Stream<QuerySnapshot> getChatStream(
      {required String groupChatId, required int limit}) {
    return firebaseFirestore
        .collection(ChatConstants.pathMessageCollection)
        .doc(groupChatId)
        .collection(groupChatId)
        .orderBy(ChatConstants.timestamp, descending: true)
        .limit(limit)
        .snapshots();
  }

  // 메시지 보냐기
  void sendMessage(
      {required String content, required int type, required String groupChatId, required String myId,
        required String peerId, required bool peerChatingIn}) {
    DocumentReference documentReference = firebaseFirestore
        .collection(ChatConstants.pathMessageCollection)
        .doc(groupChatId)
        .collection(groupChatId)
        .doc(DateTime
        .now()
        .millisecondsSinceEpoch
        .toString());

    final _chatData = <String, dynamic>{
      myId + "unreadMsg": peerChatingIn ? false : true,
      myId + "lastMsg": content,
      myId + "lastMsgDate": DateTime
          .now()
          .millisecondsSinceEpoch
          .toString(),
      peerId + "lastMsg": content,
      peerId + "lastMsgDate": DateTime
          .now()
          .millisecondsSinceEpoch
          .toString(),
      ChatConstants.timestamp: DateTime
          .now()
          .millisecondsSinceEpoch
          .toString(),
    };
    firebaseFirestore
        .collection(ChatConstants.pathMessageCollection)
        .doc(groupChatId)
        .update(_chatData);

    MessageChat messageChat = MessageChat(
      idFrom: myId,
      idTo: peerId,
      timestamp: DateTime
          .now()
          .millisecondsSinceEpoch
          .toString(),
      content: content,
      type: type,
    );

    FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.set(
        documentReference,
        messageChat.toJson(),
      );
    });
  }
}
