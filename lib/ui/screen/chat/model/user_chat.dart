import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nuri/service/time_manager.dart';
import 'package:nuri/ui/screen/chat/chat_constants/chat_constants.dart';

String _getPeerId(String docIds, String currentUserId){
  if(docIds.indexOf("@") > -1){
    docIds = docIds.substring(0, docIds.indexOf("@"));
  }
  List<String> docArr = docIds.split("-");
  String peerId = "";
  for( final docId in docArr){
    if(currentUserId != docId){
      peerId = docId;
    }
  }
  return peerId;
}

class UserChat {
  String id;
  String peerId;
  String myName;
  String myPhotoUrl;
  String myId;
  String peerName;
  String lastMsgDate;
  String peerPhotoUrl;
  String lastMsg;
  bool unreadMsg;
  bool deleted;
  String status;
  String statusMsg;
  String openDate;
  String welMsg;
  String peerInfo;
  String matchId;
  bool chattingIn;
  bool isTravel;
  int travelId;

  UserChat({
    required this.id,
    required this.myId,
    required this.myName,
    required this.myPhotoUrl,
    required this.peerId,
    required this.peerName,
    required this.peerPhotoUrl,
    required this.lastMsgDate,
    required this.lastMsg,
    required this.unreadMsg,
    required this.deleted,
    required this.status,
    required this.statusMsg,
    required this.openDate,
    required this.welMsg,
    required this.peerInfo,
    required this.matchId,
    required this.chattingIn,
    required this.isTravel,
    required this.travelId
  });

  Map<String, String> toJson() {
    return {
      ChatConstants.myId: myId,
      ChatConstants.myName: myName,
      ChatConstants.myPhotoUrl: myPhotoUrl,
      ChatConstants.peerId: peerId,
      ChatConstants.peerName: peerName,
      ChatConstants.peerPhotoUrl: peerPhotoUrl,
      ChatConstants.lastMsgDate: lastMsgDate,
      ChatConstants.lastMsg: lastMsg,
      ChatConstants.unreadMsg: unreadMsg.toString(),
      ChatConstants.deleted: deleted.toString(),
      ChatConstants.status: status,
      ChatConstants.statusMsg: statusMsg,
      ChatConstants.openDate: openDate,
      ChatConstants.welMsg: welMsg,
      ChatConstants.chattingIn: chattingIn.toString(),
      ChatConstants.isTravel: isTravel.toString(),
      ChatConstants.travelId: travelId.toString()
    };
  }

  factory UserChat.fromDocument(DocumentSnapshot doc, String currId) {
    String lastMsgDate = "";
    String lastMsg = "";
    String myName = "";
    String myPhotoUrl = "";
    String peerId = _getPeerId(doc.id, currId);
    bool unreadMsg = false;
    bool deleted = false;
    String status = "";
    String statusMsg = "";
    String peerName = "";
    String peerPhotoUrl = "";
    String openDate = "";
    String welMsg = "";
    String peerInfo = "";
    String matchId = "";
    bool chattingIn = false;
    bool isTravel = false;
    int travelId = 0;

    try {
      DateTime dt = DateTime.fromMillisecondsSinceEpoch(
          int.parse(doc.get(peerId + ChatConstants.lastMsgDate)));
      Map<String, String> writtenTime =
      TimeManager().convertWrittenTimeToFormat(dt.toString());
      lastMsgDate = writtenTime['text'].toString();
    } catch (e) {}
    try {
      lastMsg = doc.get(peerId + ChatConstants.lastMsg);
      if (lastMsg.startsWith("http")) lastMsg = "[📷사진]";
    } catch (e) {}

    try {
      peerPhotoUrl = doc.get(peerId + ChatConstants.peerPhotoUrl);
    } catch (e) {}

    try {
      peerName = doc.get(peerId + ChatConstants.peerName);
    } catch (e) {}
    try {
      unreadMsg = doc.get(peerId + ChatConstants.unreadMsg);
    } catch (e) {}
    try {
      deleted = doc.get(currId + ChatConstants.deleted);
    } catch (e) {}
    try {
      status = doc.get(peerId + ChatConstants.status);
    } catch (e) {}
    try {
      statusMsg = doc.get(peerId + ChatConstants.statusMsg);
    } catch (e) {}
    try {
      myName = doc.get(currId + ChatConstants.myName);
    } catch (e) {}
    try {
      myPhotoUrl = doc.get(currId + ChatConstants.myPhotoUrl);
    } catch (e) {}
    try {
      openDate = doc.get(ChatConstants.openDate);
    } catch (e) {}
    try {
      welMsg = doc.get(ChatConstants.welMsg);
    } catch (e) {}
    try {
      peerInfo = doc.get(ChatConstants.peerInfo);
    } catch (e) {}
    try {
      matchId = doc.get(ChatConstants.matchId);
    } catch (e) {}
    try {
      chattingIn = doc.get(peerId + ChatConstants.chattingIn);
    } catch (e) {}
    try {
      isTravel = doc.get(ChatConstants.isTravel);
    } catch (e) {}
    try {
      travelId = doc.get(ChatConstants.travelId);
    } catch (e) {}
    return UserChat(
      id: doc.id,
      peerId: peerId,
      myPhotoUrl: myPhotoUrl,
      myName: myName,
      lastMsgDate: lastMsgDate,
      lastMsg: lastMsg,
      deleted: deleted,
      unreadMsg: unreadMsg,
      status: status,
      statusMsg: statusMsg,
      myId: currId,
      peerName: peerName,
      peerPhotoUrl: peerPhotoUrl,
      openDate: openDate,
      welMsg: welMsg,
      peerInfo: peerInfo,
      matchId: matchId,
      chattingIn: chattingIn,
      isTravel: isTravel,
      travelId: travelId
    );
  }
}