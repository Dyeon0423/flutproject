import 'package:carrot_flutter/src/controller/user_controller.dart';
import 'package:flutter/material.dart.';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'src/app.dart';

void main() async{
  // GetStorage 패키지를 사용하기 위한 초기화
  await GetStorage.init();

  // 로그인 여부(토큰이 있는지 체크)
  final userController = Get.put(UserController());
  bool isLogin = await userController.isLogin();
  // print(isLogin);
  runApp(Myapp(isLogin));
}