import 'package:books_app/Features/home/presentation/manager/feature_books_cubit/feature_books_cubit.dart';
import 'package:books_app/Features/home/presentation/views/widgets/book_image.dart';
import 'package:books_app/core/utils/app_router.dart';
import 'package:books_app/core/widgets/custom_error_widget.dart';
import 'package:books_app/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ListVeiwBookHome extends StatelessWidget {
  const ListVeiwBookHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeatureBooksCubit, FeatureBooksState>(
      builder: (context, state) {
        if (state is FeatureBookSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: state.books.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: GestureDetector(
                        onTap: () {
                          GoRouter.of(context).push(AppRouter.kBookDetailsView,
                              extra: state.books[index]);
                        },
                        child: CustomBookImage(
                            imageUrl: state
                                .books[index].volumeInfo.imageLinks.thumbnail),
                      ));
                }),
          );
        } else if (state is FeatureBooksFailure) {
          return CustomErrorWidget(
            errMessage: state.erroMassege,
          );
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
