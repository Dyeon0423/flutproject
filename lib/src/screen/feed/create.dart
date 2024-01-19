import 'package:carrot_flutter/src/widget/image_button.dart';
import 'package:flutter/material.dart.';

class FeedCreate extends StatefulWidget {
  const FeedCreate({super.key});

  @override
  State<FeedCreate> createState() => _FeedCreateState();
}

class _FeedCreateState extends State<FeedCreate> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _contentcontroller = TextEditingController();

  var labelTextStyle = TextStyle(fontSize: 12);
  var inputDecoration = InputDecoration();
  //회원가입 누를때 나오는 함수
  _submit() {
    //현재 폼에서 별다른 오류가 없을 때
    if(_formKey.currentState!.validate()) {
      final String title = _titleController.text; //제목 값
      final String price = _priceController.text; //가격값
      final String content = _contentcontroller.text; //내용 값
      //회원가입 로직 추가
      //회원가입 성공 시, 다음 화면(메인)으로 이동 혹은 처리
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('내 물건 팔기'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            //이미지 버튼
            Row(
              children: [
                ImageButton(imageUrl: null),
              ],
            ),
            //제목
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('제목', style: labelTextStyle),
                TextFormField(
                controller: _titleController,
                decoration: inputDecoration,
            ),
              ],
            ),
            //가격
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('가격', style: labelTextStyle),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: inputDecoration,
                  controller: _priceController,
                ),
              ],
            ),
            //내용
            Column(),
            //작성버튼
            ElevatedButton(
              onPressed: _submit, 
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffFF7E36),
              ),
              child: const Text(
                '작성 완료',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}