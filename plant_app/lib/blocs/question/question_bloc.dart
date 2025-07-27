import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_app/blocs/question/question_event.dart';
import 'package:plant_app/blocs/question/question_state.dart';
import 'package:plant_app/data/repositories/question_repository.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  final QuestionRepository repository;

  QuestionBloc(this.repository) : super(const QuestionInitial()) {
    on<QuestionRequested>((event, emit) async {
      emit(const QuestionLoadInProgress());
      try {
        final questions = await repository.getQuestions();
        emit(QuestionLoadSuccess(questions));
      } catch (e) {
        emit(QuestionLoadFailure(e.toString()));
      }
    });
  }
}
