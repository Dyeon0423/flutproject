import 'package:carrot_flutter/src/widget/feed_list_item.dart';
import 'package:flutter/material.dart.';

class FeedIndex extends StatelessWidget {
  const FeedIndex({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: const [
        FeedListItem(),
        FeedListItem(),
        FeedListItem(),
        FeedListItem(),
        FeedListItem(),
        FeedListItem(),
        FeedListItem(),
        FeedListItem(),
        FeedListItem(),
        FeedListItem(),
      ],
    );
  }
}