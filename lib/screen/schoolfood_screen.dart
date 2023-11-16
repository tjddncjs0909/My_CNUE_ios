// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';

import '../chatting/chat/message.dart';
import '../chatting/chat/new_message.dart';

class school_food_screen extends StatefulWidget {
  const school_food_screen({Key? key}) : super(key: key);

  @override
  State<school_food_screen> createState() => _school_food_screenState();
}

class _school_food_screenState extends State<school_food_screen> {
  double menu_font_size = 15;

  double menu_fontsize_1 = 20;
  double menu_fontsize_2 = 15;

  int is_sel = 0;

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
  List<String> time_mon = ["time1_mon","time2_mon","time3_mon"];

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
  List<String> time_tue = ["time1_tue","time2_tue","time3_tue"];

  //수요일
  String Month_wed = "";
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
  List<String> time_wed = ["time1_wed","time2_wed","time3_wed"];

  //목요일
  String Month_thu = "";
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
  List<String> time_thu = ["time1_thu","time2_thu","time3_thu"];

  //금요일
  String Month_fri = "";
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
  List<String> time_fri = ["time1_fri","time2_fri","time3_fri"];

  //토요일
  String Month_sat = "";
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
  List<String> time_sat = ["time1_sat","time2_sat","time3_sat"];

  //일요일
  String Month_sun = "";
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
  List<String> time_sun = ["time1_sun","time2_sun","time3_sun"];


