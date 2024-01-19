import 'package:carrot_flutter/src/controller/user_controller.dart';
import 'package:flutter/material.dart.';
import 'package:get/get.dart';

import '../home.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final userController = Get.put(UserController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _namecontroller = TextEditingController();
  
  //회원가입 누를때 나오는 함수
  _submit() async{
    //현재 폼에서 별다른 오류가 없을 때
    if(_formKey.currentState!.validate()) {
      final String email = _emailController.text; //이메일 값
      final String password = _passwordController.text; //비밀번호값
      final String name = _namecontroller.text; //이름 값
      //회원가입 로직 추가
      bool result = await userController.register(email, name, password);

      //회원가입 성공 시, 다음 화면(메인)으로 이동 혹은 처리
      if(result){}
      Get.offAll(() => const Home());
      }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('회원 가입')),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
             const Text(
              '홍당무 마켓은 이메일로 가입해요. \n비밀번호는 안전하게 보관되며 \n어디에도 공개하지 않아요',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),
            //이메일 입력부분
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: '이메일',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '이메일을 입력하세요.';
                }
                if(value.length < 5){
                  return '이메일이 그렇게 짧을리가 있나요?';
                }
                return null;
              },
            ),

            const SizedBox(height: 10),
            //비밀번호 입력부분
            TextFormField(
              obscureText: true,
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: '비밀번호',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '비밀번호를 입력하세요.';
                }
                return null;
              },
            ),

            const SizedBox(height: 10),
            //이름 입력부분
            TextFormField(
              controller: _namecontroller,
              decoration: const InputDecoration(
                labelText: '이름',
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '이름을 입력하세요.';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: _submit, 
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffFF7E36),
              ),
              child: const Text(
                '회원 가입',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ))
    );
  }
}