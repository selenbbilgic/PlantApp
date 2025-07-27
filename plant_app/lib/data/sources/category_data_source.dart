import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/category.dart';

class CategoryRemoteDataSource {
  final http.Client client;
  CategoryRemoteDataSource(this.client);

  Future<List<Category>> fetchCategories() async {
    final res = await client.get(
      Uri.parse('https://dummy-api-jtg6bessta-ey.a.run.app/getCategories'),
      headers: {'Accept': 'application/json'},
    );
    if (res.statusCode != 200) {
      throw Exception('Error fetching categories: ${res.statusCode}');
    }
    final body = jsonDecode(res.body) as Map<String, dynamic>;
    final data = body['data'] as List<dynamic>;
    return data
        .map((e) => Category.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
