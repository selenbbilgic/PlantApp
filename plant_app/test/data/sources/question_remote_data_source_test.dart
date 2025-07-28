// test/data/sources/question_remote_data_source_test.dart

import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;
import 'package:plant_app/data/sources/question_data_source.dart';
import 'package:plant_app/data/models/question.dart';

class MockClient extends Mock implements http.Client {}

class _FakeUri extends Fake implements Uri {}

void main() {
  setUpAll(() {
    registerFallbackValue(_FakeUri());
  });

  late MockClient client;
  late QuestionRemoteDataSource ds;

  setUp(() {
    client = MockClient();
    ds = QuestionRemoteDataSource(client);
  });

  group('fetchQuestions', () {
    test('parses raw array JSON into Questions', () async {
      final rawArray = [
        {
          'id': 1,
          'title': 'How to identify plants?',
          'subtitle': 'Life Style',
          'image_uri': 'https://example.com/card.png',
          'uri': 'https://plantapp.app/blog/identify',
          'order': 1,
        },
      ];

      when(
        () => client.get(any(), headers: any(named: 'headers')),
      ).thenAnswer((_) async => http.Response(jsonEncode(rawArray), 200));

      final result = await ds.fetchQuestions();
      expect(result, isA<List<Question>>());
      expect(result.first.title, 'How to identify plants?');
    });

    test('throws on non-200 status', () {
      when(
        () => client.get(any(), headers: any(named: 'headers')),
      ).thenAnswer((_) async => http.Response('error', 500));

      expect(() => ds.fetchQuestions(), throwsException);
    });
  });
}
