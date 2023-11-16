// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:my_cnue/chatting/chat/chat_bubble.dart';

class Messages extends StatefulWidget {
  const Messages({super.key, required this.chat_collection});

  final String chat_collection;

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection(widget.chat_collection)
            .orderBy('time', descending: false)
            .snapshots(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final chatDocs = snapshot.data!.docs;
          final _controller = ScrollController();

          SchedulerBinding.instance.addPostFrameCallback((_) {
            _controller.jumpTo(_controller.position.maxScrollExtent);
          });

          return Scrollbar(
            child: ListView.builder(
                controller: _controller,
                reverse: false,
                itemCount: chatDocs.length,
                itemBuilder: (context1, index) {
                  DateTime dateTime = chatDocs[index]['time'].toDate();
                  if (index != 0) {
                    DateTime dateTime_pre =
                        chatDocs[index - 1]['time'].toDate();
                    return chatBubble(
                      message: chatDocs[index]['text'],
                      isMe: chatDocs[index]['userID'].toString() == user!.uid,
                      userName: chatDocs[index]['userName'],
                      time: dateTime,
                      is_marked_day: dateTime.year == dateTime_pre.year &&
                              dateTime.month == dateTime_pre.month &&
                              dateTime.day == dateTime_pre.day
                          ? false
                          : true,
                      chat_collection: widget.chat_collection,
                    );
                  } else {
                    return chatBubble(
                      message: chatDocs[index]['text'],
                      isMe: chatDocs[index]['userID'].toString() == user!.uid,
                      userName: chatDocs[index]['userName'],
                      time: dateTime,
                      is_marked_day: true,
                      chat_collection: widget.chat_collection,
                    );
                  }
                }),
          );
        });
  }
}
