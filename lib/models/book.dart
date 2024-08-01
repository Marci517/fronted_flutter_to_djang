class Book {
  int id;
  String title;
  String description;
  String category;
  int author;

  Book(
      {required this.id,
      required this.title,
      required this.description,
      required this.category,
      required this.author});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        category: json['category'],
        author: json['author']);
  }
}
