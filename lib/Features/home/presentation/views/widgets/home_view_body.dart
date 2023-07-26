import 'package:books_app/Features/home/presentation/views/widgets/app_bar_home.dart';
import 'package:books_app/Features/home/presentation/views/widgets/listview_image_book.dart';
import 'package:books_app/Features/home/presentation/views/widgets/text_seller_home.dart';
import 'package:books_app/Features/home/presentation/views/widgets/book_details_ListView.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: AppBarHome(),
              ),
              ListVeiwBookHome(),
              SizedBox(
                height: 20,
              ),
              TextSeller(),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        SliverFillRemaining(child: BookDetailsListView())
      ],
    );
  }
}
