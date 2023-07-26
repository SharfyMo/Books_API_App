part of 'feature_books_cubit.dart';

abstract class FeatureBooksState extends Equatable {
  const FeatureBooksState();

  @override
  List<Object> get props => [];
}

class FeatureBooksInitial extends FeatureBooksState {}

class FeatureBooksLoading extends FeatureBooksState {}

class FeatureBooksFailure extends FeatureBooksState {
  final String erroMassege;

  const FeatureBooksFailure(this.erroMassege);
}

class FeatureBookSuccess extends FeatureBooksState {
  final List<BooksModel> books;

  const FeatureBookSuccess(this.books);
}
