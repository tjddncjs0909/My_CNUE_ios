// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_cnue/chatting/chat/message.dart';
import 'package:my_cnue/chatting/chat/new_message.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:url_launcher/url_launcher.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _authentication = FirebaseAuth.instance;
  User? loggedUser;
  String userName = "";

  final db = FirebaseFirestore.instance;

  static String year = "";
  static String month = "";
  static String day = "";
  static String hour = "";
  static String min = "";

  static String content1 = "";
  static String content2 = "";
  static String content3 = "";
  static String content4 = "";
  static String content5 = "";
  static String content6 = "";

  Refreshing() async {
    await db
        .collection('user')
        .doc('${loggedUser!.email}')
        .get()
        .then((DocumentSnapshot ds) {
      Map<String, dynamic> map = ds.data() as Map<String, dynamic>;
      userName = map['userName'];
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
    Refreshing();
  }

  void getCurrentUser() {
    try {
      final user = _authentication.currentUser;
      if (user != null) {
        loggedUser = user;
        print(loggedUser!.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'MY CNUE',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.exit_to_app_sharp,
              color: Colors.black,
            ),
            onPressed: () {
              _authentication.signOut();
              // Navigator.pop(context);
            },
          )
        ],
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TimerBuilder.periodic(Duration(seconds: 1), builder: (context) {
                return Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "<접속 ID>",
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "$userName",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "님",
                            style: TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "${loggedUser!.email}",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.green[100],
                    borderRadius: BorderRadius.circular(20),
                  ),
                );
              }),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      launchUrl(
                          Uri.parse(
                              'https://www.jobkorea.co.kr/service/user/tool/spellcheck'),
                          mode: LaunchMode.externalApplication);
                    },
                    icon: Icon(
                      Icons.language_rounded,
                      size: 35,
                      color: Colors.red[300],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("맞춤법"),
                  Text("검사")
                ],
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      launchUrl(Uri.parse('https://www.ilovepdf.com/'),
                          mode: LaunchMode.externalApplication);
                    },
                    icon: Icon(
                      Icons.layers,
                      size: 35,
                      color: Colors.orangeAccent[400],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("문서"),
                  Text("변환"),
                ],
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      launchUrl(Uri.parse('https://linktr.ee/cnue'),
                          mode: LaunchMode.externalApplication);
                    },
                    icon: Icon(
                      Icons.question_answer_rounded,
                      size: 35,
                      color: Colors.indigo[300],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("총학생회"),
                  Text("소통 창구")
                ],
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      launchUrl(
                          Uri.parse('https://subway.emzmit.com/'
                              '%EA%B2%BD%EC%B6%98%EC%84%A0/%EB%82%A8%EC%B6%98%EC%B2%9C'),
                          mode: LaunchMode.externalApplication);
                    },
                    icon: Icon(
                      Icons.schedule,
                      size: 35,
                      color: Colors.brown[400],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("지하철"),
                  Text("시간표")
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            '앱 업데이트 공지사항',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 400,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Messages(chat_collection: "inquiry"),
                ),
                if (loggedUser?.email == "20221127@student.cnue.ac.kr")
                  NewMessage(
                    chat_collection: "inquiry",
                  ),
                if (loggedUser?.email != "20221127@student.cnue.ac.kr")
                  SizedBox(
                    height: 20,
                  ),
              ],
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.black)),
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            'Ver : 2.1.2',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "문의",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  const Icon(Icons.email),
                  Text(' (비밀번호 재설정, 로그인, ID생성 등) '),
                  SizedBox(
                    width: 5,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text('Email 1 : '),
                  TextButton(
                      style: TextButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () {
                        final url = Uri(
                          scheme: 'mailto',
                          path: 'tjddncjs0909@naver.com',
                          query: 'subject= &body= ',
                        );
                        launchUrl(url, mode: LaunchMode.externalApplication);
                      },
                      child: Text("tjddncjs0909@naver.com")),
                ],
              ),
              Row(
                children: [
                  Text('Email 2 : '),
                  TextButton(
                      style: TextButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: () {
                        final url = Uri(
                          scheme: 'mailto',
                          path: '20221127@student.cnue.ac.kr',
                          query: 'subject= &body= ',
                        );
                        launchUrl(url, mode: LaunchMode.externalApplication);
                      },
                      child: Text("20221127@student.cnue.ac.kr")),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Colors.blue[300])
                    ),
                      onPressed: () async {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: Text('회원 탈퇴'),
                              content: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "정말 ID를 삭제 하시겠습니까?",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 40,
                                      ),
                                      Text("삭제할 ID 정보",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20
                                      ),),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Text("Email : ${loggedUser!.email}"),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text("닉네임 : ${userName}"),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                ],
                              ),
                              actions: [
                                Row(
                                  children: [
                                    ElevatedButton(
                                        onPressed: () async {
                                          FirebaseAuth.instance.currentUser!
                                              .delete();
                                          await FirebaseAuth.instance.signOut();
                                          Navigator.of(context).pop();
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  AlertDialog(
                                                    title: Text("회원 탈퇴"),
                                                    content: Column(
                                                      children: [
                                                        Text("사용자 ID가 제거 되었습니다."),
                                                      ],
                                                    ),
                                                    actions: [
                                                      ElevatedButton(
                                                          onPressed: () {
                                                            Navigator.of(context)
                                                                .pop();
                                                          },
                                                          child: Text("확인"))
                                                    ],
                                                  ));
                                        },
                                        child: Text('예')),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(
                                        '취소',
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                      style: ButtonStyle(
                                          backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.white)),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    )
                                  ],
                                  mainAxisAlignment: MainAxisAlignment.end,
                                ),
                              ],
                              elevation: 10.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(32)),
                              ),
                            ));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("  ID 삭제   ",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),)
                        ],
                      )
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                '개발진',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '개발 총괄 및 관리',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                '윤리 22 천우성',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '도와주신 분들',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                '컴퓨터 22 김환동',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              Text(
                '윤리 23 김수정',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
