import 'package:chat/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatService {
  //get instance of firestore and auth
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //get user stream
  Stream<List<Map<String, dynamic>>> getUsersStream() {
    return _firestore
        .collection("Users")
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
              final user = doc.data();
              return user;
            }).toList());
  }

  //send messages
  Future<void> sendMessage(String receiverID, message) async {
    //get current user info
    final String currentUserID = _auth.currentUser!.uid;
    final String currentUserEmail = _auth.currentUser!.email!;

    final Timestamp timestamp = Timestamp.now();

    //create a new message
    Message newMessage = Message(
        senderEmail: currentUserEmail,
        message: message,
        receiverID: receiverID,
        senderID: receiverID,
        timestamp: timestamp);

    //construct chatroom ID for the two users
    List<String> ids = [currentUserID, receiverID];
    ids.sort(); //sort to ensure uniqueness
    String chatRoomID = ids.join('_');

    //add new message to database
    await _firestore
        .collection('chat_rooms')
        .doc(chatRoomID)
        .collection('messages')
        .add(newMessage.toMap());
  }

  //get messages
  Stream<QuerySnapshot> getMessages(String userID, otherUserID) {
    //construct chatroom ID for the 2 users
    List<String> ids = [userID, otherUserID];
    ids.sort();
    String chatRoomID = ids.join('_');

    return _firestore
        .collection('chat_rooms')
        .doc(chatRoomID)
        .collection('mesages')
        .orderBy('timeStamp', descending: false)
        .snapshots();
  }
}
