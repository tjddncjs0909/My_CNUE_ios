// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fluttertoast/fluttertoast.dart';

class school_food_screen_next extends StatefulWidget {
  const school_food_screen_next({Key? key}) : super(key: key);

  @override
  State<school_food_screen_next> createState() => _school_food_screen_nextState();
}

class _school_food_screen_nextState extends State<school_food_screen_next> {

  double menu_font_size = 18;

  // 월요일
  String Month_mon = "";
  String Day_mon = "";
  List<String> menu_mon_1 = [
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  List<String> menu_mon_2 = [
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  List<String> menu_mon_3 = [
    "",
    "",
    "",
    "",
    "",
    "",
  ];

  // 화요일
  String Month_tue = "";
  String Day_tue = "";
  List<String> menu_tue_1 = [
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  List<String> menu_tue_2 = [
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  List<String> menu_tue_3 = [
    "",
    "",
    "",
    "",
    "",
    "",
  ];


  //수요일
  String Month_wed= "";
  String Day_wed = "";
  List<String> menu_wed_1 = [
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  List<String> menu_wed_2 = [
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  List<String> menu_wed_3 = [
    "",
    "",
    "",
    "",
    "",
    "",
  ];

  //목요일
  String Month_thu= "";
  String Day_thu = "";
  List<String> menu_thu_1 = [
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  List<String> menu_thu_2 = [
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  List<String> menu_thu_3 = [
    "",
    "",
    "",
    "",
    "",
    "",
  ];

  //금요일
  String Month_fri= "";
  String Day_fri = "";
  List<String> menu_fri_1 = [
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  List<String> menu_fri_2 = [
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  List<String> menu_fri_3 = [
    "",
    "",
    "",
    "",
    "",
    "",
  ];


  //토요일
  String Month_sat= "";
  String Day_sat = "";
  List<String> menu_sat_1 = [
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  List<String> menu_sat_2 = [
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  List<String> menu_sat_3 = [
    "",
    "",
    "",
    "",
    "",
    "",
  ];

  //일요일
  String Month_sun= "";
  String Day_sun = "";
  List<String> menu_sun_1 = [
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  List<String> menu_sun_2 = [
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  List<String> menu_sun_3 = [
    "",
    "",
    "",
    "",
    "",
    "",
  ];

  final db = FirebaseFirestore.instance;

  Refreshing() {
    db.collection('next_1_월요일').doc('1_조식').get().then((DocumentSnapshot ds) {
      Map<String, dynamic> map = ds.data() as Map<String, dynamic>;

      for (int i = 0; i < 6; i++) {
        menu_mon_1[i] = map['$i'];
      }
      Month_mon = map['mon'];
      Day_mon = map['day'];
    }
    );

    db.collection('next_1_월요일').doc('2_중식').get().then((DocumentSnapshot ds) {
      Map<String, dynamic> map = ds.data() as Map<String, dynamic>;

      for (int i = 0; i < 6; i++) {
        menu_mon_2[i] = map['$i'];
      }
    }
    );

    db.collection('next_1_월요일').doc('3_석식').get().then((DocumentSnapshot ds) {
      Map<String, dynamic> map = ds.data() as Map<String, dynamic>;

      for (int i = 0; i < 6; i++) {
        menu_mon_3[i] = map['$i'];
      }
    }
    );

    db.collection('next_2_화요일').doc('1_조식').get().then((DocumentSnapshot ds) {
      Map<String, dynamic> map = ds.data() as Map<String, dynamic>;

      for (int i = 0; i < 6; i++) {
        menu_tue_1[i] = map['$i'];
      }
      Month_tue = map['mon'];
      Day_tue = map['day'];
    }
    );
    db.collection('next_2_화요일').doc('2_중식').get().then((DocumentSnapshot ds) {
      Map<String, dynamic> map = ds.data() as Map<String, dynamic>;

      for (int i = 0; i < 6; i++) {
        menu_tue_2[i] = map['$i'];
      }
    }
    );
    db.collection('next_2_화요일').doc('3_석식').get().then((DocumentSnapshot ds) {
      Map<String, dynamic> map = ds.data() as Map<String, dynamic>;

      for (int i = 0; i < 6; i++) {
        menu_tue_3[i] = map['$i'];
      }
    }
    );
    db.collection('next_3_수요일').doc('1_조식').get().then((DocumentSnapshot ds) {
      Map<String, dynamic> map = ds.data() as Map<String, dynamic>;

      for (int i = 0; i < 6; i++) {
        menu_wed_1[i] = map['$i'];
      }
      Month_wed = map['mon'];
      Day_wed = map['day'];
    }
    );
    db.collection('next_3_수요일').doc('2_중식').get().then((DocumentSnapshot ds) {
      Map<String, dynamic> map = ds.data() as Map<String, dynamic>;

      for (int i = 0; i < 6; i++) {
        menu_wed_2[i] = map['$i'];
      }
    }
    );
    db.collection('next_3_수요일').doc('3_석식').get().then((DocumentSnapshot ds) {
      Map<String, dynamic> map = ds.data() as Map<String, dynamic>;

      for (int i = 0; i < 6; i++) {
        menu_wed_3[i] = map['$i'];
      }
    }
    );
    db.collection('next_4_목요일').doc('1_조식').get().then((DocumentSnapshot ds) {
      Map<String, dynamic> map = ds.data() as Map<String, dynamic>;

      for (int i = 0; i < 6; i++) {
        menu_thu_1[i] = map['$i'];
      }
      Month_thu = map['mon'];
      Day_thu = map['day'];
    }
    );

    db.collection('next_4_목요일').doc('2_중식').get().then((DocumentSnapshot ds) {
      Map<String, dynamic> map = ds.data() as Map<String, dynamic>;

      for (int i = 0; i < 6; i++) {
        menu_thu_2[i] = map['$i'];
      }
    }
    );

    db.collection('next_4_목요일').doc('3_석식').get().then((DocumentSnapshot ds) {
      Map<String, dynamic> map = ds.data() as Map<String, dynamic>;

      for (int i = 0; i < 6; i++) {
        menu_thu_3[i] = map['$i'];
      }
    }
    );
    db.collection('next_5_금요일').doc('1_조식').get().then((DocumentSnapshot ds) {
      Map<String, dynamic> map = ds.data() as Map<String, dynamic>;

      for (int i = 0; i < 6; i++) {
        menu_fri_1[i] = map['$i'];
      }
      Month_fri = map['mon'];
      Day_fri = map['day'];
    }
    );

    db.collection('next_5_금요일').doc('2_중식').get().then((DocumentSnapshot ds) {
      Map<String, dynamic> map = ds.data() as Map<String, dynamic>;

      for (int i = 0; i < 6; i++) {
        menu_fri_2[i] = map['$i'];
      }
    }
    );

    db.collection('next_5_금요일').doc('3_석식').get().then((DocumentSnapshot ds) {
      Map<String, dynamic> map = ds.data() as Map<String, dynamic>;

      for (int i = 0; i < 6; i++) {
        menu_fri_3[i] = map['$i'];
      }
    }
    );
    db.collection('next_6_토요일').doc('1_조식').get().then((DocumentSnapshot ds) {
      Map<String, dynamic> map = ds.data() as Map<String, dynamic>;

      for (int i = 0; i < 6; i++) {
        menu_sat_1[i] = map['$i'];
      }
      Month_sat = map['mon'];
      Day_sat = map['day'];
    }
    );
    db.collection('next_6_토요일').doc('2_중식').get().then((DocumentSnapshot ds) {
      Map<String, dynamic> map = ds.data() as Map<String, dynamic>;

      for (int i = 0; i < 6; i++) {
        menu_sat_2[i] = map['$i'];
      }
    }
    );
    db.collection('next_6_토요일').doc('3_석식').get().then((DocumentSnapshot ds) {
      Map<String, dynamic> map = ds.data() as Map<String, dynamic>;

      for (int i = 0; i < 6; i++) {
        menu_sat_3[i] = map['$i'];
      }
    }
    );
    db.collection('next_7_일요일').doc('1_조식').get().then((DocumentSnapshot ds) {
      Map<String, dynamic> map = ds.data() as Map<String, dynamic>;

      for (int i = 0; i < 6; i++) {
        menu_sun_1[i] = map['$i'];
      }
      Month_sun = map['mon'];
      Day_sun = map['day'];
    }
    );

    db.collection('next_7_일요일').doc('2_중식').get().then((DocumentSnapshot ds) {
      Map<String, dynamic> map = ds.data() as Map<String, dynamic>;

      for (int i = 0; i < 6; i++) {
        menu_sun_2[i] = map['$i'];
      }
    }
    );

    db.collection('next_7_일요일').doc('3_석식').get().then((DocumentSnapshot ds) {
      Map<String, dynamic> map = ds.data() as Map<String, dynamic>;

      for (int i = 0; i < 6; i++) {
        menu_sun_3[i] = map['$i'];
      }
    }
    );

  }

  late DateFormat daysFormat;

  var now1 = DateTime.now();

  String getSystemTime() {
    var now = DateTime.now();
    return DateFormat("HH:mm:ss ").format(now);
  }

  void showToast(){
    Fluttertoast.showToast(
      msg: "메뉴가 업데이트 되었습니다.",
      gravity: ToastGravity.BOTTOM,
      fontSize: 13,
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: Colors.black,
      textColor: Colors.white70,
    );
  }

  @override
  void initState() {
    super.initState();

    // time calling
    initializeDateFormatting();
    daysFormat = DateFormat.EEEE('ko');

    // calling menu information
    Refreshing();
  }
  final Uri url1 = Uri.parse('https://www.cnue.ac.kr/life/info/food.do');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('MY CNUE',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          iconTheme: IconThemeData(
              color: Colors.black
          ),
          elevation: 0.0,
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              onPressed: (){
                Refreshing();
                showToast();
              },
              icon: Icon(Icons.refresh),
              color: Colors.black,),
            IconButton(
              onPressed: (){
              },
              icon: Icon(Icons.settings),
              color: Colors.black,),
          ]
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('다음주 학식',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
              ],
            ),
            TimerBuilder.periodic(Duration(milliseconds: 100), builder: (context){
              return Text('($Month_mon월 $Day_mon일 ~ $Month_sun월 $Day_sun일)',
                style: TextStyle(
                  fontSize: 20,
                ),
              );
            }
            ),

            SizedBox(
              height: 5,
            ),
            Text('* Meal Care 앱에 메뉴가 올라오면 업데이트 됩니다. *',
              style: TextStyle(
                  fontSize: 15
              ),),
            Text('* 보통 전주 화요일 ~ 수요일에 업데이트 됩니다. *',
              style: TextStyle(
                  fontSize: 15
              ),),
            Divider(
              height: 20.0,
              thickness: 1.5,
              color: Colors.grey,
            ),
            // 운영시간
            Row(
              children: [
                Text('< 운영 시간 >    ',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900
                  ),
                ),
                Text('지금은 ',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                TimerBuilder.periodic(Duration(seconds: 1), builder: (context){
                  return Text('${daysFormat.format(now1)} ${getSystemTime()}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    ),);
                }
                ),
                Text('입니다.',
                  style: TextStyle(
                    fontSize: 15,
                  ),)
              ],
            ),
            Container(
              height: 20,
            ),
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.all(0),
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.lightGreen,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text('',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900
                              ),),
                            Container(
                              height: 15,
                            ),
                            Text('조식',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900
                              ),
                            ),
                            Container(
                              height: 15,
                            ),
                            Text('중식',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900
                              ),),
                            Container(
                              height: 15,
                            ),
                            Text('석식',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900
                              ),),
                          ],
                        ),
                        Column(
                          children: [
                            Text('평일',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900
                              ),),
                            Container(
                              height: 15,
                            ),
                            Text('07:30~09:00',
                              style: TextStyle(
                                fontSize: 20,
                              ),),
                            Container(
                              height: 15,
                            ),
                            Text('11:30~13:30',
                              style: TextStyle(
                                fontSize: 20,
                              ),),
                            Container(
                              height: 15,
                            ),
                            Text('17:00~18:30',
                              style: TextStyle(
                                fontSize: 20,
                              ),),
                          ],
                        ),
                        Column(
                          children: [
                            Text('주말 및 공휴일',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w900
                              ),),
                            Container(
                              height: 15,
                            ),
                            Text('08:00~09:00',
                              style: TextStyle(
                                fontSize: 20,
                              ),),
                            Container(
                              height: 15,
                            ),
                            Text('12:00~13:00',
                              style: TextStyle(
                                fontSize: 20,
                              ),),
                            Container(
                              height: 15,
                            ),
                            Text('17:00~18:00',
                              style: TextStyle(
                                fontSize: 20,
                              ),),
                          ],
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            Container(
              height: 20,
            ),

            Divider(
              height: 20.0,
              thickness: 1.5,
              color: Colors.grey,
            ),


            // 월요일
            TimerBuilder.periodic(Duration(milliseconds: 100), builder: (context){
              return Text('${Month_mon}월 ${Day_mon}일',
                style: TextStyle(
                  fontSize: 20,
                ),);
            }),
            Text('월요일',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
              ),),
            Container(
              height: 20,
            ),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    width: 50,
                  ),
                  TimerBuilder.periodic(Duration(milliseconds: 100), builder: (context){
                    return Column(
                      children: [
                        Text('조식',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),),
                        Container(
                          height: 15,
                        ),
                        Text('★${menu_mon_1[0]}★',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.red
                          ),),
                        for(int i=1; i<6; i++)
                          Text('${menu_mon_1[i]}',
                            style: TextStyle(
                              fontSize: 18,
                            ),),
                      ],
                    );
                  }),
                  Container(
                    width: 100,
                  ),
                  TimerBuilder.periodic(Duration(milliseconds: 100), builder: (context){
                    return Column(
                      children: [
                        Text('중식',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),),
                        Container(
                          height: 15,
                        ),
                        Text('★${menu_mon_2[0]}★',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: menu_font_size,
                          ),),
                        for(int i=1; i<6; i++)
                          Text('${menu_mon_2[i]}',
                            style: TextStyle(
                              fontSize: menu_font_size,
                            ),),
                      ],
                    );
                  }),

