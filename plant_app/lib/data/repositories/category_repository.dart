import 'package:plant_app/data/sources/category_data_source.dart';

import '../models/category.dart';

class CategoryRepository {
  final CategoryRemoteDataSource remote;
  CategoryRepository(this.remote);

  Future<List<Category>> getCategories() => remote.fetchCategories();
}
