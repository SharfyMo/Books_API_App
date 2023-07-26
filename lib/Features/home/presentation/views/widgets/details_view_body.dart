import 'package:books_app/Features/home/data/models/books_model/books_model.dart';
import 'package:books_app/Features/home/presentation/views/widgets/book_action.dart';
import 'package:books_app/Features/home/presentation/views/widgets/book_image.dart';
import 'package:books_app/Features/home/presentation/views/widgets/details_view_app_bar.dart';
import 'package:books_app/Features/home/presentation/views/widgets/details_view_items.dart';
import 'package:books_app/core/utils/styles.dart';
import 'package:books_app/Features/home/presentation/views/widgets/details_book_name.dart';
import 'package:flutter/material.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key, required this.booksModel});

  final BooksModel booksModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DetailsViewAppBar(),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height * .4,
                      child: Center(
                          child: CustomBookImage(
                              imageUrl:
                                  booksModel.volumeInfo.imageLinks.thumbnail))),
                  const SizedBox(
                    height: 10,
                  ),
                  DetailsBooksName(
                    booksModel: booksModel,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BooksAction(
                    booksModel: booksModel,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "you can also like",
                      style: Styles.textStyle18,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const DetailsViewItems(),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