  String selected_week = "";
  String selected_month = "";
  String selected_day = "";
  List<String> selected_menu_1 = [
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  List<String> selected_menu_2 = [
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  List<String> selected_menu_3 = [
    "",
    "",
    "",
    "",
    "",
    "",
  ];
  List<String> selected_time = ["selTime1","selTime2","selTime3"];

  final db = FirebaseFirestore.instance;

  Future Refreshing() async {
    isLoading = true;
    print(isLoading);

    await db.collection('1_월요일').doc('1_조식').get().then((DocumentSnapshot ds) {
      Map<String, dynamic> map = ds.data() as Map<String, dynamic>;
      setState(() {
        Month_mon = map['mon'];
        Day_mon = map['day'];
        for (int i = 0; i < 6; i++) {
          menu_mon_1[i] = map['$i'];
        }
        time_mon[0] = map['time'];
      });
    });
    await db.collection('1_월요일').doc('2_중식').get().then((DocumentSnapshot ds) {
      Map<String, dynamic> map = ds.data() as Map<String, dynamic>;
      setState(() {
        for (int i = 0; i < 6; i++) {
          menu_mon_2[i] = map['$i'];
        }
        time_mon[1] = map['time'];
      });
    });
    await db.collection('1_월요일').doc('3_석식').get().then((DocumentSnapshot ds) {
      Map<String, dynamic> map = ds.data() as Map<String, dynamic>;
      setState(() {
        for (int i = 0; i < 6; i++) {
          menu_mon_3[i] = map['$i'];
        }
        time_mon[2] = map['time'];
      });
    });

    await db.collection('2_화요일').doc('1_조식').get().then((DocumentSnapshot ds) {
      Map<String, dynamic> map = ds.data() as Map<String, dynamic>;

      for (int i = 0; i < 6; i++) {
        menu_tue_1[i] = map['$i'];
      }
      time_tue[0] = map['time'];
      Month_tue = map['mon'];
      Day_tue = map['day'];
    });
    await db.collection('2_화요일').doc('2_중식').get().then((DocumentSnapshot ds) {
      Map<String, dynamic> map = ds.data() as Map<String, dynamic>;
      for (int i = 0; i < 6; i++) {
        menu_tue_2[i] = map['$i'];
      }
      time_tue[1] = map['time'];
    });
    await db.collection('2_화요일').doc('3_석식').get().then((DocumentSnapshot ds) {
      Map<String, dynamic> map = ds.data() as Map<String, dynamic>;

      for (int i = 0; i < 6; i++) {
        menu_tue_3[i] = map['$i'];
      }
      time_tue[2] = map['time'];
    });

    await db.collection('3_수요일').doc('1_조식').get().then((DocumentSnapshot ds) {
      Map<String, dynamic> map = ds.data() as Map<String, dynamic>;

      for (int i = 0; i < 6; i++) {
        menu_wed_1[i] = map['$i'];
      }
      time_wed[0] = map['time'];
      Month_wed = map['mon'];
      Day_wed = map['day'];
    });
    await db.collection('3_수요일').doc('2_중식').get().then((DocumentSnapshot ds) {
      Map<String, dynamic> map = ds.data() as Map<String, dynamic>;

      for (int i = 0; i < 6; i++) {
        menu_wed_2[i] = map['$i'];
      }
      time_wed[1] = map['time'];
    });
    await db.collection('3_수요일').doc('3_석식').get().then((DocumentSnapshot ds) {
      Map<String, dynamic> map = ds.data() as Map<String, dynamic>;

      for (int i = 0; i < 6; i++) {
        menu_wed_3[i] = map['$i'];
      }
      time_wed[2] = map['time'];
    });

    await db.collection('4_목요일').doc('1_조식').get().then((DocumentSnapshot ds) {
      Map<String, dynamic> map = ds.data() as Map<String, dynamic>;

      for (int i = 0; i < 6; i++) {
        menu_thu_1[i] = map['$i'];
      }
      time_thu[0] = map['time'];
      Month_thu = map['mon'];
      Day_thu = map['day'];
    });
    await db.collection('4_목요일').doc('2_중식').get().then((DocumentSnapshot ds) {
      Map<String, dynamic> map = ds.data() as Map<String, dynamic>;

      for (int i = 0; i < 6; i++) {
        menu_thu_2[i] = map['$i'];
      }
      time_thu[1] = map['time'];
    });
    await db.collection('4_목요일').doc('3_석식').get().then((DocumentSnapshot ds) {
      Map<String, dynamic> map = ds.data() as Map<String, dynamic>;

      for (int i = 0; i < 6; i++) {
        menu_thu_3[i] = map['$i'];
      }
      time_thu[2] = map['time'];
    });

    await db.collection('5_금요일').doc('1_조식').get().then((DocumentSnapshot ds) {
      Map<String, dynamic> map = ds.data() as Map<String, dynamic>;

      for (int i = 0; i < 6; i++) {
        menu_fri_1[i] = map['$i'];
      }
      time_fri[0] = map['time'];
      Month_fri = map['mon'];
      Day_fri = map['day'];
    });
    await db.collection('5_금요일').doc('2_중식').get().then((DocumentSnapshot ds) {
      Map<String, dynamic> map = ds.data() as Map<String, dynamic>;

      setState(() {
        for (int i = 0; i < 6; i++) {
          menu_fri_2[i] = map['$i'];
        }
        time_fri[1] = map['time'];
      });
    });
    await db.collection('5_금요일').doc('3_석식').get().then((DocumentSnapshot ds) {
      Map<String, dynamic> map = ds.data() as Map<String, dynamic>;

      setState(() {
        for (int i = 0; i < 6; i++) {
          menu_fri_3[i] = map['$i'];
        }
        time_fri[2] = map['time'];
      });
    });

    await db.collection('6_토요일').doc('1_조식').get().then((DocumentSnapshot ds) {
      Map<String, dynamic> map = ds.data() as Map<String, dynamic>;

      setState(() {
        for (int i = 0; i < 6; i++) {
          menu_sat_1[i] = map['$i'];
        }
        time_sat[0] = map['time'];
        Month_sat = map['mon'];
        Day_sat = map['day'];
      });
    });
    await db.collection('6_토요일').doc('2_중식').get().then((DocumentSnapshot ds) {
      Map<String, dynamic> map = ds.data() as Map<String, dynamic>;

      setState(() {
        for (int i = 0; i < 6; i++) {
          menu_sat_2[i] = map['$i'];
        }
        time_sat[1] = map['time'];
      });
    });
    await db.collection('6_토요일').doc('3_석식').get().then((DocumentSnapshot ds) {
      Map<String, dynamic> map = ds.data() as Map<String, dynamic>;

      setState(() {
        for (int i = 0; i < 6; i++) {
          menu_sat_3[i] = map['$i'];
        }
        time_sat[2] = map['time'];
      });
    });

    await db.collection('7_일요일').doc('1_조식').get().then((DocumentSnapshot ds) {
      Map<String, dynamic> map = ds.data() as Map<String, dynamic>;

      setState(() {
        for (int i = 0; i < 6; i++) {
          menu_sun_1[i] = map['$i'];
        }
        time_sun[0] = map['time'];
        Month_sun = map['mon'];
        Day_sun = map['day'];
        selected_month = Month_sun;
      });
    });
    await db.collection('7_일요일').doc('2_중식').get().then((DocumentSnapshot ds) {
      Map<String, dynamic> map = ds.data() as Map<String, dynamic>;

      setState(() {
        for (int i = 0; i < 6; i++) {
          menu_sun_2[i] = map['$i'];
        }
        time_sun[1] = map['time'];
      });
    });
    await db.collection('7_일요일').doc('3_석식').get().then((DocumentSnapshot ds) {
      Map<String, dynamic> map = ds.data() as Map<String, dynamic>;

      setState(() {
        for (int i = 0; i < 6; i++) {
          menu_sun_3[i] = map['$i'];
        }
        time_sun[2] = map['time'];
        isLoading = false;
      });
    });

    if (daysFormat.format(now1) == '월요일') {
      setState(() {
        selected_week = '월요일';
        selected_month = Month_mon;
        selected_day = Day_mon;
        for(int i=0; i<3; i++){
          selected_time[i] = time_mon[i];
        }
        for (int i = 0; i < 6; i++) {
          selected_menu_1[i] = menu_mon_1[i];
          selected_menu_2[i] = menu_mon_2[i];
          selected_menu_3[i] = menu_mon_3[i];
        }
        is_sel = 2;
      });
    }
    else if (daysFormat.format(now1) == '화요일') {
      setState(() {
        selected_week = '화요일';
        selected_month = Month_tue;
        selected_day = Day_tue;
        for (int i = 0; i < 6; i++) {
          selected_menu_1[i] = menu_tue_1[i];
          selected_menu_2[i] = menu_tue_2[i];
          selected_menu_3[i] = menu_tue_3[i];
        }
        for(int i=0; i<3; i++){
          selected_time[i] = time_tue[i];
        }
        is_sel = 3;
      });
    }
    else if (daysFormat.format(now1) == '수요일') {
      setState(() {
        selected_week = '수요일';
        selected_month = Month_wed;
        selected_day = Day_wed;
        for (int i = 0; i < 6; i++) {
          selected_menu_1[i] = menu_wed_1[i];
          selected_menu_2[i] = menu_wed_2[i];
          selected_menu_3[i] = menu_wed_3[i];
        }
        for(int i=0; i<3; i++){
          selected_time[i] = time_wed[i];
        }
        is_sel = 4;
      });
    }
    else if (daysFormat.format(now1) == '목요일') {
      setState(() {
        selected_week = '목요일';
        selected_month = Month_thu;
        selected_day = Day_thu;
        for (int i = 0; i < 6; i++) {
          selected_menu_1[i] = menu_thu_1[i];
          selected_menu_2[i] = menu_thu_2[i];
          selected_menu_3[i] = menu_thu_3[i];
        }
        for(int i=0; i<3; i++){
          selected_time[i] = time_thu[i];
        }
        is_sel = 5;
      });
    }
    else if (daysFormat.format(now1) == '금요일') {
      setState(() {
        selected_week = '금요일';
        selected_month = Month_fri;
        selected_day = Day_fri;
        for (int i = 0; i < 6; i++) {
          selected_menu_1[i] = menu_fri_1[i];
          selected_menu_2[i] = menu_fri_2[i];
          selected_menu_3[i] = menu_fri_3[i];
        }
        for(int i=0; i<3; i++){
          selected_time[i] = time_fri[i];
        }
        is_sel = 6;
      });
    }
    else if (daysFormat.format(now1) == '토요일') {
      setState(() {
        selected_week = '토요일';
        selected_month = Month_sat;
        selected_day = Day_sat;
        for (int i = 0; i < 6; i++) {
          selected_menu_1[i] = menu_sat_1[i];
          selected_menu_2[i] = menu_sat_2[i];
          selected_menu_3[i] = menu_sat_3[i];
        }
        for(int i=0; i<3; i++){
          selected_time[i] = time_sat[i];
        }
        is_sel = 7;
      });
    }
    else if (daysFormat.format(now1) == '일요일') {
      setState(() {
        selected_week = '일요일';
        selected_month = Month_sun;
        selected_day = Day_sun;
        for (int i = 0; i < 6; i++) {
          selected_menu_1[i] = menu_sun_1[i];
          selected_menu_2[i] = menu_sun_2[i];
          selected_menu_3[i] = menu_sun_3[i];
        }
        for(int i=0; i<3; i++){
          selected_time[i] = time_sun[i];
        }
        is_sel = 1;
      });
    }
    print(isLoading);

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
      } else {
        is_logined = false;
      }
    } catch (e) {
      print(e);
    }
  }

