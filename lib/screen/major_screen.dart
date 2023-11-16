// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:my_cnue/screen/major_calling_info.dart';
import 'package:my_cnue/screen/my_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MajorScreen extends StatefulWidget {
  const MajorScreen({Key? key}) : super(key: key);

  @override
  State<MajorScreen> createState() => _MajorScreenState();
}

class _MajorScreenState extends State<MajorScreen> {
  static const List<String> telnum = [
    "tel:0332606400", // 윤리 0
    "tel:0332606410", // 국어 1
    "tel:0332606420", // 사회 2
    "tel:0332606430", // 교육 3
    "tel:0332606450", // 수학 4
    "tel:0332606460", // 과학 5
    "tel:0332606470", // 실과 6
    "tel:0332606480", // 음악 7
    "tel:0332606490", // 미술 8
    "tel:0332606500", // 체육 9
    "tel:0332606520", // 영어 10
    "tel:0332606530", // 컴퓨터 11
  ];
  static const List<String> telnum_vis = [
    "033-260-6400", // 윤리 0
    "033-260-6410", // 국어 1
    "033-260-6420", // 사회 2
    "033-260-6430", // 교육 3
    "033-260-6450", // 수학 4
    "033-26-06460", // 과학 5
    "033-260-6470", // 실과 6
    "033-260-6480", // 음악 7
    "033-260-6490", // 미술 8
    "033-260-6500", // 체육 9
    "033-260-6520", // 영어 10
    "033-260-6530", // 컴퓨터 11
  ];
  static const List<String> faxnum = [
    "033-260-3023", // 윤리 0
    "033-260-3024", // 국어 1
    "033-260-3025", // 사회 2
    "033-260-3025", // 교육 3
    "033-260-3027", // 수학 4
    "033-260-3028", // 과학 5
    "033-260-3029", // 실과 6
    "033-260-3030", // 음악 7
    "033-260-3031", // 미술 8
    "033-260-3032", // 체육 9
    "033-260-3036", // 영어 10
    "033-260-3037", // 컴퓨터 11
  ];

