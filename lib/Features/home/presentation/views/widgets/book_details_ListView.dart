import 'package:books_app/Features/home/presentation/manager/news_books_cubit/newsbooks_cubit.dart';
import 'package:books_app/Features/home/presentation/views/widgets/book_item_details_listview.dart';
import 'package:books_app/core/widgets/custom_error_widget.dart';
import 'package:books_app/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsListView extends StatelessWidget {
  const BookDetailsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsbooksCubit, NewsbooksState>(
      builder: (context, state) {
        if (state is NewsbooksSuccess) {
          return ListView.builder(
              itemCount: state.books.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: BookItemDetailsListView(
                    booksModel: state.books[index],
                  ),
                );
              });
        } else if (state is NewsbooksFailure) {
          return CustomErrorWidget(errMessage: state.erroMassege);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
