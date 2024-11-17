class Category {
  final String tag;
  final String name;

  Category({required this.tag, required this.name});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      tag: json['tag'],
      name: json['name'],
    );
  }
}
