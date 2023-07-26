import 'package:books_app/Features/home/data/models/books_model/books_model.dart';
import 'package:books_app/core/utils/function/launch_url.dart';
import 'package:books_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.booksModel});

  final BooksModel booksModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          const Expanded(
              child: CustomButton(
            text: 'Free',
            backgroundColor: Colors.white,
            textColor: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
          )),
          Expanded(
              child: CustomButton(
            onpressed: () {
              launchCustomUr(context, booksModel.volumeInfo.previewLink!);
            },
            //  fontSize: 16,
            text: getText(booksModel),
            backgroundColor: const Color(0xffEF8262),
            textColor: Colors.white,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          )),
        ],
      ),
    );
  }
}

String getText(BooksModel booksModel) {
  if (booksModel.volumeInfo.previewLink == null) {
    return 'Not Avaliable';
  } else {
    return 'Preview';
  }
}
