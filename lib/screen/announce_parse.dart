// ignore_for_file: sort_child_properties_last, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_interpolation_to_compose_strings, non_constant_identifier_names

import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart' as parser;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:url_launcher/url_launcher.dart';

import '../main.dart';
import '../model/bookmark.dart';
import '../notification.dart';

class BookmarkService {
  final bookmarkCollection = FirebaseFirestore.instance.collection('Bookmark');

  Future<void> addBookmark(String? userId, String? websiteName,
      String? websiteUrl, String? Time) async {
    await bookmarkCollection
        .doc(userId)
        .collection('list')
        .doc(websiteName)
        .set({
      'url': websiteUrl,
      'title': websiteName,
      'time': Time,
    });
  }

  Future<void> removeBookmark(
    String? userId,
    String? websiteName,
  ) async {
    await bookmarkCollection
        .doc(userId)
        .collection('list')
        .doc(websiteName)
        .delete();
  }
}

class myApp extends StatefulWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  _myAppState createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  final db = FirebaseFirestore.instance;
  final _authentication = FirebaseAuth.instance;
  User? loggedUser;

  int Num = 9;

  List<int> ann_adding_num = [1, 1, 1];

  int top_box_num = 0;
  int ann_lim = 0;
  int is_selected_ann_index = 1;

  @override
  void initState() {
    super.initState();

    selectingnum1 = 4;
    extractData1(selectingnum1 + 2, ann_lim);
    getCurrentUser();
    isLoading = true;
    if (loggedUser != null){
      get_bookmark_data(loggedUser!.email);
    }
    isLoading = false;
  }

  @override
  void disposed() {
    super.dispose();
    isLoading = false;
    ann_lim = 0;
  }

  List<String> responseString1_num = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  List<String> responseString1_title = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  List<String> responseString1_time = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  List<String> responseString1_link = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  List<bool> bool1_new = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  List<String> responseString1_num_const = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  List<String> responseString1_title_const = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  List<String> responseString1_time_const = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  List<String> responseString1_link_const = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  List<bool> bool1_new_const = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  List<String> responseString2_title = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  List<String> responseString2_time = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  List<String> responseString2_link = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  List<String> responseString2_num = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];

  List<String> responseString3_title = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  List<String> responseString3_time = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  List<String> responseString3_link = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  List<String> responseString3_num = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];

  // boolean to show CircularProgressIndication
  // while Web Scraping awaits

  bool isLoading = false;
  int selectingnum1 = 4;
  bool is_selected = true;
  int endNum = 1;

  bool is_selected_ann = false;

  // Getting User Information
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


  // Extracting Notice Information function(Web parsing)
  // 1. gen Notice
  Future<dynamic> extractData1(int annSelNum, int limit) async {
    HttpOverrides.global = MyHttpOverrides();
    //Getting the response from the targeted url
    isLoading = true;
    if (annSelNum == 4) {
      annSelNum = 1;
    }
    final response = await http.Client()
        .get(Uri.parse('https://www.cnue.ac.kr/cnue/news/notice0$annSelNum.do?'
            'mode=list&&articleLimit=10&article.offset=$limit'));
    final String url = 'https://www.cnue.ac.kr/cnue/news/notice0$annSelNum.do';
    //Status Code 200 means response has been received successfully
    if (response.statusCode == 200) {
      //Getting the html document from the response
      var document = parser.parse(response.body);
      try {
        isLoading = true;
        endNum = 1;
        top_box_num = 0;

        // 중요 공지 갯수 (top_box_num) extracting
        for (int i = 0; i < endNum; i++) {
          var response0 =
              document.getElementsByClassName("board-table")[0].children[3];
          if (response0.children[i].className.toString().trim() ==
              "b-top-box") {
            endNum++;
            top_box_num++;
          } else {
            print(top_box_num);
            endNum = 0;
          }
        }
        // 중요 공지 extracting
        for (int i = 0; i < top_box_num; i++) {
          var response0 = document
              .getElementsByClassName('board-table')[0]
              .children[3]
              .children[0 + i];
          if (response0.className.toString().trim() == "b-top-box") {
            responseString1_title_const[i] = response0
                .children[1].children[0].children[0].attributes['title']
                .toString();
            responseString1_title_const[i] = responseString1_title_const[i]
                .substring(0, responseString1_title_const[i].length - 6);
            responseString1_link_const[i] = url +
                response0.children[1].children[0].children[0].attributes['href']
                    .toString();
            responseString1_time_const[i] = response0.children[3].text.trim();
            print(responseString1_title_const[i]);
            print(responseString1_time_const[i]);
            print(responseString1_link_const[i]);
          }
        }
        // 일반 공지 extractin
        for (int i = 0; i < 10; i++) {
          var response0 = document
              .getElementsByClassName('board-table')[0]
              .children[3]
              .children[top_box_num + i];
          responseString1_title[i] =
              response0.children[1].children[0].children[0].text.trim();
          responseString1_link[i] = url +
              response0.children[1].children[0].children[0].attributes['href']
                  .toString();
          responseString1_time[i] = response0.children[3].text.trim();
        }

        isLoading = false;

        return [" Data Parsing Completed"];
      } catch (e) {
        return ['', '', 'ERROR!'];
      }
    } else {
      return ['', '', 'ERROR: ${response.statusCode}.'];
    }
  }
  // 2. const Notice
  Future<dynamic> extractData2(int limit) async {
    //Getting the response from the targeted url
    isLoading = true;
    final response = await http.Client()
        .get(Uri.parse('https://www.cnue.ac.kr/life/community/notice.do?'
            'mode=list&&articleLimit=10&article.offset=$limit'));
    const String url = 'https://www.cnue.ac.kr/life/community/notice.do';
    //Status Code 200 means response has been received successfully
    if (response.statusCode == 200) {
      //Getting the html document from the response
      var document = parser.parse(response.body);

      try {
        isLoading = true;
        endNum = 1;
        top_box_num = 0;

        // 중요 공지 갯수 (top_box_num) extracting
        for (int i = 0; i < endNum; i++) {
          var response0 =
              document.getElementsByClassName("board-table")[0].children[3];
          if (response0.children[i].className.toString().trim() ==
              "b-top-box") {
            endNum++;
            top_box_num++;
          } else {
            print(top_box_num);
            endNum = 0;
          }
        }
        // 중요 공지 extracting
        for (int i = 0; i < top_box_num; i++) {
          var response0 = document
              .getElementsByClassName('board-table')[0]
              .children[3]
              .children[0 + i];
          if (response0.className.toString().trim() == "b-top-box") {
            responseString1_title_const[i] = response0
                .children[1].children[0].children[0].attributes['title']
                .toString();
            responseString1_title_const[i] = responseString1_title_const[i]
                .substring(0, responseString1_title_const[i].length - 6);
            responseString1_link_const[i] = url +
                response0.children[1].children[0].children[0].attributes['href']
                    .toString();
            responseString1_time_const[i] = response0.children[3].text.trim();
            print(responseString1_title_const[i]);
            print(responseString1_time_const[i]);
            print(responseString1_link_const[i]);
          }
        }
        // 일반 공지 extractin
        for (int i = 0; i < 10; i++) {
          var response0 = document
              .getElementsByClassName('board-table')[0]
              .children[3]
              .children[top_box_num + i];
          responseString1_title[i] =
              response0.children[1].children[0].children[0].text.trim();
          responseString1_link[i] = url +
              response0.children[1].children[0].children[0].attributes['href']
                  .toString();
          responseString1_time[i] = response0.children[3].text.trim();
        }

        isLoading = false;

        return [" Data Parsing Completed"];
      } catch (e) {
        return ['', '', 'ERROR!'];
      }
    } else {
      return ['', '', 'ERROR: ${response.statusCode}.'];
    }
  }
  // 3. Bookmark information for each (from : Firebase)
  Future<void> get_bookmark_data(String? useremail) async {
    final db = FirebaseFirestore.instance.collection('Bookmark');
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await db.doc(useremail).collection('list').get();

    final bookmark_list = snapshot.docs.map((e) => e.data()).toList();
    if (this.mounted) {
      setState(() {
        Num = snapshot.size;
        for (int i = 0; i < snapshot.size; i++) {
          responseString1_link[i] = bookmark_list[i]['url'];
          responseString1_time[i] = bookmark_list[i]['time'];
          responseString1_title[i] = bookmark_list[i]['title'];
        }
      });
    }
  }


  // Notice Container UI function
  // 1.gen Notice
  Widget Container_info(String link, String title, String time) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
        padding: EdgeInsets.fromLTRB(15, 10, 10, 10),
        height: 95,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 280,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title.length < 35 ? title : "${title.substring(0, 35)}....",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    "20$time",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      launchUrl(Uri.parse(link),
                          mode: LaunchMode.externalApplication);
                    },
                    child: const Icon(
                      Icons.arrow_forward,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                    GestureDetector(
                      onTap: () {
                        try {
                          if (loggedUser != null){
                            BookmarkService().addBookmark(
                                loggedUser?.email,
                                title.length < 35
                                    ? title
                                    : "${title.substring(0, 35)}....",
                                link,
                                time);
                            Fluttertoast.showToast(msg: "북마크 목록에 추가되었습니다.");
                          }
                          if(loggedUser == null){
                            Fluttertoast.showToast(msg: "북마크 기능을 이용하려면 로그인을 해주시기 바랍니다.");
                          }
                        } catch (e) {
                          Fluttertoast.showToast(msg: "북마크 목록 추가에 실패하였습니다.");
                          print(e);
                        }
                      },
                      child: const Icon(
                        Icons.bookmark,
                        color: Colors.white,
                      ),
                    ),
                ],
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xff109ca2), Color(0xFD476DEE)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
  // 2.const Notice
  Widget Container_info_const(String link, String title, String time) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
        padding: EdgeInsets.fromLTRB(15, 10, 10, 15),
        height: 95,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 280,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title.length < 35 ? title : "${title.substring(0, 35)}....",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    "20$time",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          launchUrl(Uri.parse(link),
                              mode: LaunchMode.externalApplication);
                        },
                        child: const Icon(
                          Icons.arrow_forward,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            if (is_selected == true) {
                              is_selected = false;
                            } else {
                              is_selected = true;
                            }
                          },
                          child: SizedBox())
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    try {
                      if (loggedUser != null){
                        BookmarkService().addBookmark(
                            loggedUser?.email,
                            title.length < 35
                                ? title
                                : "${title.substring(0, 35)}....",
                            link,
                            time);
                        Fluttertoast.showToast(msg: "북마크 목록에 추가되었습니다.");
                      }
                      if(loggedUser == null){
                        Fluttertoast.showToast(msg: "북마크 기능을 이용하려면 로그인을 해주시기 바랍니다.");
                      }
                    } catch (e) {
                      Fluttertoast.showToast(msg: "북마크 목록 추가에 실패하였습니다.");
                      print(e);
                    }
                  },
                  child: const Icon(
                    Icons.bookmark,
                    color: Colors.white,
                  ),
                )
              ],
            )
          ],
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xfd555081), Color(0xFD476DEE)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
  // 3.Bookmark Notice
  Widget Container_info_bookmark(String link, String title, String time) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
        padding: EdgeInsets.fromLTRB(15, 10, 10, 15),
        height: 95,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 280,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title.length < 35 ? title : "${title.substring(0, 35)}....",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    "20$time",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          launchUrl(Uri.parse(link),
                              mode: LaunchMode.externalApplication);
                        },
                        child: const Icon(
                          Icons.arrow_forward,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (this.mounted) {
                      setState(() {
                        try {
                          BookmarkService().removeBookmark(
                            loggedUser?.email,
                            title.length < 35
                                ? title
                                : "${title.substring(0, 35)}....",
                          );
                          Fluttertoast.showToast(msg: "북마크 목록에서 삭제되었습니다.");
                          get_bookmark_data(loggedUser!.email);
                        } catch (e) {
                          print(e);
                        }
                      });
                    }
                  },
                  child: const Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                )
              ],
            )
          ],
        ),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xfd555081), Color(0xFD476DEE)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "MY CNUE",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () async {
              if (selectingnum1 == 3) {
                extractData2(0);
              } else if (selectingnum1 == 4) {
                isLoading = true;
                if(loggedUser != null){
                  get_bookmark_data(loggedUser!.email);
                }
                isLoading = false;
              } else {
                extractData1(selectingnum1 + 2, 0);
              }
              NotificationService().showNotification(3);
            },
            icon: const Icon(Icons.refresh),
            color: Colors.black,
          ),
        ],
      ),
      body: ListView(
        children: [
          // 공지 구분 바
          Container(
            child: Scrollbar(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 30,
                    ),

                  // selecting_num1 = 4;
                  GestureDetector(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Text("북마크",
                                  style: selectingnum1 == 4
                                      ? TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline)
                                      : TextStyle(
                                    fontSize: 20,
                                  ),
                              ),
                              Icon(Icons.bookmark)
                            ],
                          )
                        ],
                      ),
                    ),
                    onTap: () async {
                      isLoading = true;
                      if (loggedUser != null){
                        get_bookmark_data(loggedUser!.email);
                      }
                      isLoading = false;
                      setState(() {
                        selectingnum1 = 4;
                      });
                    },
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  // selecting_num1 = 5;
                  GestureDetector(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Text("북마크",
                                  style: selectingnum1 == 4
                                      ? TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline)
                                      : TextStyle(
                                    fontSize: 20,
                                  )
                              ),
                              Icon(Icons.bookmark)
                            ],
                          )
                        ],
                      ),
                    ),
                    onTap: () async {
                      setState(() {
                        isLoading = true;
                        setState(() {
                          selectingnum1 = 5;
                        });
                        isLoading = false;
                      });
                    },
                  ),
                  //selecting_num1 = 0
                  GestureDetector(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("학사공지",
                              style: selectingnum1 == 0
                                  ? TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline)
                                  : TextStyle(
                                fontSize: 20,
                              )),
                        ],
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        selectingnum1 = 0;
                        ann_lim = 0;
                        extractData1(selectingnum1 + 2, ann_lim);
                        is_selected_ann = false;
                        is_selected_ann_index = 1;
                      });
                    },
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  //selecting_num1 = 1
                  GestureDetector(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("학생공지",
                              style: selectingnum1 == 1
                                  ? TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline)
                                  : TextStyle(
                                fontSize: 20,
                              )),
                        ],
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        selectingnum1 = 1;
                        ann_lim = 0;
                        extractData1(selectingnum1 + 2, 0);
                        is_selected_ann = false;
                        is_selected_ann_index = 1;
                      });
                    },
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  //selecting_num1 = 2
                  GestureDetector(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("대학공지",
                              style: selectingnum1 == 2
                                  ? TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline)
                                  : TextStyle(
                                fontSize: 20,
                              )),
                        ],
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        selectingnum1 = 2;
                        ann_lim = 0;
                        extractData1(selectingnum1 + 2, ann_lim);
                        is_selected_ann = false;
                        is_selected_ann_index = 1;
                      });
                    },
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  //selecting_num1 = 3
                  GestureDetector(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("생활관",
                              style: selectingnum1 == 3
                                  ? TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline)
                                  : TextStyle(
                                fontSize: 20,
                              )),
                        ],
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        selectingnum1 = 3;
                        extractData2(0);
                      });
                    },
                  ),
                  SizedBox(
                    width: 30,
                  ),
                ],
              ),
            ),
            ),
            color: Colors.grey[300],
            height: 50,
          ),
          SizedBox(
            height: 20,
          ),

          // 공지 Container Column
          TimerBuilder.periodic(Duration(seconds: 1), builder: (context) {
            if (isLoading == false) {
              // 학사 공지
              if (selectingnum1 == 0) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "학사공지",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "- 연간 학사 일정 관련 공지",
                            ),
                            Text(
                              "- 참관/수업/종합 실습 관련 공지",
                            ),
                            Text(
                              "- 수강 신청/변경/취소 관련 공지",
                            ),
                            Text(
                              "- 전과/재입학 관련 공지",
                            ),
                            Text(
                              "- 성적 및 강의평가 관련 공지 ",
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        if (top_box_num != 0)
                          Text(
                            "중요공지",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    if (top_box_num > 3)
                      Column(
                        children: [
                          for (int i = 0; i < 3; i++)
                            Column(
                              children: [
                                Container_info_const(
                                    responseString1_link_const[i],
                                    responseString1_title_const[i],
                                    responseString1_time_const[i]),

                              ],
                            ),
                          if (is_selected_ann == true)
                            for (int i = 3; i < top_box_num; i++)
                              Container_info_const(
                                  responseString1_link_const[i],
                                  responseString1_title_const[i],
                                  responseString1_time_const[i]),
                        ],
                      ),
                    if (top_box_num <= 3)
                      for (int i = 0; i < top_box_num; i++)
                        Container_info_const(
                            responseString1_link_const[i],
                            responseString1_title_const[i],
                            responseString1_time_const[i]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (top_box_num > 3)
                          TextButton(
                            onPressed: () {
                              setState(() {
                                if (is_selected_ann == true) {
                                  is_selected_ann = false;
                                } else {
                                  is_selected_ann = true;
                                }
                              });
                            },
                            child: is_selected_ann
                                ? Text(
                                    "줄이기",
                                    style: TextStyle(fontSize: 15),
                                  )
                                : Text(
                                    "더보기",
                                    style: TextStyle(fontSize: 15),
                                  ),
                          ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "일반공지",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    for (int i = 0; i < 10; i++)
                      Container_info(responseString1_link[i],
                          responseString1_title[i], responseString1_time[i]),
                    SizedBox(
                      height: 10,
                    ),
                    // 하단 인덱스
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: Container(
                            width: 30,
                            height: 30,
                            child: Center(
                              child: Text(
                                "1",
                                style: TextStyle(
                                    color: is_selected_ann_index == 1
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                                color: is_selected_ann_index == 1
                                    ? Colors.blue
                                    : Colors.white),
                          ),
                          onTap: () {
                            setState(() {
                              is_selected_ann_index = 1;
                              is_selected_ann = false;
                              ann_lim = 0;
                              extractData1(selectingnum1 + 2, ann_lim);
                            });
                          },
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          child: Container(
                            width: 30,
                            height: 30,
                            child: Center(
                              child: Text(
                                "2",
                                style: TextStyle(
                                    color: is_selected_ann_index == 2
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                                color: is_selected_ann_index == 2
                                    ? Colors.blue
                                    : Colors.white),
                          ),
                          onTap: () {
                            setState(() {
                              is_selected_ann_index = 2;
                              is_selected_ann = false;
                              ann_lim = 10;
                              extractData1(selectingnum1 + 2, ann_lim);
                            });
                          },
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          child: Container(
                            width: 30,
                            height: 30,
                            child: Center(
                              child: Text(
                                "3",
                                style: TextStyle(
                                    color: is_selected_ann_index == 3
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                                color: is_selected_ann_index == 3
                                    ? Colors.blue
                                    : Colors.white),
                          ),
                          onTap: () {
                            setState(() {
                              is_selected_ann_index = 3;
                              is_selected_ann = false;
                              ann_lim = 20;
                              extractData1(selectingnum1 + 2, ann_lim);
                            });
                          },
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          child: Container(
                            width: 30,
                            height: 30,
                            child: Center(
                              child: Text(
                                "4",
                                style: TextStyle(
                                    color: is_selected_ann_index == 4
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                                color: is_selected_ann_index == 4
                                    ? Colors.blue
                                    : Colors.white),
                          ),
                          onTap: () {
                            setState(() {
                              is_selected_ann_index = 4;
                              is_selected_ann = false;
                              ann_lim = 30;
                              extractData1(selectingnum1 + 2, ann_lim);
                            });
                          },
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          child: Container(
                            width: 30,
                            height: 30,
                            child: Center(
                              child: Text(
                                "5",
                                style: TextStyle(
                                    color: is_selected_ann_index == 5
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                                color: is_selected_ann_index == 5
                                    ? Colors.blue
                                    : Colors.white),
                          ),
                          onTap: () {
                            setState(() {
                              is_selected_ann_index = 5;
                              is_selected_ann = false;
                              ann_lim = 40;
                              extractData1(selectingnum1 + 2, ann_lim);
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                );
              }
              // 학생 공지
              else if (selectingnum1 == 1) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "학생공지",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "- 각종 공모전 및 대외활동 공지",
                              style: TextStyle(),
                            ),
                            Text(
                              "- 교내외 장학금 관련 공지",
                              style: TextStyle(),
                            ),
                            Text(
                              "- 교내 시설(강의동 및 체력단련실) 사용 안내",
                              style: TextStyle(),
                            ),
                            Text(
                              "- 예비군 일정 안내",
                              style: TextStyle(),
                            ),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        if (top_box_num != 0)
                          Text(
                            "중요공지",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    if (top_box_num > 3)
                      Column(
                        children: [
                          for (int i = 0; i < 3; i++)
                            Container_info_const(
                                responseString1_link_const[i],
                                responseString1_title_const[i],
                                responseString1_time_const[i]),
                          if (is_selected_ann == true)
                            for (int i = 3; i < top_box_num; i++)
                              Container_info_const(
                                  responseString1_link_const[i],
                                  responseString1_title_const[i],
                                  responseString1_time_const[i]),
                        ],
                      ),
                    if (top_box_num <= 3)
                      for (int i = 0; i < top_box_num; i++)
                        Container_info_const(
                            responseString1_link_const[i],
                            responseString1_title_const[i],
                            responseString1_time_const[i]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if(top_box_num > 3)
                          TextButton(
                          onPressed: () {
                            setState(() {
                              if (is_selected_ann == true) {
                                is_selected_ann = false;
                              } else {
                                is_selected_ann = true;
                              }
                            });
                          },
                          child: is_selected_ann
                              ? Text(
                                  "줄이기",
                                  style: TextStyle(fontSize: 15),
                                )
                              : Text(
                                  "더보기",
                                  style: TextStyle(fontSize: 15),
                                ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "일반공지",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    for (int i = 0; i < 10; i++)
                      Container_info(responseString1_link[i],
                          responseString1_title[i], responseString1_time[i]),
                    SizedBox(
                      height: 10,
                    ),
                    // 하단 인덱스
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: Container(
                            width: 30,
                            height: 30,
                            child: Center(
                              child: Text(
                                "1",
                                style: TextStyle(
                                    color: is_selected_ann_index == 1
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                                color: is_selected_ann_index == 1
                                    ? Colors.blue
                                    : Colors.white),
                          ),
                          onTap: () {
                            setState(() {
                              is_selected_ann_index = 1;
                              is_selected_ann = false;
                              ann_lim = 0;
                              extractData1(selectingnum1 + 2, ann_lim);
                            });
                          },
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          child: Container(
                            width: 30,
                            height: 30,
                            child: Center(
                              child: Text(
                                "2",
                                style: TextStyle(
                                    color: is_selected_ann_index == 2
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                                color: is_selected_ann_index == 2
                                    ? Colors.blue
                                    : Colors.white),
                          ),
                          onTap: () {
                            setState(() {
                              is_selected_ann_index = 2;
                              is_selected_ann = false;
                              ann_lim = 10;
                              extractData1(selectingnum1 + 2, ann_lim);
                            });
                          },
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          child: Container(
                            width: 30,
                            height: 30,
                            child: Center(
                              child: Text(
                                "3",
                                style: TextStyle(
                                    color: is_selected_ann_index == 3
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                                color: is_selected_ann_index == 3
                                    ? Colors.blue
                                    : Colors.white),
                          ),
                          onTap: () {
                            setState(() {
                              is_selected_ann_index = 3;
                              is_selected_ann = false;
                              ann_lim = 20;
                              extractData1(selectingnum1 + 2, ann_lim);
                            });
                          },
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          child: Container(
                            width: 30,
                            height: 30,
                            child: Center(
                              child: Text(
                                "4",
                                style: TextStyle(
                                    color: is_selected_ann_index == 4
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                                color: is_selected_ann_index == 4
                                    ? Colors.blue
                                    : Colors.white),
                          ),
                          onTap: () {
                            setState(() {
                              is_selected_ann_index = 4;
                              is_selected_ann = false;
                              ann_lim = 30;
                              extractData1(selectingnum1 + 2, ann_lim);
                            });
                          },
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          child: Container(
                            width: 30,
                            height: 30,
                            child: Center(
                              child: Text(
                                "5",
                                style: TextStyle(
                                    color: is_selected_ann_index == 5
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                                color: is_selected_ann_index == 5
                                    ? Colors.blue
                                    : Colors.white),
                          ),
                          onTap: () {
                            setState(() {
                              is_selected_ann_index = 5;
                              is_selected_ann = false;
                              ann_lim = 40;
                              extractData1(selectingnum1 + 2, ann_lim);
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                );
              }
              // 대학 공지
              else if (selectingnum1 == 2) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "대학공지",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "- 교내 공사 관련 공지",
                              style: TextStyle(),
                            ),
                            Text(
                              "- 등록금 납부 관련 공지",
                              style: TextStyle(),
                            ),
                            Text(
                              "- 입학식 및 학위수여식 공지",
                              style: TextStyle(),
                            ),
                            Text(
                              "- 교내 냉난방 시설 관련 공지",
                              style: TextStyle(),
                            ),
                            Text(
                              "- 각종 의견 공청회 및 학칙 관련 공지",
                              style: TextStyle(),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        if (top_box_num != 0)
                          Text(
                            "중요공지",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    if (top_box_num > 3)
                      Column(
                        children: [
                          for (int i = 0; i < 3; i++)
                            Container_info_const(
                                responseString1_link_const[i],
                                responseString1_title_const[i],
                                responseString1_time_const[i]),
                          if (is_selected_ann == true)
                            for (int i = 3; i < top_box_num; i++)
                              Container_info_const(
                                  responseString1_link_const[i],
                                  responseString1_title_const[i],
                                  responseString1_time_const[i]),
                        ],
                      ),
                    if (top_box_num <= 3)
                      for (int i = 0; i < top_box_num; i++)
                        Container_info_const(
                            responseString1_link_const[i],
                            responseString1_title_const[i],
                            responseString1_time_const[i]),

                    if(top_box_num > 3)
                      Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              if (is_selected_ann == true) {
                                is_selected_ann = false;
                              } else {
                                is_selected_ann = true;
                              }
                            });
                          },
                          child: is_selected_ann
                              ? Text(
                            "줄이기",
                            style: TextStyle(fontSize: 15),
                          )
                              : Text(
                            "더보기",
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "일반공지",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    for (int i = 0; i < 10; i++)
                      Container_info(
                          responseString1_link[i],
                          responseString1_title[i],
                          responseString1_time[i]),
                    SizedBox(
                      height: 10,
                    ),
                    // 하단 인덱스
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: Container(
                            width: 30,
                            height: 30,
                            child: Center(
                              child: Text(
                                "1",
                                style: TextStyle(
                                    color: is_selected_ann_index == 1
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                                color: is_selected_ann_index == 1
                                    ? Colors.blue
                                    : Colors.white),
                          ),
                          onTap: () {
                            setState(() {
                              is_selected_ann_index = 1;
                              is_selected_ann = false;
                              ann_lim = 0;
                              extractData1(selectingnum1 + 2, ann_lim);
                            });
                          },
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          child: Container(
                            width: 30,
                            height: 30,
                            child: Center(
                              child: Text(
                                "2",
                                style: TextStyle(
                                    color: is_selected_ann_index == 2
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                                color: is_selected_ann_index == 2
                                    ? Colors.blue
                                    : Colors.white),
                          ),
                          onTap: () {
                            setState(() {
                              is_selected_ann_index = 2;
                              is_selected_ann = false;
                              ann_lim = 10;
                              extractData1(selectingnum1 + 2, ann_lim);
                            });
                          },
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          child: Container(
                            width: 30,
                            height: 30,
                            child: Center(
                              child: Text(
                                "3",
                                style: TextStyle(
                                    color: is_selected_ann_index == 3
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                                color: is_selected_ann_index == 3
                                    ? Colors.blue
                                    : Colors.white),
                          ),
                          onTap: () {
                            setState(() {
                              is_selected_ann_index = 3;
                              is_selected_ann = false;
                              ann_lim = 20;
                              extractData1(selectingnum1 + 2, ann_lim);
                            });
                          },
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          child: Container(
                            width: 30,
                            height: 30,
                            child: Center(
                              child: Text(
                                "4",
                                style: TextStyle(
                                    color: is_selected_ann_index == 4
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                                color: is_selected_ann_index == 4
                                    ? Colors.blue
                                    : Colors.white),
                          ),
                          onTap: () {
                            setState(() {
                              is_selected_ann_index = 4;
                              is_selected_ann = false;
                              ann_lim = 30;
                              extractData1(selectingnum1 + 2, ann_lim);
                            });
                          },
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          child: Container(
                            width: 30,
                            height: 30,
                            child: Center(
                              child: Text(
                                "5",
                                style: TextStyle(
                                    color: is_selected_ann_index == 5
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                                color: is_selected_ann_index == 5
                                    ? Colors.blue
                                    : Colors.white),
                          ),
                          onTap: () {
                            setState(() {
                              is_selected_ann_index = 5;
                              is_selected_ann = false;
                              ann_lim = 40;
                              extractData1(selectingnum1 + 2, ann_lim);
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                );
              }
              // 생활관
              else if (selectingnum1 == 3) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "생활관 공지",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        if (top_box_num != 0)
                          Text(
                            "중요공지",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    if (top_box_num > 3)
                      Column(
                        children: [
                          for (int i = 0; i < 3; i++)
                            Container_info_const(
                                responseString1_link_const[i],
                                responseString1_title_const[i],
                                responseString1_time_const[i]),
                          if (is_selected_ann == true)
                            for (int i = 3; i < top_box_num; i++)
                              Container_info_const(
                                  responseString1_link_const[i],
                                  responseString1_title_const[i],
                                  responseString1_time_const[i]),
                        ],
                      ),
                    if (top_box_num <= 3)
                      for (int i = 0; i < top_box_num; i++)
                        Container_info_const(
                            responseString1_link_const[i],
                            responseString1_title_const[i],
                            responseString1_time_const[i]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (top_box_num > 3)
                         TextButton(
                          onPressed: () {
                            setState(() {
                              if (is_selected_ann == true) {
                                is_selected_ann = false;
                              } else {
                                is_selected_ann = true;
                              }
                            });
                          },
                          child: is_selected_ann
                              ? Text(
                                  "줄이기",
                                  style: TextStyle(fontSize: 15),
                                )
                              : Text(
                                  "더보기",
                                  style: TextStyle(fontSize: 15),
                                ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "일반공지",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    for (int i = 0; i < 10; i++)
                      Container_info(responseString1_link[i],
                          responseString1_title[i], responseString1_time[i]),
                    SizedBox(
                      height: 10,
                    ),
                    // 하단 인덱스
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: Container(
                            width: 30,
                            height: 30,
                            child: Center(
                              child: Text(
                                "1",
                                style: TextStyle(
                                    color: is_selected_ann_index == 1
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                                color: is_selected_ann_index == 1
                                    ? Colors.blue
                                    : Colors.white),
                          ),
                          onTap: () {
                            setState(() {
                              is_selected_ann_index = 1;
                              is_selected_ann = false;
                              ann_lim = 0;
                              extractData2(ann_lim);
                            });
                          },
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          child: Container(
                            width: 30,
                            height: 30,
                            child: Center(
                              child: Text(
                                "2",
                                style: TextStyle(
                                    color: is_selected_ann_index == 2
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                                color: is_selected_ann_index == 2
                                    ? Colors.blue
                                    : Colors.white),
                          ),
                          onTap: () {
                            setState(() {
                              is_selected_ann_index = 2;
                              is_selected_ann = false;
                              ann_lim = 10;
                              extractData2(ann_lim);
                            });
                          },
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          child: Container(
                            width: 30,
                            height: 30,
                            child: Center(
                              child: Text(
                                "3",
                                style: TextStyle(
                                    color: is_selected_ann_index == 3
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                                color: is_selected_ann_index == 3
                                    ? Colors.blue
                                    : Colors.white),
                          ),
                          onTap: () {
                            setState(() {
                              is_selected_ann_index = 3;
                              is_selected_ann = false;
                              ann_lim = 20;
                              extractData2(ann_lim);
                            });
                          },
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          child: Container(
                            width: 30,
                            height: 30,
                            child: Center(
                              child: Text(
                                "4",
                                style: TextStyle(
                                    color: is_selected_ann_index == 4
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                                color: is_selected_ann_index == 4
                                    ? Colors.blue
                                    : Colors.white),
                          ),
                          onTap: () {
                            setState(() {
                              is_selected_ann_index = 4;
                              is_selected_ann = false;
                              ann_lim = 30;
                              extractData2(ann_lim);
                            });
                          },
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        GestureDetector(
                          child: Container(
                            width: 30,
                            height: 30,
                            child: Center(
                              child: Text(
                                "5",
                                style: TextStyle(
                                    color: is_selected_ann_index == 5
                                        ? Colors.white
                                        : Colors.black),
                              ),
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                                color: is_selected_ann_index == 5
                                    ? Colors.blue
                                    : Colors.white),
                          ),
                          onTap: () {
                            setState(() {
                              is_selected_ann_index = 5;
                              is_selected_ann = false;
                              ann_lim = 40;
                              extractData2(ann_lim);
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                );
              }
              // 북마크
              else {
                return loggedUser != null && this.mounted
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "북마크 목록",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              const Icon(
                                Icons.bookmark,
                                size: 30,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "# 자주 보는 공지사항을 추가하고 빠르게 찾아보세요! #",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          if (Num > 0)
                            for (int i = 0; i < Num; i++)
                              Container_info_bookmark(
                                  responseString1_link[i],
                                  responseString1_title[i],
                                  responseString1_time[i]
                              ),
                          if (Num == 0)
                            Column(
                              children: [
                                SizedBox(
                                  height: 100,
                                ),
                                Center(
                                  child: Text(
                                    "추가된 공지사항이 없습니다.",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      )
                    : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "북마크 목록",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        const Icon(
                          Icons.bookmark,
                          size: 30,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "# 자주 보는 공지사항을 추가하고 빠르게 찾아보세요! #",
                          style: TextStyle(
                              color: Colors.black, fontSize: 14),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Center(
                        child:Text("로그인 후에 이용가능합니다.",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),),
                      ),
                      height: 200,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                );
              }
            } else {
              return Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  CircularProgressIndicator(),
                ],
              );
            }
          }),
        ],
      ),
    );
  }
}
