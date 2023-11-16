// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ReportService {
  final ReportCollection = FirebaseFirestore.instance.collection('report');

  Future<void> addReport(String? reason, String? ChatContent,
      String? Time_chat, String? username,
      Timestamp? Time_report, String? Chat_collection) async {
    int timestamp = DateTime
        .now()
        .millisecondsSinceEpoch;
    DateTime tsdate = DateTime.fromMillisecondsSinceEpoch(timestamp);
    String datetime = '${tsdate.year.toString()}년 '
        '${tsdate.month.toString()}월 '
        '${tsdate.day.toString()}일 '
        '${tsdate.hour.toString()}시 '
        '${tsdate.minute.toString()}분';
    print(datetime);
    await ReportCollection
        .doc(Chat_collection).collection('list')
        .doc(datetime)
        .set({
      '채팅내용': ChatContent,
      '신고사유': reason,
      '채팅사용자': username,
      '채팅시각': Time_chat,
      '신고시각': Time_report,
      '채팅방': Chat_collection,
    });
  }
}


class chatBubble extends StatefulWidget {
  chatBubble({
    super.key,
    required this.message,
    required this.isMe,
    required this.userName,
    required this.time,
    required this.is_marked_day,
    required this.chat_collection
  });

  final String message;
  final bool isMe;
  final String userName;
  final DateTime time;
  final bool is_marked_day;
  final String chat_collection;

  @override
  State<chatBubble> createState() => _chatBubbleState();
}

class _chatBubbleState extends State<chatBubble> {

  String report_reason = '아래 사유 중 택 1';

