// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({super.key, required this.chat_collection});

  final String chat_collection;

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {


  final _controller = TextEditingController();

  var _userEnterMessage = '';

  Future<void> sendMessage() async {
    FocusScope.of(context).unfocus();
    final user = FirebaseAuth.instance.currentUser;
    final userData = await FirebaseFirestore.instance.collection('user')
        .doc(user!.email).get();
    FirebaseFirestore.instance.collection(widget.chat_collection).
    doc(DateTime.now().toString()).set({
      'text' : _userEnterMessage,
      'time' : Timestamp.now(),
      'userID' : user.uid,
      'userName' : userData.data()!['userName']
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
              child: TextField(
                maxLines: null,
                controller: _controller,
                decoration: InputDecoration(
                  labelText: "메세지를 입력하십시오."
                ),
                onChanged: (value){
                  setState(() {
                    _userEnterMessage = value;
                  });
                },
              )
          ),
          IconButton(
              onPressed: _userEnterMessage.trim().isEmpty ? null : sendMessage,
              icon: Icon(Icons.send),
            color: Colors.blue,
          )
        ],
      ),
    );
  }
}
