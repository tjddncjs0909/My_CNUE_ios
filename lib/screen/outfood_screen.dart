// ignore_for_file: prefer_const_constructors, prefer_final_fields, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations, sort_child_properties_last

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:my_cnue/Screen/schoolfood_screen.dart';
import 'package:my_cnue/chatting/chat/new_message.dart';
import 'package:my_cnue/main.dart';
import 'package:my_cnue/screen/main_screen.dart';
import 'package:my_cnue/screen/my_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../chatting/chat/message.dart';


class OutFoodScreen extends StatefulWidget {
  const OutFoodScreen({Key? key}) : super(key: key);

  @override
  State<OutFoodScreen> createState() => _OutFoodScreenState();
}

class _OutFoodScreenState extends State<OutFoodScreen> {


  @override
  void initState() {
    // TODO: implement initState
    _locationPermissionRequest();
  }

  late NaverMapController _mapController;
  final Completer<NaverMapController> mapControllercompleter = Completer();

  final db = FirebaseFirestore.instance;

  marker(String id, NLatLng latLng, Size size) {
    return NMarker(
      id: id,
      position: latLng,
      size: size,
    );
  }

  infoWindow(String id, String text) {
    return NInfoWindow.onMarker(
        id: id,
        text: text
    );
  }

  marker_Size(double width, double height) {
    return Size(width, height);
  }

  double marker_size_width = 20;
  double marker_size_height = 30;

  info_alliance(String alliance1, String alliance2, String alliance3,
      String alliance4) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("${alliance1}",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),),
        Text("${alliance2}",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),),
        Text("${alliance3}",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),),
        Text("${alliance4}",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final pixelRatio = mediaQuery.devicePixelRatio;
    final mapSize = Size(mediaQuery.size.width, mediaQuery.size.height);
    final physicalSize = Size(
        mapSize.width * pixelRatio, mapSize.height * pixelRatio);


    return  Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('MY CNUE',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold
              ),),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: naverMapSection(),
        floatingActionButton: GestureDetector(
          onTap: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) =>
                    school_food_screen()
                ),
            );
          },
          child: Image.asset(
            "asset/KakaoTalk_Photo_2023-08-07-01-02-00.png",
            width: 100
          ),
        )
    );
  }

  Widget naverMapSection() =>
      NaverMap(

        options: const NaverMapViewOptions(
          indoorEnable: true,
          locationButtonEnable: true,
          consumeSymbolTapEvents: true,
          zoomGesturesEnable: true,
          rotationGesturesEnable: true,

          // 카메라 초기 위치
          initialCameraPosition: NCameraPosition(
            // 춘천교대
              target: NLatLng(37.85927003630758, 127.74758462114653),
              zoom: 15
          ),
        ),

        // 맵 초기설정
        onMapReady: (controller) async {
          _mapController = controller;
          mapControllercompleter.complete(controller);

          int num = 0;

          String update_year = "";
          String update_month = "";
          String update_day = "";

          List<dynamic> marker_list = [];
          List<dynamic> infoWindow_list = [];
          List<dynamic> info_web_url_list = [];
          List<dynamic> info_name_list = [];
          List<dynamic> info_alliance_list = [];

          await db.collection('제휴식당').doc('res_001')
              .get().then((DocumentSnapshot ds) {
            Map<String, dynamic> map = ds.data() as Map<String, dynamic>;
            num = map['number'];
          }
          );

          await db.collection('제휴식당').doc('update_day')
              .get().then((DocumentSnapshot ds) {
            Map<String, dynamic> map = ds.data() as Map<String, dynamic>;
            update_year = map['year'];
            update_month = map['month'];
            update_day = map['day'];
          }
          );

          for (int i = 0; i < num; i++) {
            if (i + 1 < 10) {
              await db.collection('제휴식당').doc('res_00${i + 1}')
                  .get().then((DocumentSnapshot ds) {
                Map<String, dynamic> map = ds.data() as Map<String, dynamic>;
                marker_list.insert(i, marker(
                    map['id'], NLatLng(map['lat'], map['lng']),
                    marker_Size(marker_size_width, marker_size_height)));
                infoWindow_list.insert(i, infoWindow(map['id'], map['상호명']));
                info_web_url_list.insert(i, map['link']);
                info_name_list.insert(i, map['상호명']);
                info_alliance_list.insert(i, info_alliance(
                    map['alli1'], map['alli2'], map['alli3'], map['alli4']));
              }
              );
            }
            else if (i + 1 < 100 && i + 1 >= 10) {
              await db.collection('제휴식당').doc('res_0${i + 1}')
                  .get().then((DocumentSnapshot ds) {
                Map<String, dynamic> map = ds.data() as Map<String, dynamic>;
                marker_list.insert(i, marker(
                    map['id'], NLatLng(map['lat'], map['lng']),
                    marker_Size(marker_size_width, marker_size_height)));
                infoWindow_list.insert(i, infoWindow(map['id'], map['상호명']));
                info_web_url_list.insert(i, map['link']);
                info_name_list.insert(i, map['상호명']);
                info_alliance_list.insert(i, info_alliance(
                    map['alli1'], map['alli2'], map['alli3'], map['alli4']));
              }
              );
            }
            else {
              await db.collection('제휴식당').doc('res_${i + 1}')
                  .get().then((DocumentSnapshot ds) {
                Map<String, dynamic> map = ds.data() as Map<String, dynamic>;
                marker_list.insert(i, marker(
                    map['id'], NLatLng(map['lat'], map['lng']),
                    marker_Size(marker_size_width, marker_size_height)));
                infoWindow_list.insert(i, infoWindow(map['id'], map['상호명']));
                info_web_url_list.insert(i, map['link']);
                info_name_list.insert(i, map['상호명']);
                info_alliance_list.insert(i, info_alliance(
                    map['alli1'], map['alli2'], map['alli3'], map['alli4']));
              }
              );
            }
            _mapController.addOverlay(marker_list[i]);
            infoWindow_list[i].setOnTapListener((overlay) =>
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>
                        information1(
                          info_web_url: info_web_url_list[i],
                          info_name: info_name_list[i],
                          info_alliance: info_alliance_list[i],
                          update_year: update_year,
                          update_month: update_month,
                          update_day: update_day,
                        )
                    )
                ),
            );
            await marker_list[i].openInfoWindow(infoWindow_list[i]);
          }
        },
        onMapTapped: (point, latLng) async {
          print(latLng);
        },
      );

  // 위치 정보 수집 권한 message
  Future<void> _locationPermissionRequest() async {
    final permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      final requestPermission = await Geolocator.requestPermission();
      if (requestPermission == LocationPermission.denied) {}
    }
  }
}

