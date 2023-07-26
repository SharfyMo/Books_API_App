part of 'newsbooks_cubit.dart';

abstract class NewsbooksState extends Equatable {
  const NewsbooksState();

  @override
  List<Object> get props => [];
}

class NewsbooksInitial extends NewsbooksState {}

class NewsbooksLoading extends NewsbooksState {}

class NewsbooksFailure extends NewsbooksState {
  final String erroMassege;

  const NewsbooksFailure(this.erroMassege);
}

class NewsbooksSuccess extends NewsbooksState {
  final List<BooksModel> books;

  const NewsbooksSuccess(this.books);
}
