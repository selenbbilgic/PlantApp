class Question {
  int id;
  String title;
  String subtitle;
  String imageUrl;
  String url;
  int order;

  Question({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.url,
    required this.order,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'] as int,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      imageUrl: json['image_uri'] as String,
      url: json['uri'] as String,
      order: json['order'] as int,
    );
  }
}
