import 'package:books_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    required this.rating,
    required this.count,
  });

  final MainAxisAlignment mainAxisAlignment;
  final num rating;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          Icons.star,
          size: 14,
          color: Color(0xffFFDD4F),
        ),
        const SizedBox(width: 3),
        Text(
          rating.toString(),
          //  "4.8",
          style: Styles.textStyle16,
        ),
        const SizedBox(width: 5),
        Opacity(
          opacity: .5,
          child: Text(
            '($count)',
            // "(2345)",
            style: Styles.textStyle14
                .copyWith(fontWeight: FontWeight.w600, color: Colors.red),
          ),
        ),
      ],
    );
  }
}