                  Container(
                    width: 100,
                  ),

                  TimerBuilder.periodic(Duration(milliseconds: 100), builder: (context){
                    return Column(
                      children: [
                        Text('석식',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),),
                        Container(
                          height: 15,
                        ),
                        Text('★${menu_mon_3[0]}★',
                          style: TextStyle(
                              fontSize: menu_font_size,
                              color: Colors.red
                          ),),
                        for(int i=1; i<6; i++)
                          Text('${menu_mon_3[i]}',
                            style: TextStyle(
                              fontSize: menu_font_size,
                            ),),
                      ],
                    );
                  }),
                  Container(
                    width: 50,
                  ),
                ],
              ),
            ),
            Divider(
              height: 20.0,
              thickness: 1.5,
              color: Colors.grey,
            ),

            // 화요일
            TimerBuilder.periodic(Duration(milliseconds: 100), builder: (context){
              return Text('$Month_tue월 $Day_tue일',
                style: TextStyle(
                  fontSize: 20,
                ),);
            }),
            Text('화요일',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
              ),),
            Container(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    width: 50,
                  ),
                  TimerBuilder.periodic(Duration(milliseconds: 100), builder: (context){
                    return
                      Column(
                        children: [
                          Text('조식',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),),
                          Container(
                            height: 15,
                          ),
                          Text('★${menu_tue_1[0]}★',
                            style: TextStyle(
                                fontSize: menu_font_size,
                                color: Colors.red
                            ),),
                          for(int i=1; i<6; i++)
                            Text('${menu_tue_1[i]}',
                              style: TextStyle(
                                fontSize: menu_font_size,
                              ),),
                        ],
                      );
                  }),
                  Container(
                    width: 100,
                  ),
                  TimerBuilder.periodic(Duration(milliseconds: 100), builder: (context){
                    return Column(
                      children: [
                        Text('중식',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),),
                        Container(
                          height: 15,
                        ),
                        Text('★${menu_tue_2[0]}★',
                          style: TextStyle(
                              fontSize: menu_font_size,
                              color: Colors.red
                          ),),
                        for(int i=1; i<6; i++)
                          Text('${menu_tue_2[i]}',
                            style: TextStyle(
                              fontSize: menu_font_size,
                            ),),
                      ],
                    );
                  }),

                  Container(
                    width: 100,
                  ),

                  TimerBuilder.periodic(Duration(milliseconds: 100), builder: (context){
                    return Column(
                      children: [
                        Text('석식',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),),
                        Container(
                          height: 15,
                        ),Text('★${menu_tue_3[0]}★',
                          style: TextStyle(
                              fontSize: menu_font_size,
                              color: Colors.red
                          ),),
                        for(int i=1; i<6; i++)
                          Text('${menu_tue_3[i]}',
                            style: TextStyle(
                              fontSize: menu_font_size,
                            ),),
                      ],
                    );
                  }),

                  Container(
                    width: 50,
                  ),
                ],
              ),
            ),
            Divider(
              height: 20.0,
              thickness: 1.5,
              color: Colors.grey,
            ),

            //수요일
            TimerBuilder.periodic(Duration(milliseconds: 100), builder: (context){
              return
                Text('$Month_wed월 $Day_wed일',
                  style: TextStyle(
                    fontSize: 20,
                  ),);
            }),

            Text('수요일',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
              ),),
            Container(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    width: 50,
                  ),
                  TimerBuilder.periodic(Duration(milliseconds: 100), builder: (context){
                    return Column(
                      children: [
                        Text('조식',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),),
                        Container(
                          height: 15,
                        ),Text('★${menu_wed_1[0]}★',
                          style: TextStyle(
                              fontSize: menu_font_size,
                              color: Colors.red
                          ),),
                        for(int i=1; i<6; i++)
                          Text('${menu_wed_1[i]}',
                            style: TextStyle(
                              fontSize: menu_font_size,
                            ),),
                      ],
                    );
                  }),

                  Container(
                    width: 100,
                  ),
                  TimerBuilder.periodic(Duration(milliseconds: 100), builder: (context){
                    return
                      Column(
                        children: [
                          Text('중식',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),),
                          Container(
                            height: 15,
                          ),
                          Text('★${menu_wed_2[0]}★',
                            style: TextStyle(
                                fontSize: menu_font_size,
                                color: Colors.red
                            ),),
                          for(int i=1; i<6; i++)
                            Text('${menu_wed_2[i]}',
                              style: TextStyle(
                                fontSize: menu_font_size,
                              ),),
                        ],
                      );
                  }),
                  Container(
                    width: 100,
                  ),
                  TimerBuilder.periodic(Duration(milliseconds: 100), builder: (context){
                    return
                      Column(
                        children: [
                          Text('석식',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),),
                          Container(
                            height: 15,
                          ),Text('★${menu_wed_3[0]}★',
                            style: TextStyle(
                                fontSize: menu_font_size,
                                color: Colors.red
                            ),),
                          for(int i=1; i<6; i++)
                            Text('${menu_wed_3[i]}',
                              style: TextStyle(
                                fontSize: menu_font_size,
                              ),),
                        ],
                      );
                  }),
                  Container(
                    width: 50,
                  ),
                ],
              ),
            ),
            Divider(
              height: 20.0,
              thickness: 1.5,
              color: Colors.grey,
            ),

            //목요일
            TimerBuilder.periodic(Duration(milliseconds: 100), builder: (context){
              return Text('$Month_thu월 $Day_thu일',
                style: TextStyle(
                  fontSize: 20,
                ),);
            }),
            Text('목요일',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
              ),),
            Container(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    width: 50,
                  ),
                  TimerBuilder.periodic(Duration(milliseconds: 100), builder: (context){
                    return Column(
                      children: [
                        Text('조식',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),),
                        Container(
                          height: 15,
                        ),
                        Text('★${menu_thu_1[0]}★',
                          style: TextStyle(
                              fontSize: menu_font_size,
                              color: Colors.red
                          ),),
                        for(int i=1; i<6; i++)
                          Text('${menu_thu_1[i]}',
                            style: TextStyle(
                              fontSize: menu_font_size,
                            ),),
                      ],
                    );
                  }),

                  Container(
                    width: 100,
                  ),
                  TimerBuilder.periodic(Duration(milliseconds: 100), builder: (context){
                    return
                      Column(
                        children: [
                          Text('중식',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),),
                          Container(
                            height: 15,
                          ),
                          Text('★${menu_thu_2[0]}★',
                            style: TextStyle(
                                fontSize: menu_font_size,
                                color: Colors.red
                            ),),
                          for(int i=1; i<6; i++)
                            Text('${menu_thu_2[i]}',
                              style: TextStyle(
                                fontSize: menu_font_size,
                              ),),
                        ],
                      );
                  }),
                  Container(
                    width: 100,
                  ),
                  TimerBuilder.periodic(Duration(milliseconds: 100), builder: (context){
                    return
                      Column(
                        children: [
                          Text('석식',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),),
                          Container(
                            height: 15,
                          ),
                          Text('★${menu_thu_3[0]}★',
                            style: TextStyle(
                                fontSize: menu_font_size,
                                color: Colors.red
                            ),),
                          for(int i=1; i<6; i++)
                            Text('${menu_thu_3[i]}',
                              style: TextStyle(
                                fontSize: menu_font_size,
                              ),),
                        ],
                      );
                  }),
                  Container(
                    width: 50,
                  ),
                ],
              ),
            ),
            Divider(
              height: 20.0,
              thickness: 1.5,
              color: Colors.grey,
            ),

            //금요일
            TimerBuilder.periodic(Duration(milliseconds: 100), builder: (context){
              return Text('$Month_fri월 $Day_fri일',
                style: TextStyle(
                  fontSize: 20,
                ),);
            }),

            Text('금요일',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
              ),),
            Container(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    width: 50,
                  ),
                  TimerBuilder.periodic(Duration(milliseconds: 100), builder: (context){
                    return Column(
                      children: [
                        Text('조식',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),),
                        Container(
                          height: 15,
                        ),
                        Text('★${menu_fri_1[0]}★',
                          style: TextStyle(
                              fontSize: menu_font_size,
                              color: Colors.red
                          ),),
                        for(int i=1; i<6; i++)
                          Text('${menu_fri_1[i]}',
                            style: TextStyle(
                              fontSize: menu_font_size,
                            ),),
                      ],
                    );
                  }),

                  Container(
                    width: 100,
                  ),
                  TimerBuilder.periodic(Duration(milliseconds: 100), builder: (context){
                    return Column(
                      children: [
                        Text('중식',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),),
                        Container(
                          height: 15,
                        ),
                        Text('★${menu_fri_2[0]}★',
                          style: TextStyle(
                              fontSize: menu_font_size,
                              color: Colors.red
                          ),),
                        for(int i=1; i<6; i++)
                          Text('${menu_fri_2[i]}',
                            style: TextStyle(
                              fontSize: menu_font_size,
                            ),),
                      ],
                    );
                  }),

                  Container(
                    width: 100,
                  ),
                  TimerBuilder.periodic(Duration(milliseconds: 100), builder: (context){
                    return Column(
                      children: [
                        Text('석식',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),),
                        Container(
                          height: 15,
                        ),
                        Text('★${menu_fri_3[0]}★',
                          style: TextStyle(
                              fontSize: menu_font_size,
                              color: Colors.red
                          ),),
                        for(int i=1; i<6; i++)
                          Text('${menu_fri_3[i]}',
                            style: TextStyle(
                              fontSize: menu_font_size,
                            ),),
                      ],
                    );
                  }),

                  Container(
                    width: 50,
                  ),
                ],
              ),
            ),
            Divider(
              height: 20.0,
              thickness: 1.5,
              color: Colors.grey,
            ),

            //토요일
            TimerBuilder.periodic(Duration(milliseconds: 100), builder: (context){
              return
                Text('$Month_sat월 $Day_sat일',
                  style: TextStyle(
                    fontSize: 20,
                  ),);
            }),

            Text('토요일',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
              ),),
            Container(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    width: 50,
                  ),
                  TimerBuilder.periodic(Duration(milliseconds: 100), builder: (context){
                    return Column(
                      children: [
                        Text('조식',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),),
                        Container(
                          height: 15,
                        ),
                        Text('★${menu_sat_1[0]}★',
                          style: TextStyle(
                              fontSize: menu_font_size,
                              color: Colors.red
                          ),),
                        for(int i=1; i<6; i++)
                          Text('${menu_sat_1[i]}',
                            style: TextStyle(
                              fontSize: menu_font_size,
                            ),),
                      ],
                    );
                  }),

                  Container(
                    width: 100,
                  ),
                  TimerBuilder.periodic(Duration(milliseconds: 100), builder: (context){
                    return Column(
                      children: [
                        Text('중식',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),),
                        Container(
                          height: 15,
                        ),

                        Text('★${menu_sat_2[0]}★',
                          style: TextStyle(
                              fontSize: menu_font_size,
                              color: Colors.red
                          ),),
                        for(int i=1; i<6; i++)
                          Text('${menu_sat_2[i]}',
                            style: TextStyle(
                              fontSize: menu_font_size,
                            ),),
                      ],
                    );
                  }),

                  Container(
                    width: 100,
                  ),
                  TimerBuilder.periodic(Duration(milliseconds: 100), builder: (context){
                    return Column(
                      children: [
                        Text('석식',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),),
                        Container(
                          height: 15,
                        ),
                        Text('★${menu_sat_3[0]}★',
                          style: TextStyle(
                              fontSize: menu_font_size,
                              color: Colors.red
                          ),),
                        for(int i=1; i<6; i++)
                          Text('${menu_sat_3[i]}',
                            style: TextStyle(
                              fontSize: menu_font_size,
                            ),),
                      ],
                    );
                  }),

                  Container(
                    width: 50,
                  ),
                ],
              ),
            ),
            Divider(
              height: 20.0,
              thickness: 1.5,
              color: Colors.grey,
            ),

            //일요일
            TimerBuilder.periodic(Duration(milliseconds: 100), builder: (context){
              return
                Text('$Month_sun월 $Day_sun일',
                  style: TextStyle(
                    fontSize: 20,
                  ),);
            }),

            Text('일요일',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
              ),),
            Container(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    width: 50,
                  ),
                  TimerBuilder.periodic(Duration(milliseconds: 100), builder: (context){
                    return Column(
                      children: [
                        Text('조식',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),),
                        Container(
                          height: 15,
                        ),
                        Text('★${menu_sun_1[0]}★',
                          style: TextStyle(
                              fontSize: menu_font_size,
                              color: Colors.red
                          ),),
                        for(int i=1; i<6; i++)
                          Text('${menu_sun_1[i]}',
                            style: TextStyle(
                              fontSize: menu_font_size,
                            ),),
                      ],
                    );
                  }),

                  Container(
                    width: 100,
                  ),
                  TimerBuilder.periodic(Duration(milliseconds: 100), builder: (context){
                    return Column(
                      children: [
                        Text('중식',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),),
                        Container(
                          height: 15,
                        ),
                        Text('★${menu_sun_2[0]}★',
                          style: TextStyle(
                              fontSize: menu_font_size,
                              color: Colors.red
                          ),),
                        for(int i=1; i<6; i++)
                          Text('${menu_sun_2[i]}',
                            style: TextStyle(
                              fontSize: menu_font_size,
                            ),),
                      ],
                    );
                  }),
                  Container(
                    width: 100,
                  ),
                  TimerBuilder.periodic(Duration(milliseconds: 100), builder: (context){
                    return Column(
                      children: [
                        Text('석식',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),),
                        Container(
                          height: 15,
                        ),
                        Text('★${menu_sun_3[0]}★',
                          style: TextStyle(
                              fontSize: menu_font_size,
                              color: Colors.red
                          ),),
                        for(int i=1; i<6; i++)
                          Text('${menu_sun_3[i]}',
                            style: TextStyle(
                              fontSize: menu_font_size,
                            ),),
                      ],
                    );
                  }),
                  Container(
                    width: 50,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}