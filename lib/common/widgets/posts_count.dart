import 'package:flutter/material.dart';

import '../../../common/common.dart';

class PostsCount extends StatelessWidget {
  const PostsCount({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: DecoratedBox(
        decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          child: Text(
            title,
            style: h4.copyWith(color: secondaryVariantColor, fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}
