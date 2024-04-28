import 'package:chat/components/my_text_field.dart';
import 'package:chat/services/auth_service.dart';
import 'package:chat/services/chat_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key, required this.receiverEmail, required this.receiverID});

  final String receiverEmail, receiverID;

  final _messageController = TextEditingController();

  final _chatService = ChatService();
  final _authService = AuthService();

  //send message
  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(receiverID, _messageController.text);

      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(receiverEmail)),
        body: Column(children: [
          //display all messages
          Expanded(child: _buildMessageList()),

          //display user's input
          _buildUserInput(),
          const SizedBox(height: 20)
        ]));
  }

//build message list
  Widget _buildMessageList() {
    String senderID = _authService.getCurrentUser()!.uid;
    return StreamBuilder(
        stream: _chatService.getMessages(receiverID, senderID),
        builder: (context, snapshot) {
          //errors
          if (snapshot.hasError) {
            return const Text('Error');
          }
          //loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Text('loading...'));
          }

          return ListView(
            children: snapshot.data!.docs
                .map((doc) => _buildMessageItem(doc))
                .toList(),
          );
        });
  }

  //build message item
  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Text(data['message']);
  }

  //build message input
  Widget _buildUserInput() {
    return Row(
      children: [
        //text field should take up most of the space
        Expanded(
            child: MyTextField(
                controller: _messageController, hintText: 'Type a message')),
        IconButton(onPressed: sendMessage, icon: const Icon(Icons.arrow_upward))
      ],
    );
  }
}