  Future<dynamic> _showdialog_report(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) =>
            StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return AlertDialog(
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("신고하기",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: [
                          Text("신고 사유 : ",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          Text(report_reason,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      GestureDetector(
                        child: Container(
                          child: Row(
                            children: [
                              Text("  도배 행위",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: report_reason == "도배 행위" ?
                                    Colors.white : Colors.black
                                ),),
                            ],
                          ),
                          height: 50,
                          decoration: BoxDecoration(
                              color: report_reason == "도배 행위" ? Colors
                                  .blueAccent[100] : Colors.white,
                              borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            report_reason = "도배 행위";
                          });
                        },
                      ),
                      GestureDetector(
                        child: Container(
                          child: Row(
                            children: [
                              Text("  욕설 및 비방",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: report_reason == "욕설 및 비방" ? Colors
                                        .white : Colors.black
                                ),),
                            ],
                          ),
                          height: 50,
                          decoration: BoxDecoration(
                              color: report_reason == "욕설 및 비방" ? Colors
                                  .blueAccent[100] : Colors.white,
                              borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            report_reason = "욕설 및 비방";
                          });
                        },
                      ),
                      GestureDetector(
                        child: Container(
                          child: Row(
                            children: [
                              Text("  선정성",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: report_reason == "선정성"
                                        ? Colors.white
                                        : Colors.black
                                ),),
                            ],
                          ),
                          height: 50,
                          decoration: BoxDecoration(
                              color: report_reason == "선정성" ? Colors
                                  .blueAccent[100] : Colors.white,
                              borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            report_reason = "선정성";
                          });
                        },
                      ),
                      GestureDetector(
                        child: Container(
                          child: Row(
                            children: [
                              Text("  기타",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: report_reason == "기타"
                                        ? Colors.white
                                        : Colors.black
                                ),),
                            ],
                          ),
                          height: 50,
                          decoration: BoxDecoration(
                              color: report_reason == "기타" ? Colors
                                  .blueAccent[100] : Colors.white,
                              borderRadius: BorderRadius.circular(10)
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            report_reason = "기타";
                          });
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                ReportService().addReport(
                                    report_reason,
                                    widget.message,
                                    '${widget.time.year}년 '
                                        '${widget.time.month}월 '
                                        '${widget.time.day}일 '
                                        '${widget.time.hour}시 '
                                        '${widget.time.minute}분',
                                    widget.userName,
                                    Timestamp.now(),
                                    widget.chat_collection
                                );
                                Navigator.of(context).pop();
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                          content: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 30,
                                              ),
                                              Text("신고가 접수 되었습니다. 신고를 처리하는데 최대 24시간이 소요될 수 있습니다.")
                                            ],
                                          ),
                                          actions: [
                                            ElevatedButton(
                                                onPressed: () {
                                                  report_reason = '택 1';
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text('나가기')),
                                          ],
                                          elevation: 10.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(32)),
                                          ),
                                        )
                                );
                              },
                              child: Text('신고하기',
                                style: TextStyle(
                                    fontSize: 15
                                ),)),
                        ],
                      )
                    ],
                  ),
                  actions: [
                    ElevatedButton(
                        onPressed: () {
                          report_reason = '택 1';
                          Navigator.of(context).pop();
                        },
                        child: Text('나가기')),
                  ],
                  elevation: 10.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(32)),
                  ),
                );
              },
            )
    );
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.is_marked_day)
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  "- ${widget.time.year}년 ${widget.time.month}월 ${widget.time
                      .day}일 -",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        Row(
          mainAxisAlignment:
          widget.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Padding(
              padding: widget.isMe
                  ? const EdgeInsets.fromLTRB(0, 5, 0, 5)
                  : const EdgeInsets.fromLTRB(0, 5, 0, 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.isMe == false)
                    Text(
                      "     ${widget.userName}님",
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  Container(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          if (!widget.isMe)
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  child: Container(
                                    width: widget.message.length > 29
                                        ? 240
                                        : null,
                                    child: BubbleSpecialThree(
                                      text: widget.message,
                                      color: widget.isMe
                                          ? Color(0xFF5B97F3)
                                          : Color(0xFFE3E8EE),
                                      tail: false,
                                      textStyle: TextStyle(
                                        color: widget.isMe
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 15,
                                      ),
                                      isSender: widget.isMe,
                                    ),
                                  ),
                                  onTap: () {
                                    if(widget.userName != '관리자' && widget.userName != '개발자')
                                     _showdialog_report(context);
                                  },
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      if (widget.time.hour < 10)
                                        if (widget.time.minute < 10)
                                          Text(
                                            "0${widget.time.hour}:0${widget.time
                                                .minute}",
                                            style: TextStyle(
                                              fontSize: 13,
                                            ),
                                          )
                                        else
                                          Text(
                                            "0${widget.time.hour}:${widget.time
                                                .minute}",
                                            style: TextStyle(
                                              fontSize: 13,
                                            ),
                                          )
                                      else
                                        if (widget.time.minute < 10)
                                          Text(
                                            "${widget.time.hour}:0${widget.time
                                                .minute}",
                                            style: TextStyle(
                                              fontSize: 13,
                                            ),
                                          )
                                        else
                                          Text(
                                            "${widget.time.hour}:${widget.time
                                                .minute}",
                                            style: TextStyle(
                                              fontSize: 13,
                                            ),
                                          )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          if (widget.isMe)
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  child: Column(
                                    children: [
                                      if (widget.time.hour < 10)
                                        if (widget.time.minute < 10)
                                          Text(
                                            "0${widget.time.hour}:0${widget.time
                                                .minute}",
                                            style: TextStyle(
                                              fontSize: 13,
                                            ),
                                          )
                                        else
                                          Text(
                                            "0${widget.time.hour}:${widget.time
                                                .minute}",
                                            style: TextStyle(
                                              fontSize: 13,
                                            ),
                                          )
                                      else
                                        if (widget.time.minute < 10)
                                          Text(
                                            "${widget.time.hour}:0${widget.time
                                                .minute}",
                                            style: TextStyle(
                                              fontSize: 13,
                                            ),
                                          )
                                        else
                                          Text(
                                            "${widget.time.hour}:${widget.time
                                                .minute}",
                                            style: TextStyle(
                                              fontSize: 13,
                                            ),
                                          )
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  child: Container(
                                    width: widget.message.length > 29
                                        ? 240
                                        : null,
                                    child: BubbleSpecialThree(
                                      text: widget.message,
                                      color: widget.isMe
                                          ? Color(0xFF5B97F3)
                                          : Color(0xFFE3E8EE),
                                      tail: true,
                                      textStyle: TextStyle(
                                        color: widget.isMe
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 15,
                                      ),
                                      isSender: widget.isMe,
                                    ),
                                  ),
                                  onTap: () {},
                                ),

                              ],
                            ),
                        ],
                      ))
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
