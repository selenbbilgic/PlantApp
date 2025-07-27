import '../../data/models/category.dart';

abstract class CategoryState {
  const CategoryState();
}

class CategoryInitial extends CategoryState {
  const CategoryInitial();
}

class CategoryLoadInProgress extends CategoryState {
  const CategoryLoadInProgress();
}

class CategoryLoadSuccess extends CategoryState {
  final List<Category> categories;
  const CategoryLoadSuccess(this.categories);
}

class CategoryLoadFailure extends CategoryState {
  final String message;
  const CategoryLoadFailure(this.message);
}
