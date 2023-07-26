import 'package:books_app/Features/home/data/models/books_model/books_model.dart';
import 'package:books_app/Features/home/presentation/manager/smila_books_cubit/smila_books_cubit.dart';
import 'package:books_app/Features/home/presentation/views/widgets/details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsView extends StatefulWidget {
  const DetailsView({super.key, required this.booksModel});

  final BooksModel booksModel;

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  void initState() {
    BlocProvider.of<SmilaBooksCubit>(context)
        .fetchSmilaBooks(category: widget.booksModel.volumeInfo.categories![0]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DetailsViewBody(
        booksModel: widget.booksModel,
      ),
    );
  }
}
