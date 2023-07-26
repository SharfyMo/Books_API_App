part of 'smila_books_cubit.dart';

abstract class SmilaBooksState extends Equatable {
  const SmilaBooksState();

  @override
  List<Object> get props => [];
}

class SmilaBooksInitial extends SmilaBooksState {}

class SimilarBooksFailure extends SmilaBooksState {
  final String errMessage;

  const SimilarBooksFailure(this.errMessage);
}

class SimilarBooksSuccess extends SmilaBooksState {
  final List<BooksModel> books;

  const SimilarBooksSuccess(this.books);
}

class SimilarBooksLoading extends SmilaBooksState {}
