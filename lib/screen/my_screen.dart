// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:url_launcher/url_launcher.dart';

class MyScreen extends StatefulWidget {
  const MyScreen({Key? key}) : super(key: key);

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {

  final Uri url1 = Uri.parse('https://github.com/tjddncjs0909/tjddncjs0909');

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

  Refreshing()async{
    await db.collection('공지사항').doc('날짜')
        .get().then((DocumentSnapshot ds) {
      Map<String, dynamic> map = ds.data() as Map<String, dynamic>;
      year = map['year'];
      month = map['month'];
      day = map['day'];
      hour = map['hour'];
      min = map['minutes'];
    }
    );
    await db.collection('공지사항').doc('내용')
        .get().then((DocumentSnapshot ds) {
      Map<String, dynamic> map = ds.data() as Map<String, dynamic>;
      content1 = map['내용1'];
      content2 = map['내용2'];
      content3 = map['내용3'];
      content4 = map['내용4'];
      content5 = map['내용5'];
      content6 = map['내용6'];
    }
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Refreshing();
  }

  void showToast(){
    Fluttertoast.showToast(
      msg: "공지사항이 업데이트 되었습니다.",
      gravity: ToastGravity.BOTTOM,
      fontSize: 13,
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: Colors.black,
      textColor: Colors.white70,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('MY CNUE',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold
            ),),
          iconTheme: IconThemeData(
              color: Colors.black
          ),
          backgroundColor: Colors.white,
          actions: [
            IconButton(
                onPressed: (){
                  Refreshing();
                  showToast();
                },
                color: Colors.black,
                icon: Icon(Icons.refresh_rounded)),
            IconButton(
                onPressed: (){
                },
                icon: Icon(Icons.settings,
                  color: Colors.black,)),
          ],
          elevation: 0.0,
        ),
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.all(20),
            children: [
              Text('My CNUE',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('(학교 생활 도우미)',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text('Ver : 2.0.0',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 10,
              ),

              Text('앱 공지사항',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TimerBuilder.periodic(
                  Duration(seconds: 1), builder: (context){
                return Container(
                  margin: EdgeInsets.all(0),
                  padding: EdgeInsets.all(20),
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.greenAccent[100],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("$year/$month/$day $hour:$min",
                            style: TextStyle(
                                fontSize: 20
                            ),)
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("$content1",
                        style: TextStyle(
                            fontSize: 18
                        ),),
                      SizedBox(
                        height: 10,
                      ),
                      Text("$content2",
                        style: TextStyle(
                            fontSize: 18
                        ),),
                      SizedBox(
                        height: 10,
                      ),
                      Text("$content3",
                        style: TextStyle(
                            fontSize: 18
                        ),),
                      SizedBox(
                        height: 10,
                      ),
                      Text("$content4",
                        style: TextStyle(
                            fontSize: 18
                        ),),
                      SizedBox(
                        height: 10,
                      ),
                      Text("$content5",
                        style: TextStyle(
                            fontSize: 18
                        ),),
                      SizedBox(
                        height: 10,
                      ),
                      Text("$content6",
                        style: TextStyle(
                            fontSize: 18
                        ),),
                    ],
                  ),
                );
              }
              ),
              SizedBox(
                height: 20,
              ),
              Divider(
                thickness: 1,
                color: Colors.black,
              ),
              Text('문의',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold
                ),
              ),
              Text('(디자인 및 기능 제안, 오류 제보 등)',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text('E-Mail : ',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: (){
                        final url = Uri(
                          scheme: 'mailto',
                          path: 'tjddncjs0909@naver.com',
                          query: 'subject=Hello&body=Test',
                        );
                        launchUrl(url,
                            mode: LaunchMode.externalApplication
                        );
                      },
                      child: Text("tjddncjs0909@naver.com")),
                ],
              ),
              Row(
                children: [
                  Text('카톡 익명 채팅 : ',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                        minimumSize: Size.zero,
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      onPressed: (){
                        launchUrl(Uri.parse("https://open.kakao.com/o/sI8WKr7e"),
                            mode: LaunchMode.externalApplication
                        );
                      },
                      child: Text("My CNUE 익명 제보")),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  OutlinedButton(
                    onPressed:(){
                      launchUrl(Uri.parse("https://github.com/tjddncjs0909/tjddncjs0909"),
                          mode: LaunchMode.externalApplication);
                    },
                    child: Text('Github',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(':   소스코드 공개, 앱 공지사항',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text('해당 앱은 춘천교대 재학생이 학생들의 편의를 위해 비영리 목적으로 만든 앱입니다.'
                  ' 해당 앱을 통한 개인적인 비영리 목적의 활용 및 2차 창작은 얼마든지 허용됩니다.',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
        )
    );
  }
}