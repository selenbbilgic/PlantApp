class Category {
  final int id;
  final String name;
  final String title;
  final int rank;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime publishedAt;
  final CategoryImage image;

  Category({
    required this.id,
    required this.name,
    required this.title,
    required this.rank,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
    required this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] as int,
      name: json['name'] as String,
      title: json['title'] as String,
      rank: json['rank'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      publishedAt: DateTime.parse(json['publishedAt'] as String),
      image: CategoryImage.fromJson(json['image'] as Map<String, dynamic>),
    );
  }
}

class CategoryImage {
  final int id;
  final String url;
  final int width;
  final int height;
  // …other fields you care about

  CategoryImage({
    required this.id,
    required this.url,
    required this.width,
    required this.height,
  });

  factory CategoryImage.fromJson(Map<String, dynamic> json) {
    return CategoryImage(
      id: json['id'] as int,
      url: json['url'] as String,
      width: json['width'] as int,
      height: json['height'] as int,
    );
  }
}
