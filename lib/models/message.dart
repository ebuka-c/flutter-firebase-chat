import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderID, senderEmail, receiverID, message;
  final Timestamp timestamp;

  Message(
      {required this.senderEmail,
      required this.message,
      required this.receiverID,
      required this.senderID,
      required this.timestamp});

  //convert to map
  Map<String, dynamic> toMap() {
    return {
      'senderID': senderID,
      'senderEmail': receiverID //senderEmail
      ,
      'receiverID': receiverID,
      'message': message,
      'timeStamp': timestamp
    };
  }
}
