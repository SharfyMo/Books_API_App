import 'package:books_app/Features/home/data/models/books_model/books_model.dart';
import 'package:books_app/Features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'newsbooks_state.dart';

class NewsbooksCubit extends Cubit<NewsbooksState> {
  NewsbooksCubit(this.homeRepo) : super(NewsbooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchNewsbooks() async {
    emit(NewsbooksLoading());
    var result = await homeRepo.fetchNewsetBooks();
    result.fold((failure) {
      emit(NewsbooksFailure(failure.errMessage));
    }, (books) {
      emit(NewsbooksSuccess(books));
    });
  }
}