  static const List<String> majornum = [
    "윤리교육과",
    "국어교육과",
    "사회과교육과",
    "교육학과",
    "수학교육과",
    "과학교육과",
    "실과교육과",
    "음악교육과",
    "미술교육과",
    "체육교육과",
    "영어교육과",
    "컴퓨터교육과",
    "원어민 / 강사"
  ];
  List<String> prof_info_url = [
    "https://www.cnue.ac.kr/ethics/prof/prof-dev.do", // 윤리
    "https://www.cnue.ac.kr/korean/prof/prof-dev.do", // 국어
    "https://www.cnue.ac.kr/social/prof/prof-dev.do", // 사회
    "https://www.cnue.ac.kr/education/prof/prof-dev.do", // 교육
    "https://www.cnue.ac.kr/mathmatics/prof/prof-dev.do", // 수학
    "https://www.cnue.ac.kr/science/prof/prof-dev.do", // 과학
    "https://www.cnue.ac.kr/practical/prof/prof-dev.do", // 실과
    "https://www.cnue.ac.kr/music/prof/prof-dev.do", // 음악
    "https://www.cnue.ac.kr/art/prof/prof-dev.do", // 미술
    "https://www.cnue.ac.kr/physical/prof/prof-dev.do", // 체육
    "https://www.cnue.ac.kr/english/prof/prof-dev.do", // 영어
    "https://www.cnue.ac.kr/computer/prof/prof-dev.do", // 컴퓨터
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'MY CNUE',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '학내 연락처',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '누락된 기관이나, 잘못된 내용이 있을 경우, '
                    '학교홈페이지 조직도 또는 학교 대표 전화번호를 이용해주시기 바랍니다.',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  // 학교 대표 전화번호
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: Container(
                              padding: EdgeInsets.all(10),
                              height: 50,
                              width: 250,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("학교 대표 전화번호",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.blue[400],
                                          fontWeight: FontWeight.bold)),
                                  IconButton(
                                      onPressed: () {
                                        launchUrl(Uri.parse(
                                            "tel:0332606000"));
                                      },
                                      icon: Icon(Icons.call,
                                          size: 20, color: Colors.blueAccent)),
                                ],
                              )),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.blue[400],
                  borderRadius: BorderRadius.circular(20)),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  // 교육기구
                  Row(
                    children: [
                      Text(
                        "교육 기구 - ",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        "학과별 사무실 및 교수진",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                    ],
                  ),

                  // 학과
                  for (int i = 0; i < 6; i++)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MajorInfoScreen(
                                      link: prof_info_url[i],
                                      majorname: majornum[i],
                                      major_num: i)),
                            );
                          },
                          child: Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                              padding: EdgeInsets.all(10),
                              width:
                                  (MediaQuery.of(context).size.width - 100) / 2,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey[200],
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(majornum[i],
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Color(0xFF195E9F),
                                          fontWeight: FontWeight.bold)),
                                ],
                              )),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MajorInfoScreen(
                                      link: prof_info_url[i + 6],
                                      majorname: majornum[i + 6],
                                      major_num: i + 6)),
                            );
                          },
                          child: Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                              padding: EdgeInsets.all(10),
                              width:
                                  (MediaQuery.of(context).size.width - 100) / 2,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey[200],
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(majornum[i + 6],
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Color(0xFF195E9F),
                                          fontWeight: FontWeight.bold)),
                                ],
                              )),
                        ),
                      ],
                    ),

                  // 기타(명예교수 / 원어민 / 강사)
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MajorInfoScreen(
                                  majorname: majornum[12],
                                  link: "",
                                  major_num: 12,
                                )),
                      );
                    },
                    child: Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[200],
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("원어민 / 강사",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xFF195E9F),
                                    fontWeight: FontWeight.bold)),
                          ],
                        )),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                  color: Color(0xFF195E9F),
                  borderRadius: BorderRadius.circular(20)),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 1,
              color: Colors.black,
            ),
            SizedBox(
              height: 10,
            ),
            // 교육기구
            Row(
              children: [
                Text(
                  "<총장 및 비서실>",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // 총장
                GestureDetector(
                  child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      width: (MediaQuery.of(context).size.width - 100) / 2,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[200],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("총장",
                              style: TextStyle(
                                  fontSize: 15,)
                          ),
                          IconButton(
                              onPressed: () {
                                launchUrl(Uri.parse(
                                    "tel:0332606100"));
                              },
                              icon: Icon(Icons.call,
                                  size: 20,color: Colors.blue,)),
                        ],
                      )),
                ),
                // 비서실
                GestureDetector(
                  child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      width: (MediaQuery.of(context).size.width - 100) / 2,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[200],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("비서실",
                              style: TextStyle(
                                fontSize: 15,)
                          ),
                          IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(10.0)),
                                        title: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Text("담당자 연락처"),
                                              ],
                                            )
                                          ],
                                        ),
                                        content: SingleChildScrollView(
                                          scrollDirection: Axis.vertical,
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "업무 담당자에게 연락할 경우, 빠른 문의가 가능합니다.",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.red),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  Text("남현수"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606103"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  Text("안선희"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606102"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text("닫기"),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      );
                                    });
                              },
                              icon: Icon(Icons.arrow_forward,
                                  size: 20,color: Colors.blue,)),
                        ],
                      )),
                ),
              ],
            ),

            // 대학본부
            Row(
              children: [
                Text(
                  "<대학 본부>",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  " - 학생처, 교무처, 총무처 ",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // 학생처
                GestureDetector(
                  child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      width: (MediaQuery.of(context).size.width - 100) / 2,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[200],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("학생처"),
                          IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        title: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("담당자 연락처"),
                                                IconButton(
                                                    onPressed: () {
                                                      launchUrl(
                                                          Uri.parse(
                                                              "https://www.cnue.ac.kr/"
                                                              "cnue/intro/organization/organization05.do"),
                                                          mode: LaunchMode
                                                              .externalApplication);
                                                    },
                                                    icon: Icon(
                                                      Icons.link,
                                                    )),
                                              ],
                                            )
                                          ],
                                        ),
                                        content: SingleChildScrollView(
                                          scrollDirection: Axis.vertical,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "위치 : 학생지원센터 1층",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                ),
                                              ),
                                              Text(
                                                "업무 담당자에게 연락할 경우, 빠른 문의가 가능합니다.",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.red),
                                              ),

                                              // 박헌우
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("박헌우(학생처장)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606130"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 학생처 업무 총괄",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 이헌식
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("이헌식(학생팀장)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606131"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 학생처 업무 전반",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 학생 행사 지도·지원 업무 총괄",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 상담실, 장애학생지원센터, 인권센터 업무 전반",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 박하원
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("박하원(주무관)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606134"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 장학 업무(국가근로, 교내·외)",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 학자금 대출 업무",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 학생 멘토링 업무",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "- 교사대생 튜터링",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "- 다문화·탈북학생",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "- 재능봉사 캠프",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 이상훈
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("이상훈(주무관)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606133"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 학생활동 지원(학과, 동아리, 자치기구)",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "- 학과 학생활동 지원",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "- 총학생회, 동아리 운영 지원 및 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "- 자치기구(새싹, 미립, 교지편집) 운영 지원 및 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 학생 행사 및 제증명 업무 지원 (담당자 부재시)",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              // 나수연
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("나수연(주무관)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606135"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 상담실 운영(상담 및 심리검사 업무 등)",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 신문방송사 간사",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 학생후생복지(정수기, 학교경영자 배상 책임보험, 건강검진 등)",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 학생 행사 및 제증명 업무 지원",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 조민영
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("조민영(주무관)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606132"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 학적관리(휴·복학,자퇴,제적 등)",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 학생 병사 업무",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 과 기록물 및 운영비 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 임용·취업 관련 업무(특강 등)",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 제증명 업무(학생증 발급 포함)",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text("닫기"),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      );
                                    });
                              },
                              icon: Icon(Icons.arrow_forward,
                                  size: 20, color: Colors.blueAccent)),
                        ],
                      )),
                ),
                // 교무처
                GestureDetector(
                  onTap: () {},
                  child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      width: (MediaQuery.of(context).size.width - 100) / 2,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[200],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("교무처"),
                          IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        title: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("담당자 연락처"),
                                                IconButton(
                                                    onPressed: () {
                                                      launchUrl(
                                                          Uri.parse(
                                                              "https://www.cnue.ac.kr/"
                                                              "cnue/intro/organization/organization04.do"),
                                                          mode: LaunchMode
                                                              .externalApplication);
                                                    },
                                                    icon: Icon(
                                                      Icons.link,
                                                    )),
                                              ],
                                            )
                                          ],
                                        ),
                                        content: SingleChildScrollView(
                                          scrollDirection: Axis.vertical,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "위치 : 석우관 215호",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                ),
                                              ),
                                              Text(
                                                "업무 담당자에게 연락할 경우, 빠른 문의가 가능합니다.",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.red),
                                              ),

                                              // 곽현규
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("곽현규(교무처장)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606120"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 교무처 업무 총괄",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 박상봉
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("박상봉(교무·수업팀장)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606121"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 교무·수업 업무 총괄",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 교원·학생 정원관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 전임교원, 부설초 교원 및 조교 인사",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● SWEET사업단 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 김경미
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("김경미(주무관)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606124"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 교육·연구 및 학생지도비(교육/총괄)",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 총장 선출 업무",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 전임교원 및 연구교수 선발 및 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 교수회 운영",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 교원 연수 및 신임교수 오리엔테이션",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 이혜린
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("이혜린(주무관)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606125"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 교육실습(종합, 수업, 참관)운영 업무",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 강의평가 업무",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 졸업사정, 졸업증서 및 교원자격증 발급 업무",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 재입학 업무",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 학사일정 수립",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 심폐소생술 교육 및 적·인성 검사 업무",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 남성현
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("남성현(주무관)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606164"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 강의시간표 작성",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 수강신청 및 강의계획서 업무",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 시험 및 성적(교환학생 포함)관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 졸업논문 관련 업무",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 휴·보강에 관한 업무",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 교육과정 편성 및 봉사실습 관련 업무",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 작은학교 현장체험 운영",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 강의동 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 강사 채용 및 관리, 강사료 지급 업무",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 방선영
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("방선영(주무관)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606126"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 교수활동 지원(출장, 출강 등)",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 수업관련 교수활동 지원",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "- 현장학습",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "- 졸업논문지도, 발표 등",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "- 교과관련 교외 교육활동 및 현장연계 대외 행사",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 휴게실 및 강사휴게실 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 조유나
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("조유나(주무관)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606122"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 초등교육연구원 업무",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 행사 업무(입학식, 졸업식 등)",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text("닫기"),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      );
                                    });
                              },
                              icon: Icon(Icons.arrow_forward,
                                  size: 20, color: Colors.blueAccent)),
                        ],
                      )),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // 총무처(총무팀)
                GestureDetector(
                  child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      width: (MediaQuery.of(context).size.width - 80) / 2,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[200],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("총무처(총무팀)"),
                          IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        title: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("담당자 연락처"),
                                                IconButton(
                                                    onPressed: () {
                                                      launchUrl(
                                                          Uri.parse(
                                                              "https://www.cnue.ac.kr/"
                                                              "cnue/intro/organization/organization06.do"),
                                                          mode: LaunchMode
                                                              .externalApplication);
                                                    },
                                                    icon: Icon(
                                                      Icons.link,
                                                    )),
                                              ],
                                            )
                                          ],
                                        ),
                                        //
                                        content: SingleChildScrollView(
                                          scrollDirection: Axis.vertical,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "위치 : 석우관 402호",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                ),
                                              ),
                                              Text(
                                                "업무 담당자에게 연락할 경우, 빠른 문의가 가능합니다.",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.red),
                                              ),

                                              // 전두인
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("전두인(총무처장)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606200"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 총무처 업무총괄",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 전준하
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("전준하(총무팀장)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606210"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 총무팀 업무총괄",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 관인관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 소관 규정 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 각종 기획 및 행사 업무",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 이재원
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("이재원(기록연구사)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606216"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 기록관 운영 및 기록물 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 박물관 관리 및 운영",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 정보공개 및 개인정보보호",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 공공데이터 및 공공 마이데이터 업무",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● KORUS 업무관리시스템 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 강 한
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("강 한(행정8급)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606211"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 신원 조회 및 신원 특이자 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● PASS 시스템(e-사람) 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 사정 및 감사 업무 지원",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 회계직 공무원 임명 및 재정보증",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● PASS 시스템(e-사람) 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 공무원 직장협의회 및 공무원노조 관련 업무",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 정태환
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("정태환(공업8급)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606217"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 각종 민원·청원 업무(민원사무처리부)",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 직원 교육훈련 업무(사이버 교육 포함)",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 공직자 재산등록 및 병역 신고 의무",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 맞춤형(선택적) 복지제도 운영",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 총무팀 소관 물품 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 총무팀 기록물 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 대학평의원회 업무(간사)",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 오경석
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("오경석(촉탁직 : 예비군중대)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606215"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 청사 및 시설물 관리 총괄",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 시설물 대여( 내/외부) 및 관련 행사 음향 등 지원",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 용역(경비) 및 조경관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 학내출입차량 등록 및 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 재해재난 및 산업재해 업무",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 소방 업무",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 예비군중대 업무",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 서미연
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("서미연(대학회계8급)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606212"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 보건실 운영 및 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 공무원증, 신분증 밝급 및 제증명 발급 업무",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 우편물 분류 및 배부(우표 수불 포함)",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 초과근무 및 당직관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 교직원공제회 및 퇴직금, 4대 보험, 공무원연금 업무",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 공무원증, 신분증 발급 및 제증명 발급 업무",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 안선희
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("안선희(대학회계8급)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606102"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 총장 일정 및 업무추진비 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 내.외빈 안내",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 소회의실 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 교직원 전화번호부 및 일람표, 비상연락망 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 부속실 운영(총장실 운영 물품 구입 및 관리)",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 총장 업무추진비 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 총장 협의회 회의 운영 및 지원",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 이만수
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("이만수(운전7급)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606543"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 대형버스 운행 및 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 화물차(1톤트럭) 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 공용차량 운행지원",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 김무성
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("김무성(운전 8급)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606274"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 발간실 운영(인쇄의뢰서 접수 관리 포함)",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 중형버스 운행 및 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 공용차량 배차 및 운행 지원",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 공동 시설물 음향 지원",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 남현수
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("남현수(운전9급)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606103"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 승용차(총장전용) 운행 및 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 총장 수행 관련 업무",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 공용차량 운행 지원",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 김시우
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("김시우(촉탁직)"),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "● 환경미화반장",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 청사 및 시설물 관리 지원",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 대학회계 청소 무기계약직, 촉탁직 직무 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 학내 폐기물 정리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 김광천
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("김광천(촉탁직)"),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "● 환경미화반장",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 학내 건물 외부 청소 및 관리, 잔디깎기, 쓰레기 분리 및 처리 등",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              //김경묵
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("김경묵(촉탁직)"),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "● 학내 건물 내부 청소 및 관리, 쓰레기 관리 등",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              // 이정숙
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("이정숙(촉탁직)"),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "● 학내 건물 내부 청소 및 관리, 쓰레기 관리 등",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 권오경
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("권오경(촉탁직)"),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "● 학내 건물 내부 청소 및 관리, 쓰레기 관리 등",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 박정림
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("박정림(촉탁직)"),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "● 학내 건물 내부 청소 및 관리, 쓰레기 관리 등",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 허규영
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("허규영(무기계약직)"),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "● 학내 건물 내부 청소 및 관리, 쓰레기 관리 등",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 방혜숙
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("방혜숙(무기계약직)"),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "● 학내 건물 내부 청소 및 관리, 쓰레기 관리 등",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              //허명화
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("허명화(무기계약직)"),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "● 학내 건물 내부 청소 및 관리, 쓰레기 관리 등",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 신혜주
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("신혜주(무기계약직)"),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "● 학내 건물 내부 청소 및 관리, 쓰레기 관리 등",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 김인기
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("김인기(무기계약직)"),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "● 학내 건물 내부 청소 및 관리, 쓰레기 관리 등",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text("닫기"),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      );
                                    });
                              },
                              icon: Icon(Icons.arrow_forward,
                                  size: 20, color: Colors.blueAccent)),
                        ],
                      )),
                ),
                // 총무처(재무팀)
                GestureDetector(
                  onTap: () {},
                  child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      width: (MediaQuery.of(context).size.width - 80) / 2,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[200],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("총무처(재무팀)"),
                          IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0)),

                                        title: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("담당자 연락처"),
                                                IconButton(
                                                    onPressed: () {
                                                      launchUrl(
                                                          Uri.parse(
                                                              "https://www.cnue.ac.kr/"
                                                              "cnue/intro/organization/organization07.do"),
                                                          mode: LaunchMode
                                                              .externalApplication);
                                                    },
                                                    icon: Icon(
                                                      Icons.link,
                                                    )),
                                              ],
                                            )
                                          ],
                                        ),
                                        //
                                        content: SingleChildScrollView(
                                          scrollDirection: Axis.vertical,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "위치 : 석우관 402호",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                ),
                                              ),
                                              Text(
                                                "업무 담당자에게 연락할 경우, 빠른 문의가 가능합니다.",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.red),
                                              ),

                                              // 송금순
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("송금순(재무팀장)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606220"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 재무팀 업무 총괄",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 등록금심의위원회 운영 및 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● KORUS 예산관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 대학회계 예산편성에 관한 사항",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 김형석
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("김형석(주무관)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606223"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 국유재산 관리 및 결산에 관한 사항",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 국가 소송 업무",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 실험실습기자재 선정 및 위원회 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 물품(예술품 등)관리 및 결산에 관한 사항",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 이정인
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("이정인(주무관)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606222"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 대학회계(국가지원금)",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "- 결산에 관한 사항",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "- 세입",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "- 원인행위(계약업무 포함) 및 지출",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 세금계산서(반기별), 계산서(년1회)취합 제출",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 김지안
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("김지안(주무관)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606221"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 대학회계(자체수입금)",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "- 결산에 관한 사항",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "- 법인카드 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "- 예산 집행실적 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "- 원인행위(계약업무 포함) 및 지출",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 재정위원회 운영 지원",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 이은표
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("이은표(주무관)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606224"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 등록금(입학금, 수업료)관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 수입결산에 관한 사항",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 대학회계(자체수입금) : 세입",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 공무원 보수 및 연말정산",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 재무팀 기록물 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text("닫기"),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      );
                                    });
                              },
                              icon: Icon(Icons.arrow_forward,
                                  size: 20, color: Colors.blueAccent)),
                        ],
                      )),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // 총무처(시설팀)
                GestureDetector(
                  child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      width: (MediaQuery.of(context).size.width - 80) / 2,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[200],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("총무처(시설팀)"),
                          IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        title: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("담당자 연락처"),
                                                IconButton(
                                                    onPressed: () {
                                                      launchUrl(
                                                          Uri.parse(
                                                              "https://www.cnue.ac.kr/cnue"
                                                              "/intro/organization/organization08.do"),
                                                          mode: LaunchMode
                                                              .externalApplication);
                                                    },
                                                    icon: Icon(
                                                      Icons.link,
                                                    )),
                                              ],
                                            )
                                          ],
                                        ),
                                        //
                                        content: SingleChildScrollView(
                                          scrollDirection: Axis.vertical,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "위치 : 석우관 502호, 108호(목공실) ",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                ),
                                              ),
                                              Text(
                                                "업무 담당자에게 연락할 경우, 빠른 문의가 가능합니다.",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.red),
                                              ),

                                              // 권혁원
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("권혁원(시설팀장)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606230"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 건축 업무 총괄",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 시설사업 기본 계획 수립",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 시설사업 설계 용역 집행 및 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 시설현황 분석 및 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 건축물 유지 보수 및 관리 계획",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 건축공사 추진 및 검사",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 안전 및 하자 계획, 건축․토목공사 설계용역집행관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 부설초교 시설물 유지보수 및 관리계획",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 이규남
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("이규남(주무관)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606231"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 신규공사(건축ㆍ토목)감독 및 집행",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 시설물 정기 및 수시 안전점검",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 시설물 하자관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 교육시설 안전점검(해빙기, 여름철, 겨울철)",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 석면건축물 안전관리 및 유지보수",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 시설현황자료조사 및 작성제출(대학정보공시)",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 작업의뢰서 검토 및 자재수급",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 기록물 / 주간업무 / 재물조사",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text("닫기"),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      );
                                    });
                              },
                              icon: Icon(Icons.arrow_forward,
                                  size: 20, color: Colors.blueAccent)),
                        ],
                      )),
                ),

                // 총무처(설비팀)
                GestureDetector(
                  onTap: () {},
                  child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      width: (MediaQuery.of(context).size.width - 80) / 2,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[200],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("총무처(설비팀)"),
                          IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        title: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("담당자 연락처"),
                                                IconButton(
                                                    onPressed: () {
                                                      launchUrl(
                                                          Uri.parse(
                                                              "https://www.cnue.ac.kr/"
                                                              "cnue/intro/organization/organization09.do"),
                                                          mode: LaunchMode
                                                              .externalApplication);
                                                    },
                                                    icon: Icon(
                                                      Icons.link,
                                                    )),
                                              ],
                                            )
                                          ],
                                        ),
                                        content: SingleChildScrollView(
                                          scrollDirection: Axis.vertical,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "위치 : 석우관 503호",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                ),
                                              ),
                                              Text(
                                                "업무 담당자에게 연락할 경우, 빠른 문의가 가능합니다.",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.red),
                                              ),

                                              // 최영원
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("최영원(설비팀장)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606240"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 전기‧소방‧통신‧기계설비 업무 총괄",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 실험실 안전관리(연구실 안전환경관리자)",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 구내 전화설비 유지보수 및 용역 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 공사 하자검사조서 및 관리대장 관리 (전기, 소방, 통신)",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 승강기 유지보수 (자체검사, 정기점검)",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 온실가스 및 에너지 절약업무",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 박정후
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("박정후(공업주사)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606242"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 소방시설 점검 및 유지보수(전기분야)",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 구내 전화설비 유지보수 및 용역 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 공공요금 계산 지출(유선, 전화요금)",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 기록물 관리 업무 (전기, 소방, 통신)",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 소규모 자체 영선공사",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 이현귀
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("이현귀(공업주사보)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606244"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 실험실 안전관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 냉난방 시설(보일러, GHP, EHP, 지열, 온풍기) 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 소방시설 점검 및 유지보수(기계분야)",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 환경관련 업무(폐수위탁처리, 환경정보공개자료)",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 위험물 안전관리자 선임",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 공사 하자검사조서 및 관리대장 관리(기계분야)",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 소규모 자체 영선공사",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 김종화
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("김종화(공업서기)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606241"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 전기공사 집행 및 유지관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 태양광 발전설비 및 전력감시시스템 유지관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 공공요금 계산 지출(전기요금)",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 태양광 발전설비 및 전력감시시스템 유지관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 소규모 자체 영선공사",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                            ],
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text("닫기"),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      );
                                    });
                              },
                              icon: Icon(Icons.arrow_forward,
                                  size: 20, color: Colors.blueAccent)),
                        ],
                      )),
                ),
              ],
            ),


            // 교육기본시설
            Row(
              children: [
                Text(
                  "<교육기본시설>",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  " - 도서관, 정보전산원 ",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // 도서관
                GestureDetector(
                  child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      width: (MediaQuery.of(context).size.width - 100) / 2,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[200],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("도서관"),
                          IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0)),

                                        title: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("담당자 연락처"),
                                                IconButton(
                                                    onPressed: () {
                                                      launchUrl(
                                                          Uri.parse(
                                                              "https://www.cnue.ac.kr/"
                                                              "cnue/intro/organization/organization02.do"),
                                                          mode: LaunchMode
                                                              .externalApplication);
                                                    },
                                                    icon: Icon(
                                                      Icons.link,
                                                    )),
                                              ],
                                            )
                                          ],
                                        ),
                                        //
                                        content: SingleChildScrollView(
                                          scrollDirection: Axis.vertical,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "위치 : 도서관",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                ),
                                              ),
                                              Text(
                                                "업무 담당자에게 연락할 경우, 빠른 문의가 가능합니다.",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.red),
                                              ),

                                              // 박기범
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("박기범(도서관장)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606300"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 도서관 업무 총괄",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 최형욱
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("최형욱(수서·열람팀장)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606301"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 일반기획 및 교류협력 업무",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 인쇄자료, 전자자, 비도서자료 수집",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "- 단행본 / 연속간행물 / 교과용 도서",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "- 전자책 / Web DB / E-Journal",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 일반도서 자료 등록",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 자료 정리 및 DB 구축",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 자료기증 및 수증",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 단행본, 비도서자료 분류 및 편목",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 학위논문 수집 및 원문 DB 구축",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 연속간행물 체크인",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 김민정
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("김민정(주무관)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606303"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 대출 및 반납",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 도서관 전산화 업무",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 자료실 운영 및 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 분실 및 연체자료 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 도서관 시설물 운영 및 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 사물함 운영 및 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 도서관 시설물 운영 및 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 멀티미디어실 운영 및 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 도서관 일반서무",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 도서관 근로장학생 관리 업무",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text("닫기"),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      );
                                    });
                              },
                              icon: Icon(Icons.arrow_forward,
                                  size: 20, color: Colors.blueAccent)),
                        ],
                      )),
                ),
                // 정보전산원
                GestureDetector(
                  onTap: () {},
                  child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      width: (MediaQuery.of(context).size.width - 100) / 2,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[200],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("정보전산원"),
                          IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0)),

                                        title: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("담당자 연락처"),
                                                IconButton(
                                                    onPressed: () {
                                                      launchUrl(
                                                          Uri.parse(
                                                              "https://www.cnue.ac.kr"
                                                              "/cnue/intro/organization/organization03.do"),
                                                          mode: LaunchMode
                                                              .externalApplication);
                                                    },
                                                    icon: Icon(
                                                      Icons.link,
                                                    )),
                                              ],
                                            )
                                          ],
                                        ),
                                        //
                                        content: SingleChildScrollView(
                                          scrollDirection: Axis.vertical,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "위치 : 전산교육관 403호",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                ),
                                              ),
                                              Text(
                                                "업무 담당자에게 연락할 경우, 빠른 문의가 가능합니다.",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.red),
                                              ),

                                              // 박기범
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("박기범(정보전산원장)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606320"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 정보전산원 업무 총괄",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 김경순
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("김경순(전산주사)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606321"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 정보화사업 업무 총괄",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 일반행정시스템 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● KOEUD 업무 총괄",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● KOEUD 입시행정시스템(학부) 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● KOEUD 입시행정시스템(대학원) 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 박백수
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("박백수(전산주사)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606322"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● KOEUD 운영 및 유지보수",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● KOEDU 부속기관 운영 및 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 일반행정시스템 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 정보시스템 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 정보보안관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 시스템 운영 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 정보자원 유지관리(H/W)",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 서윤영
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("서윤영(전산서기)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606323"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● KOEUD 운영 및 유지보수",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● KOEDU 학부/대학원 학사 운영 및 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 연구행정시스템 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 웹메일 운영 관련 업무",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 정보시스템 서비스 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 홈페이지 운영 관련 업무",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 정종구
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("정종구(대학회계8급)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606324"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● (구)학사행정시스템 관리(학부 및 교육대학원)",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● (구)생활관행정시스템 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● KOEDU 부속기관 운영 및 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● KOEDU 생활관 운영 및 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 업무관리시스템 운영",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 전산실습실(강의실) 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "- 전산실습실 수업 지원(전산관 301호, 302호)",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "- 전산실습실 프로그램 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "- 전산실습실 사용 신청 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 정보전산원 근로장학생 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 조성환
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("조성환(대학회계 8급)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606552"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 전산실습실(강의실) 및 검색실 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "- 정보검색실 운영 지원(도서관, 생활관)",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "- 전자교탁 자산관리 및 유지보수",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text("닫기"),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      );
                                    });
                              },
                              icon: Icon(Icons.arrow_forward,
                                  size: 20, color: Colors.blueAccent)),
                        ],
                      )),
                ),
              ],
            ),

            // 부속시설
            Row(
              children: [
                Text(
                  "<부속시설>",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  " - 기획처, 입학처, 생활관, 신문방송사 등",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // 기획처
                GestureDetector(
                  child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      width: (MediaQuery.of(context).size.width - 100) / 2,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[200],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("기획처"),
                          IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0)),

                                        title: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("담당자 연락처"),
                                                IconButton(
                                                    onPressed: () {
                                                      launchUrl(
                                                          Uri.parse(
                                                              "https://www.cnue.ac.kr/cnue/"
                                                              "intro/organization/organization10.do"),
                                                          mode: LaunchMode
                                                              .externalApplication);
                                                    },
                                                    icon: Icon(
                                                      Icons.link,
                                                    )),
                                              ],
                                            )
                                          ],
                                        ),
                                        //
                                        content: SingleChildScrollView(
                                          scrollDirection: Axis.vertical,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "위치 : 석우관 407호",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                ),
                                              ),
                                              Text(
                                                "업무 담당자에게 연락할 경우, 빠른 문의가 가능합니다.",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.red),
                                              ),

                                              // 최효식
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("최효식(기획처장)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606160"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 기획처 총괄",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● (재)춘천교육대학교발전기금 총괄",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 유광주
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("유광주(기획팀장)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606161"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 기획팀 총괄",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 대학발전 및 운영 관련 업무",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 대학 기구의 설치 및 폐지 관련 업무",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 대학평가 관련 업무",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 소관 규정 및 지침, 각종 위원회 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 권은정
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("권은정(주무관)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606165"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 대학평가에 관한 업무",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 대학정보공시 및 고등교육통계(통계 연보 포함)",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● (재)춘천교육대학교발전기금 운영 및 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 정부 혁신과제 운영",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 기획처 및 발전기금 기록물 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 대학 공간관리 업무",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 이성옥
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("이성옥(주무관)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606382"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 대학운영계획 발간",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 대학요람 발간",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 강주연
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("강주연(주무관)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606381"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 기획처 예산 편성 및 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text("닫기"),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      );
                                    });
                              },
                              icon: Icon(Icons.arrow_forward,
                                  size: 20, color: Colors.blueAccent)),
                        ],
                      )),
                ),
                // 대외협력처
                GestureDetector(
                  onTap: () {},
                  child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      width: (MediaQuery.of(context).size.width - 100) / 2,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[200],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("대외협력처"),
                          IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0)),

                                        title: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("담당자 연락처"),
                                                IconButton(
                                                    onPressed: () {
                                                      launchUrl(
                                                          Uri.parse(
                                                              "https://www.cnue.ac.kr/"
                                                              "cnue/intro/organization/organization15.do"),
                                                          mode: LaunchMode
                                                              .externalApplication);
                                                    },
                                                    icon: Icon(
                                                      Icons.link,
                                                    )),
                                              ],
                                            )
                                          ],
                                        ),
                                        //
                                        content: SingleChildScrollView(
                                          scrollDirection: Axis.vertical,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "위치 : 석우관 403호",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                ),
                                              ),
                                              Text(
                                                "업무 담당자에게 연락할 경우, 빠른 문의가 가능합니다.",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.red),
                                              ),

                                              // 박기범
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("이한종(대외협력처장)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606180"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 대외협력 업무 총괄",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 홍수영
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("홍수영(팀장)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606190"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 대외협력처 업무 총괄",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 대외협력처운영위원회에 관한 사항",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 김태현
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("김태현(주무관)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606163"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 국내교류 업무",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "- 유관기관 및 사회봉사 단체 협력 추진",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "- 대학간 교류 협력 및 학생 교류",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 국제교류 업무",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "- 해외자매대학 유학생 유치 및 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "- 해외파견 및 출장 교직원 출국 지원",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "- 해외 자매대학 교직원 및 학생 교류 추진",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 대학 홍보 업무",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text("닫기"),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      );
                                    });
                              },
                              icon: Icon(Icons.arrow_forward,
                                  size: 20, color: Colors.blueAccent)),
                        ],
                      )),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // 입학처
                GestureDetector(
                  child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      width: (MediaQuery.of(context).size.width - 100) / 2,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[200],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("입학처"),
                          IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0)),

                                        title: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("담당자 연락처"),
                                                IconButton(
                                                    onPressed: () {
                                                      launchUrl(
                                                          Uri.parse(
                                                              "https://www.cnue.ac.kr/"
                                                              "cnue/intro/organization/organization16.do"),
                                                          mode: LaunchMode
                                                              .externalApplication);
                                                    },
                                                    icon: Icon(
                                                      Icons.link,
                                                    )),
                                              ],
                                            )
                                          ],
                                        ),
                                        //
                                        content: SingleChildScrollView(
                                          scrollDirection: Axis.vertical,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "위치 : 석우관 403호",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                ),
                                              ),
                                              Text(
                                                "업무 담당자에게 연락할 경우, 빠른 문의가 가능합니다.",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.red),
                                              ),

                                              // 이한종
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("이한종(입학처장)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606180"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 입학처 업무 총괄",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 홍수영
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("홍수영(입학팀장)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606190"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 입학팀 업무 총괄",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 수시, 정시 입학관리 총괄",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 소관 예산 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 이교혁
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("이교혁(입학사정관)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606803"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 대학입학전형 시행계획 수립",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 수시 맟 정시 세부추진계획 수립 ",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 수시모집 서류 및 면접평가 운영",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 정시모집 면접평가 운영",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 통합학사(입학) 운영",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 나이스 대입전형자료 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 원서접수, 서류 및 면접 평가 시스템 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 대입상담 및 입시정보공시, 입시설명회 운영",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 김태현
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("김태현(주무관)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606804"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 위촉사정관 및 교수 교육 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 수시모집 유사도 및 회피·배제 운영",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 재정지원사업(혁신사업)",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● ASSIST-전형료 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 일반서무",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 입학처 근로학생 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text("닫기"),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      );
                                    });
                              },
                              icon: Icon(Icons.arrow_forward,
                                  size: 20, color: Colors.blueAccent)),
                        ],
                      )),
                ),
                // 초등교육연구원
                GestureDetector(
                  onTap: () {},
                  child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      width: (MediaQuery.of(context).size.width - 70) / 2,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[200],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("초등교육연구원"),
                          IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0)),

                                        title: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("담당자 연락처"),
                                                IconButton(
                                                    onPressed: () {
                                                      launchUrl(
                                                          Uri.parse(
                                                              "https://www.cnue.ac.kr"
                                                              "/cnue/intro/organization/organization13.do"),
                                                          mode: LaunchMode
                                                              .externalApplication);
                                                    },
                                                    icon: Icon(
                                                      Icons.link,
                                                    )),
                                              ],
                                            )
                                          ],
                                        ),
                                        //
                                        content: SingleChildScrollView(
                                          scrollDirection: Axis.vertical,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "위치 : 석우관 215호(교무처)",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                ),
                                              ),
                                              Text(
                                                "업무 담당자에게 연락할 경우, 빠른 문의가 가능합니다.",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.red),
                                              ),

                                              // 곽현규
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("곽현규(원장)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606120"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 초등교육연구원 업무 총괄",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 교육 및 특강 관련 학생지도",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 박상봉
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("박상봉(팀장)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606121"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 초등교육연구원 업무 총괄",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 초등교육연구원 운영위원회, 연구소 규정 및 예산 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 초등교육연구원 예산 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 연구활동 지원에 관한 업무 총괄",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 조유나
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("조유나(주무관)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606122"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 교원 연구활동 지원 관련 사항",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 산하 연구소 관리 및 지원",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 초교원 운영위원회, 학술연구평가위원회, 연구진실성위원회 및 생명윤리위원회(IRB) 관리 및 운영",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 춘천교대 교육포럼(CNUE-EF) 특강 개최",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 교내학술지「교육연구」발간",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 초등교육연구원 일반 서무 및 물품관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text("닫기"),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      );
                                    });
                              },
                              icon: Icon(Icons.arrow_forward,
                                  size: 20, color: Colors.blueAccent)),
                        ],
                      )),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // 교육혁신원
                GestureDetector(
                  child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      width: (MediaQuery.of(context).size.width - 100) / 2,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[200],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("교육혁신원"),
                          IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0)),

                                        title: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("담당자 연락처"),
                                                IconButton(
                                                    onPressed: () {
                                                      launchUrl(
                                                          Uri.parse(
                                                              "https://www.cnue.ac.kr/"
                                                              "cnue/intro/organization/organization14.do"),
                                                          mode: LaunchMode
                                                              .externalApplication);
                                                    },
                                                    icon: Icon(
                                                      Icons.link,
                                                    )),
                                              ],
                                            )
                                          ],
                                        ),
                                        //
                                        content: SingleChildScrollView(
                                          scrollDirection: Axis.vertical,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "위치 : 홍익관 101호 ~ 104호, 108호~109호 / 석우관 501호, 512호",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                ),
                                              ),
                                              Text(
                                                "업무 담당자에게 연락할 경우, 빠른 문의가 가능합니다.",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.red),
                                              ),

                                              // 제민경
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("제민경(원장)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606413"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 교육혁신원 업무 총괄",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 조성환
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("조성환(주무관 : 팀장 직무대리)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606552"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 교육혁신원 기획업무",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 학습관리시스템(e-class)운영",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 스마트교육 실습실 운영관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "- 수업 분석 위한 강의 촬영",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "- 스튜디오 시설 및 교육실습 기자재 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "- 임용고시 2차 수업실연 지원",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 전국교대 종은수업 탐구대회 지원",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 국가재정지원사업 추진(국립대학육성사업)",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "- 학습역량 DNA 스마트러닝 인프라 지원",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 강의 매체 제작 지원",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 서윤영
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("서윤영(주무관)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606323"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 학습관리시스템(e-class) 운영 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "- 이러닝 개설강좌 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "- 이러닝 수강자 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "- 비교과 개설강좌 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),

                                              // 김지욱
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("김지욱(주무관)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606553"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 스마트교육 실습실 운영관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "- 수업 분석 위한 강의 촬영",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "- 스튜디오 시설 및 교육실습 기자재 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "- 임용고시 2차 수업실연 지원",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 국가재정지원사업 추진(국립대학육성사업)",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "- 폼 나는 수업캠프",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 국가재정지원사업 추진(대학혁신지원사업)",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "- 핵심역량 DNA 체험중심 교육과정 개발",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "- 수업역량 DNA 학습공모전",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 학습관리시스템(e-class)운영",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 장소정
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("장소정(주무관)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606554"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 교수법 개선 및 교수역량강화 지원 사업 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 전국교대 좋은수업 탐구대회 지원",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 국가재정지원사업 추진(대학혁신지원사업)",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "- 미래역량 DNA 학생참여 교과 혁신 프로그램",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "- 네트워크 역량 DNA 교과 연계·통합 프로그램",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "- 융합역량 DNA 교과 협업·코칭 프로그램",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "- 핵심역량 DNA 메타버스 활용 교육과정 개발",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "- 수업역량 DNA 교내 수업설계 대회 및 전국 교대 좋은 수업 탐구대회",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "- 교수역량 DNA 자가진단 도구개발",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 학습관리시스템(e-class)운영",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 유희진
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("유희진(주무관)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606556"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 교수법 개선 및 교수역량강화 지원 사업 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 전국교대 좋은수업 탐구대회 지원",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 국가재정지원사업 추진(대학혁신지원사업)",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "- 교수역량 DNA KOCW 제작 지원",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "- 교수역량 DNA 맞춤형 연수 지원",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "- edu-start up 캠프",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "- edu-start up 대회",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "- edu-level up 교육 활동 지원",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 학습관리시스템(e-class)운영",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text("닫기"),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      );
                                    });
                              },
                              icon: Icon(Icons.arrow_forward,
                                  size: 20, color: Colors.blueAccent)),
                        ],
                      )),
                ),
                // 생활관
                GestureDetector(
                  onTap: () {},
                  child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      width: (MediaQuery.of(context).size.width - 100) / 2,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[200],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("생활관"),
                          IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0)),

                                        title: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("담당자 연락처"),
                                                IconButton(
                                                    onPressed: () {
                                                      launchUrl(
                                                          Uri.parse(
                                                              "https://life.cnue.ac.kr/"
                                                              "life/intro/organization.do"),
                                                          mode: LaunchMode
                                                              .externalApplication);
                                                    },
                                                    icon: Icon(
                                                      Icons.link,
                                                    )),
                                              ],
                                            )
                                          ],
                                        ),
                                        //
                                        content: SingleChildScrollView(
                                          scrollDirection: Axis.vertical,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "위치 : 목련관 1층 행정실",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                ),
                                              ),
                                              Text(
                                                "업무 담당자에게 연락할 경우, 빠른 문의가 가능합니다.",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.red),
                                              ),

                                              // 박헌우
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("박헌우(생활관장)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606130"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 생활관 업무 총괄",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 이헌식
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("이헌식(행정실장)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606131"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 생활관 업무 총괄",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 생활관 제·규정 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 생활관 회계 출납업무",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 생활관 직원 복무관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 박명주
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("박명주(목련관)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332640531"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 생활관 세입 / 예산편성 / 원인행위",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 사생 모집(학기 중) / 사생자치회 관리 및 운영",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 학교식당 / 외빈실 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 이풍현
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("이풍현(목련관)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332640532"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 생활관 회계 지출 및 결산",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 사생 모집(방학 중)",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● BTL(송백관) 성과평가 운영",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 홍재식
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("홍재식(목련관)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332640533"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 목련관 난방 / 방호 / 시설물 / 조경 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 목련관 우편물 / 물품 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 소관 업무 회계 구입 품의",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 박화성
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("박화성(목련관)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332640533"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 목련관 실·내외 청소",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 목련관 호실 및 외빈실 청소",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 유은숙
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("유은숙(송백관)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332629913"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 송백관 사생 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 송백관 사생 복지 및 역량강화 프로그램 운영",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 송백관 사생자치회 관리 및 운영",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text("닫기"),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      );
                                    });
                              },
                              icon: Icon(Icons.arrow_forward,
                                  size: 20, color: Colors.blueAccent)),
                        ],
                      )),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // 신문방송사
                GestureDetector(
                  child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      width: (MediaQuery.of(context).size.width - 100) / 2,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[200],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("신문방송사"),
                          IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0)),

                                        title: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("담당자 연락처"),
                                                IconButton(
                                                    onPressed: () {
                                                      launchUrl(
                                                          Uri.parse(
                                                              "https://www.cnue.ac.kr/"
                                                              "cnue/intro/organization/organization11.do"),
                                                          mode: LaunchMode
                                                              .externalApplication);
                                                    },
                                                    icon: Icon(
                                                      Icons.link,
                                                    )),
                                              ],
                                            )
                                          ],
                                        ),
                                        //
                                        content: SingleChildScrollView(
                                          scrollDirection: Axis.vertical,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "신문사 : 집현관 113호",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                ),
                                              ),
                                              Text(
                                                "방송국 : 집현관 111호",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                ),
                                              ),
                                              Text(
                                                "업무 담당자에게 연락할 경우, 빠른 문의가 가능합니다.",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.red),
                                              ),

                                              // 박헌우
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("박헌우(주간교수/교수)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606130"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 신문방송사 주간 운영위원장",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 석우학술문학상 심사위원장",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 교육방송국 방송제 총괄 지휘",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 서재복
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("서재복(운영위원/교수)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606503"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 신문사 운영위원 및 석우학술문화상 심사위원",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 방송사 운영위원 및 방송제 자문",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 이승철
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("이승철(운영위원/조교수)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606433"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 신문사 운영위원 및 석우학술문화상 심사위원",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 방송사 운영위원 및 방송제 자문",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 박성석
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("박성석(운영위원/조교수)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606412"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 신문사 운영위원 및 석우학술문화상 심사위원",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 방송사 운영위원 및 방송제 자문",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 오현석
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("오현석(운영위원/조교수)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606467"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 신문사 운영위원 및 석우학술문화상 심사위원",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 방송사 운영위원 및 방송제 자문",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("이헌식(간사)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606131"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 신문사 운영 및 석우학술 행정 및 예산 집행",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 방송사 운영 및 예산 집행",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 실무국원
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("김은지 외 3명(실무국원)"),
                                                ],
                                              ),
                                              Text(
                                                "● 신문방송사 기획·편집 회의 주재, 기사취재 및 작성, 편집, 각종 실무업무",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 정국원
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("정유진 외 11명(정국원)"),
                                                ],
                                              ),
                                              Text(
                                                "● 기사취재 및 작성, 편집, 각종 실무업무",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 수습국원
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("수습국원"),
                                                ],
                                              ),
                                              Text(
                                                "● 기사취재 및 작성, 편집(수습), 각종 실무업무",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text("닫기"),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      );
                                    });
                              },
                              icon: Icon(Icons.arrow_forward,
                                  size: 20, color: Colors.blueAccent)),
                        ],
                      )),
                ),
                // 장애학생지원센터
                GestureDetector(
                  onTap: () {},
                  child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(7),
                      width: (MediaQuery.of(context).size.width - 60) / 2,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[200],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("장애학생지원센터"),
                          IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0)),

                                        title: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("담당자 연락처"),
                                                IconButton(
                                                    onPressed: () {
                                                      launchUrl(
                                                          Uri.parse(
                                                              "https://www.cnue.ac.kr/"
                                                              "cnue/intro/organization/organization17.do"),
                                                          mode: LaunchMode
                                                              .externalApplication);
                                                    },
                                                    icon: Icon(
                                                      Icons.link,
                                                    )),
                                              ],
                                            )
                                          ],
                                        ),
                                        //
                                        content: SingleChildScrollView(
                                          scrollDirection: Axis.vertical,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "위치 : 학생지원센터 1층",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                ),
                                              ),
                                              Text(
                                                "업무 담당자에게 연락할 경우, 빠른 문의가 가능합니다.",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.red),
                                              ),

                                              // 박헌우
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("박헌우(센터장)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606130"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 장애학생지원 업무 총괄",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 이헌식
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("이헌식(팀장)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606131"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 장애학생지원센터 운영 업무 전반",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 강 한
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("강 한(주무관)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606133"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 장애학생지원센터 운영 업무",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text("닫기"),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      );
                                    });
                              },
                              icon: Icon(Icons.arrow_forward,
                                  size: 20, color: Colors.blueAccent)),
                        ],
                      )),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // 인권센터
                GestureDetector(
                  child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      width: (MediaQuery.of(context).size.width - 100) / 2,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[200],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("인권센터"),
                          IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0)),

                                        title: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("담당자 연락처"),
                                                IconButton(
                                                    onPressed: () {
                                                      launchUrl(
                                                          Uri.parse(
                                                              "https://www.cnue.ac.kr"
                                                              "/cnue/intro/organization/organization19.do"),
                                                          mode: LaunchMode
                                                              .externalApplication);
                                                    },
                                                    icon: Icon(
                                                      Icons.link,
                                                    )),
                                              ],
                                            )
                                          ],
                                        ),
                                        //
                                        content: SingleChildScrollView(
                                          scrollDirection: Axis.vertical,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "위치 : 학생지원센터 2층 인권센터",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                ),
                                              ),
                                              Text(
                                                "업무 담당자에게 연락할 경우, 빠른 문의가 가능합니다.",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.red),
                                              ),

                                              // 박헌우
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("박헌우(센터장)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606130"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 인권센터 운영 업무 총괄",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 이헌식
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("이헌식(팀장)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606131"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 인권센터 운영 업무 전반",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 인권신장 관련 정책 수립",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 인권센터 운영위원회 운영",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 강 한
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("강 한(주무관)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606133"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 정신건강 증진 등을 위한 상담",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 인권침해 예방 홍보 및 교육",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 인권침해 피해사건 상담 및 접수, 조사, 중재 업무 지원",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text("닫기"),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      );
                                    });
                              },
                              icon: Icon(Icons.arrow_forward,
                                  size: 20, color: Colors.blueAccent)),
                        ],
                      )),
                ),
                // 재정지원사업단
                GestureDetector(
                  onTap: () {},
                  child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(5),
                      width: (MediaQuery.of(context).size.width - 80) / 2,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[200],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("재정지원사업단"),
                          IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0)),

                                        title: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("담당자 연락처"),
                                                IconButton(
                                                    onPressed: () {
                                                      launchUrl(
                                                          Uri.parse(
                                                              "https://www.cnue.ac.kr"
                                                              "/cnue/intro/organization/organization18.do"),
                                                          mode: LaunchMode
                                                              .externalApplication);
                                                    },
                                                    icon: Icon(
                                                      Icons.link,
                                                    )),
                                              ],
                                            )
                                          ],
                                        ),
                                        //
                                        content: SingleChildScrollView(
                                          scrollDirection: Axis.vertical,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "위치 : 석우관 407호",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                ),
                                              ),
                                              Text(
                                                "업무 담당자에게 연락할 경우, 빠른 문의가 가능합니다.",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.red),
                                              ),

                                              // 최효식
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("최효식(사업단장)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606160"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 재정지원사업단 총괄",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 대학회계 분임재무관(재정지원사업단 사업비)",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 유광주
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("유광주(미래전략팀장)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606161"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 대학회계 분임지출관(재정지원사업단 사업비)",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 미래전략팀 계약직원 인사 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 재정지원사업단 소관 지침 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 강원도 대학발전육성사업 추진(사업계획 수립)",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 재정지원사업별 성과 관리 및 대·내외 홍보 기획",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 이성옥
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("이성옥(주무관)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606382"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 국립대학육성사업 원인행위(계약업무 포함)",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 국립대학육성사업 부서별 추진상황 점검",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 국립대학육성사업 연구 총괄 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 국립대학육성사업 사업비 정산 및 점검",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 강원도 대학발전육성사업 관리 및 원인행위",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 재정지원사업단 일반서무",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 재정지원사업단 기록물 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 강주연
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("강주연(주무관)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606381"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 국립대학육성사업 업무",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "- 원인행위(계약업무 포함)",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "- 부서별 추진상황 점검",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "- 연구 총괄 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "- 사업비 정산 및 점검",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 국립대학육성사업 세부사업 추진 관리(중간보고서 제출 등)",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 대학 재정지원사업 중복심사위원회 운영",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 강원도 대학발전육성사업 지출결의",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 강원도 대학발전육성사업 사업비 정산 및 점검",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 박윤아
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("박윤아(주무관)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606383"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 국립대학육성사업 계획서 및 결과 보고서 작성",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 국립대학육성사업 사업비 관리(예산 편성, 배정 등)",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 국립대학육성사업 세부사업 추진 관리(중간보고서 제출 등)",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 국립대학육성사업 관련 위원회 및 성과분석팀 운영",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 이지윤
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("이지윤(주무관)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606386"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 국립대학육성사업 계획서 및 결과 보고서 작성",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 국립대학육성사업 사업비 관리(예산 편성, 배정 등)",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 국립대학육성사업 세부사업 추진 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 국립대학육성사업 관련 위원회 및 성과분석팀 운영",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),

                                              // 오선화
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("오선화(주무관)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606385"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 국립대학육성사업 지출결의",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 국립대학육성사업 법인카드 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 국립대학육성사업 세부사업별 물품, 도서 목록 관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 국립대학육성사업 성과관리 및 서포터즈 운영",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 국립대학육성사업 일반 서무",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ),
                                        ),

                                        actions: <Widget>[
                                          TextButton(
                                            child: Text("닫기"),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      );
                                    });
                              },
                              icon: Icon(Icons.arrow_forward,
                                  size: 20, color: Colors.blueAccent)),
                        ],
                      )),
                ),
              ],
            ),


            // 기타기관
            Row(
              children: [
                Text(
                  "<기타기관>",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // 직장에비군소대
                GestureDetector(
                  child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      width: (MediaQuery.of(context).size.width - 70) / 2,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[200],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("직장예비군소대"),
                          IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0)),

                                        title: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("담당자 연락처"),
                                                IconButton(
                                                    onPressed: () {
                                                      launchUrl(
                                                          Uri.parse(
                                                              "https://www.cnue.ac.kr/"
                                                              "cnue/intro/organization/organization22.do"),
                                                          mode: LaunchMode
                                                              .externalApplication);
                                                    },
                                                    icon: Icon(
                                                      Icons.link,
                                                    )),
                                              ],
                                            )
                                          ],
                                        ),
                                        //
                                        content: SingleChildScrollView(
                                          scrollDirection: Axis.vertical,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "위치 : 학생지원센터 3층",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                ),
                                              ),
                                              Text(
                                                "업무 담당자에게 연락할 경우, 빠른 문의가 가능합니다.",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.red),
                                              ),

                                              // 오경석
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("오경석(소대장)"),
                                                  IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          "tel:0332606215"));
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      color: Colors.blue,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                "● 대학예비군 편성 및 자원관리",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 학적변동자 전입 및 전출 조치",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 예비군 훈련일정 협조 및 홍보",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 훈련통지서 교부 및 훈련 결산",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                "● 전시 대학직장예비군 운영",
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text("닫기"),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      );
                                    });
                              },
                              icon: Icon(Icons.arrow_forward,
                                  size: 20, color: Colors.blueAccent)),
                        ],
                      )),
                ),
                // CU 춘천교대점
                GestureDetector(
                  child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(5),
                      width: (MediaQuery.of(context).size.width - 90) / 2,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[200],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("CU춘천교대점"),
                          IconButton(
                              onPressed: () {
                                launchUrl(Uri.parse("tel:0332621619"));
                              },
                              icon: Icon(Icons.call,
                                  size: 20, color: Colors.blueAccent)),
                        ],
                      )),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // 알파문구
                GestureDetector(
                  child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(5),
                      width: (MediaQuery.of(context).size.width - 90) / 2,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[200],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("알파문구"),
                          IconButton(
                              onPressed: () {
                                launchUrl(Uri.parse("tel:0332621891"));
                              },
                              icon: Icon(Icons.call,
                                  size: 20, color: Colors.blueAccent)),
                        ],
                      )),
                ),
                // 정문상황실
                GestureDetector(
                  child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(5),
                      width: (MediaQuery.of(context).size.width - 90) / 2,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[200],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("정문상황실"),
                          IconButton(
                              onPressed: () {
                                launchUrl(Uri.parse("tel:0332606271"));
                              },
                              icon: Icon(Icons.call,
                                  size: 20, color: Colors.blueAccent)),
                        ],
                      )),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // 학내카페(음)
                GestureDetector(
                  child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(5),
                      width: (MediaQuery.of(context).size.width - 90) / 2,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[200],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("학내카페(음)"),
                          IconButton(
                              onPressed: () {
                                launchUrl(Uri.parse("tel:07075438182"));
                              },
                              icon: Icon(Icons.call,
                                  size: 20, color: Colors.blueAccent)),
                        ],
                      )),
                ),
                // 당직실
                GestureDetector(
                  child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(5),
                      width: (MediaQuery.of(context).size.width - 90) / 2,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[200],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("당직실"),
                          IconButton(
                              onPressed: () {
                                launchUrl(Uri.parse("tel:0332606270"));
                              },
                              icon: Icon(Icons.call,
                                  size: 20, color: Colors.blueAccent)),
                        ],
                      )),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // 학교식당
                GestureDetector(
                  child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(5),
                      width: (MediaQuery.of(context).size.width - 90) / 2,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[200],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("학교식당"),
                          IconButton(
                              onPressed: () {
                                launchUrl(Uri.parse("tel:07082287213"));
                              },
                              icon: Icon(Icons.call,
                                  size: 20, color: Colors.blueAccent)),
                        ],
                      )),
                ),
                // BTL 생활관
                GestureDetector(
                  child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(5),
                      width: (MediaQuery.of(context).size.width - 90) / 2,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[200],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("BTL 생활관"),
                          IconButton(
                              onPressed: () {
                                launchUrl(Uri.parse("tel:0332629913"));
                              },
                              icon: Icon(Icons.call,
                                  size: 20, color: Colors.blueAccent)),
                        ],
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
