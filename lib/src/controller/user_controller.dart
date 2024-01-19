import 'package:carrot_flutter/src/connect/user_connect.dart';
import 'package:carrot_flutter/src/model/user_model.dart';
import 'package:flutter/material.dart.';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

final GetStorage _storage = GetStorage();
/// 회원 동작과 관련된 모든 상태를 공통으로 관리하는 controller
class UserController extends GetxController {
  /// UserConnect 객체를 생성( *의존성 주입* 인데 어렵다..)
  final userConnection = Get.put(UserConnect());

/// 공통으로 관리할 멤버 변수
  UserModel? user;

  /// 로그인 되어있는지 판단 
  Future<bool> isLogin() async {
    return _storage.hasData('access_token');
  }

  /// 회원가입을 시도하는 함수, 아마 connect를 호출할것이다.
  Future register(String email, String name, String password) async {
    try {
      String token = await userConnection.sendRegister(email, name, password);
    } catch(e) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        content: Text("$e"),
      ));
    }
  }

  /// 로그인을 시도하는 함수, 아마 connect를 호출할것이다.
  Future login(String email, String password) async {
    try {
      String token = await userConnection.sendLogin(email, password);
    } catch(e) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        content: Text("$e"),
        ));
    }
  }

  /// 나의 정보를 가져오는 함수, 아마 connect를 호출할것이다.
  Future mypage() async {
    Map map = await userConnection.getMyInfo();
    UserModel parseUser = UserModel.fromJson(map);
    user = parseUser;
  }
}