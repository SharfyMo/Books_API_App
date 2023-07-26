import 'package:bloc/bloc.dart';
import 'package:books_app/Features/home/data/models/books_model/books_model.dart';
import 'package:books_app/Features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'smila_books_state.dart';

class SmilaBooksCubit extends Cubit<SmilaBooksState> {
  SmilaBooksCubit(this.homeRepo) : super(SmilaBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchSmilaBooks({required String category}) async {
    emit(SimilarBooksLoading());
    var result = await homeRepo.fetchSimilarBooks(category: category);
    result.fold((failure) {
      emit(SimilarBooksFailure(failure.errMessage));
    }, (books) {
      emit(SimilarBooksSuccess(books));
    });
  }
}
