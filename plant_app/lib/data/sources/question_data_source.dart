import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:plant_app/data/models/question.dart';

class QuestionRemoteDataSource {
  // This class is responsible for fetching question data from a remote source.
  // It can be implemented using HTTP requests, GraphQL, or any other remote data fetching method.
  final http.Client client;
  QuestionRemoteDataSource(this.client);

  Future<List<Question>> fetchQuestions() async {
    final res = await client.get(
      Uri.parse("https://dummy-api-jtg6bessta-ey.a.run.app/getQuestions"),
      headers: {'Accept': 'application/json'},
    );

    if (res.statusCode != 200) {
      throw Exception('Error fetching questions: ${res.statusCode}');
    }
    // The response is a JSON array, so decode to List<dynamic>
    final jsonList = jsonDecode(res.body) as List<dynamic>;

    // Map each element (a Map<String, dynamic>) to a Question
    return jsonList
        .map((e) => Question.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
