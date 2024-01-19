import 'package:flutter/material.dart';

class FeedListItem extends StatelessWidget {
  const FeedListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //썸네일
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network('https://picsum.photos/100/100?ramdom=1',
            width: 100, height: 100),
        ),
        //내용
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(12.0),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('전공책 팝니다.', style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 6),
                Text('E동 1층 식당앞'),
                SizedBox(height: 6),
                Text(
                  '10,000원',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
          ),
          //메뉴 및 댓글
          Container(
            padding: const EdgeInsets.only(bottom: 10),
            height: 100,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: null, icon: Icon(Icons.more_vert)),
                Row(
                  children: [
                    Icon(Icons.favorite_border, size: 16),
                    SizedBox(width: 4),
                    Text('3'),
                    SizedBox(width: 6),
                    Icon(Icons.comment_outlined, size: 16),
                    SizedBox(width: 4),
                    Text('6'),
                  ],
                )
              ],
            ),
          )
      ]
    );
  }
}