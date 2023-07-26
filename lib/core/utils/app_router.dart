import 'package:books_app/Features/Splash/presentation/views/splash_view.dart';
import 'package:books_app/Features/home/data/models/books_model/books_model.dart';
import 'package:books_app/Features/home/data/repos/home_repo_impl.dart';
import 'package:books_app/Features/home/presentation/manager/smila_books_cubit/smila_books_cubit.dart';
import 'package:books_app/Features/home/presentation/views/details_view.dart';
import 'package:books_app/Features/home/presentation/views/home_view.dart';
import 'package:books_app/Features/search/presentation/views/search_view.dart';
import 'package:books_app/core/utils/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:dio/dio.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => SmilaBooksCubit(HomeRepoImpl(ApiService(Dio()))),
          child: DetailsView(
            booksModel: state.extra as BooksModel,
          ),
        ),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
