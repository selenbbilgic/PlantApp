class Question {
  final int id;
  final String title;
  final String subtitle;
  final String imageUrl;
  final String url;
  final int order;

  const Question({
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

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'subtitle': subtitle,
    'image_uri': imageUrl,
    'uri': url,
    'order': order,
  };

  /// optional, if you want value‑equality
  @override
  bool operator ==(Object o) =>
      identical(this, o) ||
      o is Question &&
          o.id == id &&
          o.title == title &&
          o.subtitle == subtitle &&
          o.imageUrl == imageUrl &&
          o.url == url &&
          o.order == order;

  @override
  int get hashCode => Object.hash(id, title, subtitle, imageUrl, url, order);
}
