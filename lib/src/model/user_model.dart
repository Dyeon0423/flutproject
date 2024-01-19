class UserModel {
  int? id;
  String? name;
  String? email;

  //
  // {
  //   id = 1,
  //   name = "홍길동",
  //   email = "hong@tukorea.com"
  // }
  // 이런식으로 될것이다.
  
  UserModel.fromJson(Map m) {
    id = m['id'];
    email = m['name'];
    name = m['email'];
  }
}