import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  ChatScreenArguments chatArg;
  ChatScreen({required this.chatArg});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


class ChatScreenArguments {
  final String peerId;
  final String peerImageUrl;
  final String peerNickname;
  final String? myId;
  final String? myImageUrl;
  final String? myNickname;
  final String? chatRoomId;
  final String? openDate;
  ChatScreenArguments({
    required this.peerId,
    required this.peerImageUrl,
    required this.peerNickname,
    this.myId,
    this.myImageUrl,
    this.myNickname,
    this.chatRoomId,
    this.openDate,
  });
}