import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nuri/ui/screen/chat/chat_constants/chat_constants.dart';

class MessageChat {
  String idFrom;
  String idTo;
  String timestamp;
  String content;
  int type;

  MessageChat({
    required this.idFrom,
    required this.idTo,
    required this.timestamp,
    required this.content,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    return {
      ChatConstants.idFrom: this.idFrom,
      ChatConstants.idTo: this.idTo,
      ChatConstants.timestamp: this.timestamp,
      ChatConstants.content: this.content,
      ChatConstants.type: this.type,
    };
  }

  factory MessageChat.fromDocument(DocumentSnapshot doc) {
    String idFrom = doc.get(ChatConstants.idFrom);
    String idTo = doc.get(ChatConstants.idTo);
    String timestamp = doc.get(ChatConstants.timestamp);
    String content = doc.get(ChatConstants.content);
    int type = doc.get(ChatConstants.type);
    return MessageChat(idFrom: idFrom, idTo: idTo, timestamp: timestamp, content: content, type: type);
  }
}