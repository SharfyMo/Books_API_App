import 'package:books_app/Features/home/data/models/books_model/books_model.dart';
import 'package:books_app/Features/home/presentation/views/widgets/book_image.dart';
import 'package:books_app/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:books_app/core/utils/app_router.dart';
import 'package:books_app/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookItemDetailsListView extends StatelessWidget {
  const BookItemDetailsListView({super.key, required this.booksModel});

  final BooksModel booksModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context)
            .push(AppRouter.kBookDetailsView, extra: booksModel);
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 10),
        height: 125,
        child: Row(
          children: [
            CustomBookImage(
              imageUrl: booksModel.volumeInfo.imageLinks.thumbnail,
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .5,
                  child: Text(
                    booksModel.volumeInfo.title!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Styles.textStyle20,
                  ),
                ),
                const SizedBox(height: 3),
                Opacity(
                  opacity: .5,
                  child: Text(
                    booksModel.volumeInfo.authors![0],
                    style: Styles.textStyle14,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Row(
                  children: [
                    const Text(
                      "Free",
                      style: Styles.textStyle20,
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    BookRating(
                      rating: booksModel.volumeInfo.averageRating?.round() ?? 0,
                      count: booksModel.volumeInfo.ratingsCount ?? 0,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
