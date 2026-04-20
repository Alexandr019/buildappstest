import 'package:flutter/material.dart';

import '../../../common/common.dart';

class PostsItem extends StatelessWidget {
  const PostsItem({super.key, required this.title, required this.body, this.onTap});

  final String title;
  final String body;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GestureDetector(
        onTap: onTap,
        child: DecoratedBox(
          decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.circular(24)),
          child: Padding(
            padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16, right: 8),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: h2w600.copyWith(color: blackColor),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),

                      const SizedBox(height: 4),
                      Text(
                        body,
                        style: h2w500.copyWith(color: secondaryVariantColor),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                const Icon(Icons.chevron_right_rounded, color: secondaryColor, size: 36),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
