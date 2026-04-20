import 'package:flutter/material.dart';

import '../../common/common.dart';

class PostDetails extends StatelessWidget {
  const PostDetails({
    super.key,
    required this.postID,
    required this.authorID,
    required this.title,
    required this.body,
  });

  final int postID;
  final int authorID;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: primaryColor, width: 1.5),
        boxShadow: [BoxShadow(color: blackColor.withAlpha(10), blurRadius: 20, offset: const Offset(0, 10))],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                PostsCount(title: 'POST ID: $postID'),
                const SizedBox(width: 8),
                PostsCount(title: 'AUTHOR ID: $authorID'),
              ],
            ),
            const SizedBox(height: 16),
            Text(title, style: h1.copyWith(color: blackColor)),
            const SizedBox(height: 16),
            Text(body, style: h3.copyWith(color: secondaryColor, height: 1.5)),
          ],
        ),
      ),
    );
  }
}
