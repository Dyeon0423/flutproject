import 'package:carrot_flutter/src/screen/home.dart';
import 'package:carrot_flutter/src/screen/feed/create.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screen/auth/intro.dart';

class Myapp extends StatelessWidget {
  final bool isLogin; //앱이 시작될때 로그인 여부를 판단

  // 생성자의 첫번째 파라미터로 로그인여부 boolean을 가져와서 isLogin변수에 저장!
  const Myapp(this.isLogin, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      home: isLogin ? const Home() : const Intro(),
    );
  }
}