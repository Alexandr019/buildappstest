import 'package:flutter/material.dart';

import '../common.dart';

class RetryButton extends StatelessWidget {
  const RetryButton({super.key, required this.onPressed, this.title = 'Retry'});

  final VoidCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: darkBgColor,
        foregroundColor: whiteColor,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
      child: Text(title, style: h2w500.copyWith(color: whiteColor, height: 1.0)),
    );
  }
}


