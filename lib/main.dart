// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:my_cnue/firebaseNotification.dart';
import 'package:my_cnue/notification.dart';
import 'package:my_cnue/screen/announce_parse.dart';
import 'package:my_cnue/screen/chat_screen.dart';
import 'package:my_cnue/screen/main_screen.dart';
import 'package:my_cnue/screen/major_screen.dart';
import 'package:my_cnue/screen/outfood_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:permission_handler/permission_handler.dart';

const apikey = 'nhzb9jix8b';

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main()async{
  final notificationService = NotificationService();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await NaverMapSdk.instance.initialize(
      clientId: apikey,
  );
  await notificationService.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    _requestNotificationPermissions(); // 알림 권한 요청
    super.initState();
  }

  void _requestNotificationPermissions() async {
    //알림 권한 요청
    final status = await NotificationService().requestNotificationPermissions();
    if (status.isDenied && context.mounted) {
      showDialog(
        // 알림 권한이 거부되었을 경우 다이얼로그 출력
        context: context,
        builder: (context) => AlertDialog(
          title: Text('알림 권한이 거부되었습니다.'),
          content: Text('알림을 받으려면 앱 설정에서 권한을 허용해야 합니다.'),
          actions: <Widget>[
            TextButton(
              child: Text('설정'), //다이얼로그 버튼의 죄측 텍스트
              onPressed: () {
                Navigator.of(context).pop();
                openAppSettings(); //설정 클릭시 권한설정 화면으로 이동
              },
            ),
            TextButton(
              child: Text('취소'), //다이얼로그 버튼의 우측 텍스트
              onPressed: () => Navigator.of(context).pop(), //다이얼로그 닫기
            ),
          ],
        ),
      );
    }
  }

  static const TextStyle optionStyle =
  TextStyle(fontSize: 40, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    myApp(),
    MajorScreen(),
    OutFoodScreen(),
    ChatScreen1(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.campaign_sharp),
            label: '공지사항',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: '학내 연락처',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: '학식 및 제휴',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'MY',
          )
        ],
        selectedItemColor: Colors.blue[300],
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
        unselectedLabelStyle: TextStyle(fontSize: 15),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

class ChatScreen1 extends StatefulWidget {
  const ChatScreen1({super.key});

  @override
  State<ChatScreen1> createState() => _ChatScreen1State();
}

class _ChatScreen1State extends State<ChatScreen1> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot){
            if(snapshot.hasData && snapshot.data?.emailVerified == true){
              print('success');
              return ChatScreen();
            }
            return LoginSignupScreen();
          }
      ),
    );
  }
}


