// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:my_cnue/model/palette.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({Key? key}) : super(key: key);

  @override
  _LoginSignupScreenState createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  final _authentication = FirebaseAuth.instance;

  User? user;

  bool is_school_mail = true;

  bool isSignupScreen = true;
  bool showSpinner = false;

  final _formKey = GlobalKey<FormState>();

  String userName = '';
  String userEmail = '';
  String userPassword = '';

  void _tryValidation() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Stack(
            children: [
              // 배경
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                child: Container(
                  height: 300,
                  decoration: BoxDecoration(color: Colors.blue[300]),
                  child: Container(
                    padding: EdgeInsets.only(top: 90, left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Welcome',
                            style: TextStyle(
                                letterSpacing: 1.0,
                                fontSize: 25,
                                color: Colors.white),
                            children: [
                              TextSpan(
                                text: isSignupScreen
                                    ? ' to MY CNUE!'
                                    : ' to MY CNUE',
                                style: TextStyle(
                                  letterSpacing: 1.0,
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          isSignupScreen ? '계속하려면 회원가입하세요' : '계속하려면 로그인하세요',
                          style: TextStyle(
                            letterSpacing: 1.0,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Ver 2.1.2',
                          style: TextStyle(
                            letterSpacing: 1.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // 텍스트 폼 필드
              AnimatedPositioned(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeIn,
                top: 180,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                  padding: EdgeInsets.all(20.0),
                  height: isSignupScreen ? 280.0 : 250.0,
                  width: MediaQuery.of(context).size.width - 40,
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 15,
                          spreadRadius: 5),
                    ],
                  ),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSignupScreen = false;
                                });
                              },
                              child: Column(
                                children: [
                                  Text(
                                    '로그인',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: !isSignupScreen
                                            ? Palette.activeColor
                                            : Palette.textColor1),
                                  ),
                                  if (!isSignupScreen)
                                    Container(
                                      margin: EdgeInsets.only(top: 3),
                                      height: 2,
                                      width: 55,
                                      color: Colors.orange,
                                    )
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSignupScreen = true;
                                });
                              },
                              child: Column(
                                children: [
                                  Text(
                                    'ID 만들기',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: isSignupScreen
                                            ? Palette.activeColor
                                            : Palette.textColor1),
                                  ),
                                  if (isSignupScreen)
                                    Container(
                                      margin: EdgeInsets.only(top: 3),
                                      height: 2,
                                      width: 55,
                                      color: Colors.orange,
                                    )
                                ],
                              ),
                            )
                          ],
                        ),
                        if (isSignupScreen)
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    key: ValueKey(1),
                                    validator: (value) {
                                      if (value!.isEmpty || value.length < 2) {
                                        return '적어도 2자 이상을 입력해주세요';
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      userName = value!;
                                    },
                                    onChanged: (value) {
                                      userName = value;
                                    },
                                    decoration: InputDecoration(
                                        prefixIcon: const Icon(
                                          Icons.account_circle,
                                          color: Palette.iconColor,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Palette.textColor1),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(35.0),
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Palette.textColor1),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(35.0),
                                          ),
                                        ),
                                        hintText: '닉네임 (채팅 사용 시, 표시 됨)',
                                        hintStyle: TextStyle(
                                            fontSize: 14,
                                            color: Palette.textColor1),
                                        contentPadding: EdgeInsets.all(10)),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    key: ValueKey(2),
                                    validator: (value) {
                                      if (value!.isEmpty ||
                                          !value.contains('@cnue.ac.kr')) {
                                        if (value.isEmpty ||
                                            !value.contains(
                                                '@student.cnue.ac.kr')) {
                                          setState(() {
                                            is_school_mail = false;
                                          });
                                          return '올바른 이메일 형식이 아닙니다.';
                                        }
                                      } else {
                                        setState(() {
                                          is_school_mail = true;
                                        });
                                      }
                                    },
                                    onSaved: (value) {
                                      userEmail = value!;
                                    },
                                    onChanged: (value) {
                                      userEmail = value;
                                    },
                                    decoration: InputDecoration(
                                        prefixIcon: const Icon(
                                          Icons.email,
                                          color: Palette.iconColor,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Palette.textColor1),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(35.0),
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Palette.textColor1),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(35.0),
                                          ),
                                        ),
                                        hintText: '(학번)@student.cnue.ac.kr',
                                        hintStyle: TextStyle(
                                            fontSize: 14,
                                            color: Palette.textColor1),
                                        contentPadding: EdgeInsets.all(10)),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  TextFormField(
                                    obscureText: true,
                                    key: ValueKey(3),
                                    validator: (value) {
                                      if (value!.isEmpty || value.length < 7) {
                                        return '비밀번호는 적어도 7자 이상이어야 합니다.';
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      userPassword = value!;
                                    },
                                    onChanged: (value) {
                                      userPassword = value;
                                    },
                                    decoration: InputDecoration(
                                        prefixIcon: const Icon(
                                          Icons.lock,
                                          color: Palette.iconColor,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Palette.textColor1),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(35.0),
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Palette.textColor1),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(35.0),
                                          ),
                                        ),
                                        hintText: '비밀번호',
                                        hintStyle: TextStyle(
                                            fontSize: 14,
                                            color: Palette.textColor1),
                                        contentPadding: EdgeInsets.all(10)),
                                  )
                                ],
                              ),
                            ),
                          ),
                        if (!isSignupScreen)
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    key: ValueKey(4),
                                    validator: (value) {
                                      if (value!.isEmpty ||
                                          !value.contains('@cnue.ac.kr')) {
                                        if (value.isEmpty ||
                                            !value.contains(
                                                '@student.cnue.ac.kr')) {
                                          setState(() {
                                            is_school_mail = false;
                                          });
                                          return '올바른 이메일 형식이 아닙니다.';
                                        }
                                      } else {
                                        setState(() {
                                          is_school_mail = true;
                                        });
                                      }
                                    },
                                    onSaved: (value) {
                                      userEmail = value!;
                                    },
                                    onChanged: (value) {
                                      userEmail = value;
                                    },
                                    decoration: InputDecoration(
                                        prefixIcon: const Icon(
                                          Icons.email,
                                          color: Palette.iconColor,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Palette.textColor1),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(35.0),
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Palette.textColor1),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(35.0),
                                          ),
                                        ),
                                        hintText: '(학번)@student.cnue.ac.kr',
                                        hintStyle: TextStyle(
                                            fontSize: 14,
                                            color: Palette.textColor1),
                                        contentPadding: EdgeInsets.all(10)),
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  TextFormField(
                                    obscureText: true,
                                    key: ValueKey(5),
                                    validator: (value) {
                                      if (value!.isEmpty || value.length < 7) {
                                        return 'Password must be at least 7 characters long.';
                                      }
                                      return null;
                                    },
                                    onSaved: (value) {
                                      userPassword = value!;
                                    },
                                    onChanged: (value) {
                                      userPassword = value;
                                    },
                                    decoration: InputDecoration(
                                        prefixIcon: const Icon(
                                          Icons.lock,
                                          color: Palette.iconColor,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Palette.textColor1),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(35.0),
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Palette.textColor1),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(35.0),
                                          ),
                                        ),
                                        hintText: '비밀번호',
                                        hintStyle: TextStyle(
                                            fontSize: 14,
                                            color: Palette.textColor1),
                                        contentPadding: EdgeInsets.all(10)),
                                  )
                                ],
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                ),
              ),

              // 전송 버튼
              AnimatedPositioned(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeIn,
                top: isSignupScreen ? 420 : 370,
                right: 0,
                left: 0,
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)),
                    child: GestureDetector(
                      onTap: () async {
                        setState(() {
                          showSpinner = true;
                        });
                        // 회원가입
                        if (isSignupScreen) {
                          _tryValidation();
                          if (is_school_mail == true) {
                            try {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                        title: Text('이용약관'),
                                        content: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 30,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceBetween,
                                              children: [
                                                Text("개인정보 처리방침"),
                                                IconButton(
                                                    onPressed: () {
                                                      launchUrl(Uri.parse(
                                                          'https://blog.naver.com/tjddncjs0909/223023284986'),
                                                          mode: LaunchMode.externalApplication);
                                                    },
                                                    icon: Icon(
                                                        Icons.arrow_forward)),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 30,
                                            ),
                                            Text("채팅 사용 규정 안내"),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                                "- 채팅 사용을 비롯한 모든 일체의 행위는 ID 생성 시 "
                                                    "설정한 닉네임 사용을 통해 타인으로부터 익명이 보장됩니다."),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                                "- 관리자의 판단, 누적된 신고에 의한 부적절한 채팅은 즉시 삭제되며,"
                                                    " 3회 이상 적발 시 계정 이용이 제한됩니다."),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "- 사용자가 작성한 메세지는 스스로 삭제가 불가능합니다."
                                                  " 메세지 작성 시, 이를 고려하여 이용하시기 바랍니다.",
                                              style: TextStyle(
                                                  color: Colors.red),
                                            ),
                                          ],
                                        ),
                                        actions: [
                                          ElevatedButton(
                                              onPressed: () async{
                                                try{
                                                  final newUser = await _authentication
                                                      .createUserWithEmailAndPassword(
                                                    email: userEmail,
                                                    password: userPassword,
                                                  );

                                                  user = newUser.user!;

                                                  await FirebaseFirestore.instance
                                                      .collection('user')
                                                      .doc(userEmail)
                                                      .set({
                                                    'userName': userName,
                                                    'email': userEmail
                                                  });

                                                  // 이메일 인증 x
                                                  if (user != null &&
                                                      user!.emailVerified == false) {
                                                    _authentication.currentUser!
                                                        .sendEmailVerification();
                                                    Navigator.of(context).pop();
                                                    showDialog(
                                                      context: context,
                                                      builder: (BuildContext
                                                      context) =>
                                                          AlertDialog(
                                                            title: Text('이용약관'),
                                                            content: Column(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                              children: [
                                                                SizedBox(
                                                                  height: 30,
                                                                ),
                                                                Column(
                                                                  crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                                  children: [
                                                                    Text(
                                                                        "인증 메일이 ${userEmail}로 발송되었습니다."),
                                                                    Text(
                                                                        "메일 속 링크를 클릭하여 인증 과정을 완료 후, 로그인 해주십시오"),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                            actions: [
                                                              ElevatedButton(
                                                                  onPressed: () {
                                                                    Navigator.of(
                                                                        context)
                                                                        .pop();
                                                                  },
                                                                  child: Text('닫기')),
                                                            ],
                                                            elevation: 10.0,
                                                            shape:
                                                            RoundedRectangleBorder(
                                                              borderRadius:
                                                              BorderRadius.all(
                                                                  Radius.circular(
                                                                      32)),
                                                            ),
                                                          ),
                                                    );
                                                  }

                                                } on FirebaseAuthException catch(e){
                                                  print(e);
                                                  if (e.code == 'email-already-in-use') {
                                                    Navigator.of(context).pop();
                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                      SnackBar(
                                                        content: Text('이미 가입된 메일입니다.'),
                                                        backgroundColor: Colors.blue,
                                                      ),
                                                    );
                                                  }
                                                }
                                              },
                                              child: Text('인증 메일 발송')),
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(
                                                    context)
                                                    .pop();
                                              },
                                              child: Text('정보 수정')),
                                        ],
                                        elevation: 10.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(32)),
                                        ),
                                      ));
                            } on FirebaseAuthException catch (e) {
                              print(e);
                              if (e.code == 'email-already-in-use') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('이미 가입된 메일입니다.'),
                                    backgroundColor: Colors.blue,
                                  ),
                                );
                              }
                            }
                          }
                          setState(() {
                            showSpinner = false;
                            is_school_mail = true;
                          });
                        }
                        // 로그인 화면
                        if (!isSignupScreen) {
                          _tryValidation();

                          if (is_school_mail == true) {
                            try {
                              final newUser = await _authentication
                                  .signInWithEmailAndPassword(
                                email: userEmail,
                                password: userPassword,
                              );
                              if (newUser.user != null &&
                                  newUser.user!.emailVerified == true &&
                                  is_school_mail == true) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('로그인에 성공하였습니다.'),
                                    backgroundColor: Colors.blue,
                                  ),
                                );
                                print('success');
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                          title: Text('이용약관'),
                                          content: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("로그인에 성공하였습니다.",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 25,
                                                color: Colors.red
                                              ),),
                                              SizedBox(
                                                height: 30,
                                              ),
                                              Text("첫 로그인시, 화면 전환이 안될 수 있습니다. 다른 탭을 누르거나,"
                                                  " 앱을 재시작하면 정상적으로 작동합니다."),
                                              SizedBox(
                                                height: 30,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("개인정보 처리방침"),
                                                  IconButton(
                                                      onPressed: () {
                                                        launchUrl(Uri.parse(
                                                            'https://blog.naver.com/tjddncjs0909/223023284986',),
                                                        mode: LaunchMode.externalApplication);
                                                      },
                                                      icon: Icon(
                                                          Icons.arrow_forward)),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 30,
                                              ),
                                              Text("채팅 사용 규정 안내"),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                  "- 채팅 사용을 비롯한 모든 일체의 행위는 ID 생성 시 "
                                                  "설정한 닉네임 사용을 통해 타인으로부터 익명이 보장됩니다."),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                  "- 관리자의 판단, 누적된 신고에 의한 부적절한 채팅은 즉시 삭제되며,"
                                                  " 3회 이상 적발 시 계정 이용이 제한됩니다."),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                "- 사용자가 작성한 메세지는 스스로 삭제가 불가능합니다."
                                                " 메세지 작성 시, 이를 고려하여 이용하시기 바랍니다.",
                                                style: TextStyle(
                                                    color: Colors.red),
                                              ),
                                            ],
                                          ),
                                          actions: [
                                            ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text('나가기')),
                                          ],
                                          elevation: 10.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(32)),
                                          ),
                                        ));
                              } else if (newUser.user != null &&
                                  newUser.user!.emailVerified == false &&
                                  is_school_mail == true) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    duration: Duration(milliseconds: 1200),
                                    content: Column(
                                      children: [
                                        Text('이메일 인증을 완료해주십시오.'),
                                        TextButton(
                                            onPressed: () {
                                              _authentication.currentUser!
                                                  .sendEmailVerification();
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                content:
                                                    Text("인증메일을 재전송하였습니다."),
                                                duration: Duration(
                                                    milliseconds: 1500),
                                                backgroundColor:
                                                    Colors.blueAccent,
                                              ));
                                            },
                                            child: Text(
                                              "인증 메일을 재전송하려면 여기를 클릭하십시오",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ))
                                      ],
                                    ),
                                    backgroundColor: Colors.blue,
                                  ),
                                );
                                print('success');
                              }
                            } on FirebaseAuthException catch (e) {
                              print(e);
                              if (e.code == 'email-already-in-use') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('이미 가입된 메일입니다.'),
                                    backgroundColor: Colors.blue,
                                  ),
                                );
                              } else if (e.code == 'user-not-found') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('생성되지 않은 메일입니다.'),
                                    backgroundColor: Colors.blue,
                                  ),
                                );
                              } else if (e.code == 'wrong-password') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('유효하지 않은 비밀번호입니다.'),
                                    backgroundColor: Colors.blue,
                                  ),
                                );
                              }
                            }
                          }
                          setState(() {
                            showSpinner = false;
                            is_school_mail = true;
                          });
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.blueAccent, Colors.purple],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: Offset(0, 1),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // 하단 설명
              Positioned(
                  top: isSignupScreen ? 490 : 460,
                  left: 30,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (isSignupScreen == true)
                        Column(
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "FAQ",
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0)),
                                                    title: Text(
                                                      'FAQ',
                                                      style: TextStyle(
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    content:
                                                        SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          SizedBox(
                                                            height: 20,
                                                          ),
                                                          Text(
                                                            "Q1. 왜 학교 이메일을 사용하나요?",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Text(
                                                              "A1. 재학생 인증을 위한 방법으로"),
                                                          Text(
                                                              "웹 메일 인증이 보편적이고 편리하기 때문입니다."),
                                                          SizedBox(
                                                            height: 20,
                                                          ),
                                                          Text(
                                                            "Q2. 로그인 하지 않고도 사용 가능한가요?",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 15),
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Text(
                                                            "A2. 네, 물론 가능합니다.",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .redAccent,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Text(
                                                              "다만, 로그인 사용자에게 제공되는 공지사항 북마크 기능,"),
                                                          Text(
                                                              "채팅 기능의 사용에 제한이 생길 수 있습니다."),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Text(
                                                            "Q3. ID 생성과정은 어떻게 이루어지나요?",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Text(
                                                              "A3. 정보 입력 후 전송 버튼 누르기 "),
                                                          Text(
                                                              "-> 발송된 인증 메일 속 링크 클릭 "),
                                                          Text("-> 인증 완료 "),
                                                          Text("-> 로그인 "),
                                                        ],
                                                      ),
                                                    ),
                                                    actions: <Widget>[
                                                      TextButton(
                                                        child: Text("닫기"),
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                      ),
                                                    ],
                                                  );
                                                });
                                          },
                                          icon: const Icon(
                                            Icons.forward_rounded,
                                            size: 40,
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      else
                        Column(
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "문의",
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
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
                                            tapTargetSize: MaterialTapTargetSize
                                                .shrinkWrap,
                                          ),
                                          onPressed: () {
                                            final url = Uri(
                                              scheme: 'mailto',
                                              path: 'tjddncjs0909@naver.com',
                                              query: 'subject=Hello&body=Test',
                                            );
                                            launchUrl(url,
                                                mode: LaunchMode
                                                    .externalApplication);
                                          },
                                          child:
                                              Text("tjddncjs0909@naver.com")),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('Email 2 : '),
                                      TextButton(
                                          style: TextButton.styleFrom(
                                            minimumSize: Size.zero,
                                            padding: EdgeInsets.zero,
                                            tapTargetSize: MaterialTapTargetSize
                                                .shrinkWrap,
                                          ),
                                          onPressed: () {
                                            final url = Uri(
                                              scheme: 'mailto',
                                              path:
                                                  '20221127@student.cnue.ac.kr',
                                              query: 'subject=Hello&body=Test',
                                            );
                                            launchUrl(url,
                                                mode: LaunchMode
                                                    .externalApplication);
                                          },
                                          child: Text(
                                              "20221127@student.cnue.ac.kr")),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '개발진',
                                        style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0)),
                                                    title: Text(
                                                      '개발진',
                                                      style: TextStyle(
                                                        fontSize: 22,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    content:
                                                        SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          SizedBox(
                                                            height: 20,
                                                          ),
                                                          Text(
                                                            '개발 총괄 및 관리',
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
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
                                                            'UI / UX 디자인',
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
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
                                                    ),
                                                    actions: <Widget>[
                                                      TextButton(
                                                        child: Text("닫기"),
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                      ),
                                                    ],
                                                  );
                                                });
                                          },
                                          icon: const Icon(
                                            Icons.forward_rounded,
                                            size: 30,
                                          ))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
