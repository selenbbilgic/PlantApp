import 'package:plant_app/data/models/question.dart';
import 'package:plant_app/data/sources/question_data_source.dart';

class QuestionRepository {
  final QuestionRemoteDataSource remote;
  QuestionRepository(this.remote);

  Future<List<Question>> getQuestions() => remote.fetchQuestions();
}