class information1 extends StatefulWidget {
  const information1({Key? key,
    required this.info_web_url,
    required this.info_name,
    required this.info_alliance,
    required this.update_year,
    required this.update_month,
    required this.update_day})
      : super(key: key);

  final String info_web_url;
  final String info_name;
  final dynamic info_alliance;
  final String update_year;
  final String update_month;
  final String update_day;

  @override
  State<information1> createState() => _information1State();
}

class _information1State extends State<information1> {

  @override
  void initState() {
    // TODO: implement initState
    getCurrentUser();
  }

  final _authentication = FirebaseAuth.instance;
  User? loggedUser;
  String userName = "";
  bool is_logined = false;
  void getCurrentUser() {
    try {
      final user = _authentication.currentUser;
      if (user != null) {
        loggedUser = user;
        is_logined = true;
        print(loggedUser!.email);
      }
      else{
        is_logined = false;
      }
    } catch (e) {
      print(e);
    }
  }


  @override
  Widget build(BuildContext context1) {
    return Scaffold(
        appBar: AppBar(
          title: Text('제휴 정보',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold
            ),),
          backgroundColor: Colors.grey[300],
          iconTheme: IconThemeData(
            color: Colors.black, //색변경
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.settings,
                  color: Colors.black,)
            ),
          ],
          elevation: 0.0,
        ),
        body: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Text("${widget.info_name}",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              height: 5,
              thickness: 1.5,
              color: Colors.black,
            ),
            SizedBox(
              height: 10,
            ),
            Text("★ 제휴 ★",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent
              ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                widget.info_alliance
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              height: 5,
              thickness: 1.5,
              color: Colors.black,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("자세히 보기 - ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                  ),),
                Text("(네이버 플레이스 제공)",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                  ),),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    launchUrl(
                        Uri.parse("${widget.info_web_url}"),
                        mode: LaunchMode.externalApplication);
                    Navigator.pop(context1);
                  },
                  child: Image.asset(
                    "asset/naver_map.png",
                    height: MediaQuery
                        .of(context)
                        .size
                        .height / 8,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width / 8,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.arrow_back),
                Text("클릭하세요",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black
                  ),),
              ],
            ),
            Text("사용자 리뷰",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 350,
              height: 500,
              child: is_logined == true ? Column(
                children: [
                  Expanded(
                    child: Messages(chat_collection: "_${widget.info_name}",),
                  ),
                  NewMessage(chat_collection: "_${widget.info_name}",),
                ],
              ) : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("채팅 기능을 이용하기 위해서는"),
                    Text("로그인 해주시기 바랍니다."),
                    TextButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        child: Text("메인 화면"))
                  ],
                )
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black)),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("※공지사항※",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),),
                Text("최근 업데이트 : ${widget.update_year}/${widget
                    .update_month}/${widget.update_day}")
              ],
            ),
            Container(
                padding: EdgeInsets.all(10),
                height: 500,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("#1 제휴를 이용하고자 하는 학우분들께서는 업체에",),
                    Text("“춘천교대 학생”임을 반드시 먼저 언급해주시기 바랍니다",
                      style: TextStyle(
                          color: Colors.red
                      ),
                    ),
                    Text("업체 담당자분들께서 제휴 혜택을 주시기 위해서는 확인이 필요하니 "
                        "이 점 꼭 유의해주세요."),
                    SizedBox(
                      height: 10,
                    ),
                    Text("#2 제휴 내용 및 업체 현황에 혹시 오류가 있을 경우,"),
                    Row(
                      children: [
                        TextButton(
                            style: TextButton.styleFrom(
                              minimumSize: Size.zero,
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            onPressed: () {
                              launchUrl(Uri.parse(
                                  "https://www.instagram.com/cnue39uni_jehue/"),
                                  mode: LaunchMode.externalApplication
                              );
                              Navigator.pop(context1);
                            },
                            child: Text("총학생회 제휴 인스타그램 계정")),
                        Text("을")
                      ],
                    ),
                    Text("참고해주시기 바랍니다."),
                    SizedBox(
                      height: 20,
                    ),
                    Text("#3 제휴 업체는 학식과 달리 상시 업데이트 합니다."),
                  ],
                )
            ),
          ],
        )
    );
  }
}