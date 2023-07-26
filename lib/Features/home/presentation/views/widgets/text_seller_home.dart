import 'package:books_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class TextSeller extends StatelessWidget {
  const TextSeller({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          "Best Seller",
          style: Styles.textStyle16,
        ),
      ),
    );
  }
}
