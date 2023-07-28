import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nuri/ui/screen/chat/chat_constants/chat_constants.dart';

class ChatMenuProvider {
  final FirebaseFirestore firebaseFirestore;
  ChatMenuProvider({required this.firebaseFirestore});

  Future<void> updateDataFirestore(String collectionPath, String path, Map<String, String> dataNeedUpdate) {
    return firebaseFirestore.collection(collectionPath).doc(path).update(dataNeedUpdate);
  }

  Stream<QuerySnapshot> getStreamFireStore(String pathCollection, int limit, String userId) {
    return firebaseFirestore.collection(ChatConstants.pathMessageCollection)
        .limit(limit)
        .where('users', arrayContains: userId)
        .where(userId+'deleted', isEqualTo: false)
        .snapshots();

  }
}