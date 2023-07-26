import 'package:books_app/Features/home/data/models/books_model/books_model.dart';
import 'package:books_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:books_app/Features/home/presentation/views/widgets/book_rating.dart';

class DetailsBooksName extends StatelessWidget {
  const DetailsBooksName({super.key, required this.booksModel});

  final BooksModel booksModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          booksModel.volumeInfo.title!,
          style: Styles.textStyle20,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 3,
        ),
        Opacity(
          opacity: 0.5,
          child: Text(
            booksModel.volumeInfo.authors?[0] ?? '',
            style: Styles.textStyle16,
          ),
        ),
        const SizedBox(
          height: 3,
        ),
        BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          rating: booksModel.volumeInfo.averageRating ?? 0,
          count: booksModel.volumeInfo.ratingsCount ?? 0,
        ),
      ],
    );
  }
}
