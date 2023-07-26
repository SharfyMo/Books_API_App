import 'package:books_app/Features/home/data/models/books_model/books_model.dart';
import 'package:books_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BooksModel>>> fetchNewsetBooks();
  Future<Either<Failure, List<BooksModel>>> fetchFeatureBooks();
  Future<Either<Failure, List<BooksModel>>> fetchSimilarBooks(
      {required String category});
}