  late DateFormat daysFormat;

  var now1 = DateTime.now();

  String getSystemTime() {
    var now = DateTime.now();
    return DateFormat("HH:mm:ss").format(now);
  }

  void showToast() {
    Fluttertoast.showToast(
      msg: "메뉴가 업데이트 되었습니다.",
      gravity: ToastGravity.BOTTOM,
      fontSize: 13,
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: Colors.black,
      textColor: Colors.white70,
    );
  }

  bool isLoading = false;
  bool isdayoff = true;

  @override
  void initState() {
    super.initState();
    // time calling
    initializeDateFormatting();
    daysFormat = DateFormat.EEEE('ko');

    // calling menu information
    getCurrentUser();
    Refreshing();
    print(isdayoff);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'MY CNUE',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0.0,
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  Refreshing();
                });
              },
              icon: Icon(Icons.refresh),
              color: Colors.black,
            ),
          ]),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '오늘의 학식',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Divider(
              height: 20.0,
              thickness: 1.5,
              color: Colors.grey,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                GestureDetector(
                  onTap: () {
                    setState(() {
                      is_sel = 2;
                      for (int i = 0; i < 6; i++) {
                        selected_menu_1[i] = menu_mon_1[i];
                        selected_menu_2[i] = menu_mon_2[i];
                        selected_menu_3[i] = menu_mon_3[i];
                      }
                      selected_week = "월요일";
                      selected_month = Month_mon;
                      selected_day = Day_mon;
                      for(int i=0; i<3; i++){
                        selected_time[i] = time_mon[i];
                      }
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                    child: Text(
                      "Mon",
                      style: TextStyle(fontSize: 25, color: Colors.black),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: is_sel == 2
                            ? Border.all(color: Colors.amber, width: 3)
                            : null),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      is_sel = 3;
                      for (int i = 0; i < 6; i++) {
                        selected_menu_1[i] = menu_tue_1[i];
                        selected_menu_2[i] = menu_tue_2[i];
                        selected_menu_3[i] = menu_tue_3[i];
                      }
                      selected_week = "화요일";
                      selected_month = Month_tue;
                      selected_day = Day_tue;
                      for(int i=0; i<3; i++){
                        selected_time[i] = time_tue[i];
                      }
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                    child: Text(
                      "Tue",
                      style: TextStyle(fontSize: 25, color: Colors.black),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: is_sel == 3
                            ? Border.all(color: Colors.amber, width: 3)
                            : null),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      is_sel = 4;
                      for (int i = 0; i < 6; i++) {
                        selected_menu_1[i] = menu_wed_1[i];
                        selected_menu_2[i] = menu_wed_2[i];
                        selected_menu_3[i] = menu_wed_3[i];
                      }
                      selected_week = "수요일";
                      selected_month = Month_wed;
                      selected_day = Day_wed;
                      for(int i=0; i<3; i++){
                        selected_time[i] = time_wed[i];
                      }
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                    child: Text(
                      "Wed",
                      style: TextStyle(fontSize: 25, color: Colors.black),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: is_sel == 4
                            ? Border.all(color: Colors.amber, width: 3)
                            : null),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      is_sel = 5;
                      for (int i = 0; i < 6; i++) {
                        selected_menu_1[i] = menu_thu_1[i];
                        selected_menu_2[i] = menu_thu_2[i];
                        selected_menu_3[i] = menu_thu_3[i];
                      }
                      selected_week = "목요일";
                      selected_month = Month_thu;
                      selected_day = Day_thu;
                      for(int i=0; i<3; i++){
                        selected_time[i] = time_thu[i];
                      }
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                    child: Text(
                      "Thu",
                      style: TextStyle(fontSize: 25, color: Colors.black),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: is_sel == 5
                            ? Border.all(color: Colors.amber, width: 3)
                            : null),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      is_sel = 6;
                      for (int i = 0; i < 6; i++) {
                        selected_menu_1[i] = menu_fri_1[i];
                        selected_menu_2[i] = menu_fri_2[i];
                        selected_menu_3[i] = menu_fri_3[i];
                      }
                      selected_week = "금요일";
                      selected_month = Month_fri;
                      selected_day = Day_fri;
                      for(int i=0; i<3; i++){
                        selected_time[i] = time_fri[i];
                      }
                      print(selected_week);
                      print(is_sel);
                      print(selected_day);
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                    child: Text(
                      "Fri",
                      style: TextStyle(fontSize: 25, color: Colors.black),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: is_sel == 6
                            ? Border.all(color: Colors.amber, width: 3)
                            : null),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      is_sel = 7;
                      for (int i = 0; i < 6; i++) {
                        selected_menu_1[i] = menu_sat_1[i];
                        selected_menu_2[i] = menu_sat_2[i];
                        selected_menu_3[i] = menu_sat_3[i];
                      }
                      selected_week = "토요일";
                      selected_month = Month_sat;
                      selected_day = Day_sat;
                      for(int i=0; i<3; i++){
                        selected_time[i] = time_sat[i];
                      }
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                    child: Text(
                      "Sat",
                      style: TextStyle(fontSize: 25, color: Colors.blue),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: is_sel == 7
                            ? Border.all(color: Colors.amber, width: 3)
                            : null),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      is_sel = 1;
                      for (int i = 0; i < 6; i++) {
                        selected_menu_1[i] = menu_sun_1[i];
                        selected_menu_2[i] = menu_sun_2[i];
                        selected_menu_3[i] = menu_sun_3[i];
                      }
                      selected_week = "일요일";
                      selected_month = Month_sun;
                      selected_day = Day_sun;
                      for(int i=0; i<3; i++){
                        selected_time[i] = time_sun[i];
                      }
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                    child: Text(
                      "Sun",
                      style: TextStyle(fontSize: 25, color: Colors.red),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: is_sel == 1
                            ? Border.all(color: Colors.amber, width: 3)
                            : null),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            TimerBuilder.periodic(Duration(seconds: 1), builder: (context) {
              return Container(
                height: isLoading == true? 300 : null,
                child: isLoading == true
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Column(
                        children: [
                          Center(
                            child: Text(
                              "$selected_month월 $selected_day일 ($selected_week)",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ),
                          Scrollbar(
                            child: SingleChildScrollView(
                              child: Row(
                                children: [
                                  Container(
                                      margin: EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "[조식]",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Colors.indigo),
                                          ),
                                          Text(selected_time[0],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                                color: Colors.indigo),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          for (int i = 0; i < 6; i++)
                                            Text(
                                              selected_menu_1[i],
                                              style: TextStyle(fontSize: 18),
                                            ),
                                        ],
                                      )),
                                  Container(
                                      margin: EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "[중식]",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Colors.deepOrange),
                                          ),
                                          Text(selected_time[1],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                                color: Colors.deepOrange),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          for (int i = 0; i < 6; i++)
                                            Text(
                                              selected_menu_2[i],
                                              style: TextStyle(fontSize: 18),
                                            ),
                                        ],
                                      )),
                                  Container(
                                      margin: EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "[석식]",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Colors.deepPurple),
                                          ),
                                          Text(selected_time[2],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                                color: Colors.deepPurple),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          for (int i = 0; i < 6; i++)
                                            Text(
                                              selected_menu_3[i],
                                              style: TextStyle(fontSize: 18),
                                            ),
                                        ],
                                      )),
                                ],
                              ),
                              scrollDirection: Axis.horizontal,
                            ),
                          )
                        ],
                      ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.all(10),
              );
            }),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '후기를 남겨보세요!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
            Text(
              '- 맛 평가',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
            Text(
              '- 재료 소진 상황 ',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 350,
              height: 500,
              child: is_logined == true
                  ? isLoading == false
                      ? Column(
                          children: [
                            Expanded(
                              child: Messages(
                                chat_collection: "학식챗",
                              ),
                            ),
                            NewMessage(
                              chat_collection: "학식챗",
                            )
                          ],
                        )
                      : Center(
                          child: CircularProgressIndicator(),
                        )
                  : Center(
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("채팅 기능을 이용하기 위해서는"),
                        Text("로그인 해주시기 바랍니다."),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("메인 화면"))
                      ],
                    )),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}
