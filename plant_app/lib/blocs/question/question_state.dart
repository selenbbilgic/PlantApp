import 'package:plant_app/data/models/question.dart';

abstract class QuestionState {
  const QuestionState();
}

class QuestionInitial extends QuestionState {
  const QuestionInitial();
}

class QuestionLoadInProgress extends QuestionState {
  const QuestionLoadInProgress();
}

class QuestionLoadSuccess extends QuestionState {
  final List<Question> questions;
  const QuestionLoadSuccess(this.questions);
}

class QuestionLoadFailure extends QuestionState {
  final String message;
  const QuestionLoadFailure(this.message);
}
