import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;
import 'package:plant_app/data/sources/category_data_source.dart';
import 'package:plant_app/data/models/category.dart';

class MockClient extends Mock implements http.Client {}

class _FakeUri extends Fake implements Uri {}

void main() {
  setUpAll(() {
    registerFallbackValue(_FakeUri());
  });

  late MockClient client;
  late CategoryRemoteDataSource dataSource;

  setUp(() {
    client = MockClient();
    dataSource = CategoryRemoteDataSource(client);
  });

  group('fetchCategories', () {
    test('returns parsed list on 200', () async {
      final jsonMap = {
        'data': [
          {
            'id': 11,
            'name': 'fern',
            'createdAt': '2023-01-11T10:53:05.801Z',
            'updatedAt': '2023-01-11T10:54:30.059Z',
            'publishedAt': '2023-01-11T10:53:07.416Z',
            'title': 'Ferns',
            'rank': 0,
            'image': {
              'id': 23,
              'name': '6.png',
              'alternativeText': null,
              'caption': null,
              'width': 116,
              'height': 126,
              'formats': null,
              'hash': '6_edbcc6988a',
              'ext': '.png',
              'mime': 'image/png',
              'size': 8.24,
              'url':
                  'https://cms-cdn.plantapp.app/6_edbcc6988a/6_edbcc6988a.png',
              'previewUrl': null,
              'provider':
                  '@strapi-community/strapi-provider-upload-google-cloud-storage',
              'provider_metadata': null,
              'createdAt': '2023-01-11T10:44:46.151Z',
              'updatedAt': '2023-01-11T10:44:46.151Z',
            },
          },
        ],
      };

      when(
        () => client.get(
          Uri.parse('https://dummy-api-jtg6bessta-ey.a.run.app/getCategories'),
          headers: {'Accept': 'application/json'},
        ),
      ).thenAnswer((_) async => http.Response(jsonEncode(jsonMap), 200));

      final categories = await dataSource.fetchCategories();

      expect(categories, isA<List<Category>>());
      expect(categories.length, 1);
      expect(categories.first.title, 'Ferns');
      expect(categories.first.image.url, contains('cms-cdn'));
    });

    test('throws on non‑200', () {
      when(
        () => client.get(any(), headers: any(named: 'headers')),
      ).thenAnswer((_) async => http.Response('nope', 404));

      expect(() => dataSource.fetchCategories(), throwsA(isA<Exception>()));
    });
  });
}
