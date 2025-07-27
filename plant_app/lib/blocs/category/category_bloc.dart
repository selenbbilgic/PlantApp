import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/category_repository.dart';
import 'category_event.dart';
import 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository repository;

  CategoryBloc(this.repository) : super(const CategoryInitial()) {
    on<CategoryRequested>((event, emit) async {
      emit(const CategoryLoadInProgress());
      try {
        final cats = await repository.getCategories();
        emit(CategoryLoadSuccess(cats));
      } catch (e) {
        emit(CategoryLoadFailure(e.toString()));
      }
    });
  }
}
