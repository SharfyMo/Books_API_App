import 'package:books_app/Features/home/data/repos/home_repo_impl.dart';

import 'package:books_app/Features/home/presentation/manager/feature_books_cubit/feature_books_cubit.dart';
import 'package:books_app/Features/home/presentation/manager/news_books_cubit/newsbooks_cubit.dart';
import 'package:books_app/constants.dart';
import 'package:books_app/core/utils/api_service.dart';
import 'package:books_app/core/utils/app_router.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  // setupServiceLocator();
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          //   create: (context) => FeatureBooksCubit(getIt.get<HomeRepoImpl>()),
          create: (context) =>
              FeatureBooksCubit(HomeRepoImpl(ApiService(Dio())))
                ..fetchFeatureBooks(),
        ),
        BlocProvider(
          create: (context) =>
              NewsbooksCubit(HomeRepoImpl(ApiService(Dio())))..fetchNewsbooks(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: kPrimaryColor,
            //   textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
            textTheme: ThemeData.dark().textTheme),
      ),
    );
  }
}
