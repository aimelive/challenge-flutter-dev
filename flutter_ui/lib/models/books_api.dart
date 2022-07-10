class Book {
  String bookId;
  String title;
  String category;
  String preview;
  String description;
  String author;
  String imgUrl;
  String audioUrl;
  List pages;
  String price;
  String publishAt;
  String updatedAt;

  Book(
      {required this.bookId,
      required this.audioUrl,
      required this.author,
      required this.category,
      required this.description,
      required this.imgUrl,
      required this.pages,
      required this.preview,
      required this.price,
      required this.publishAt,
      required this.title,
      required this.updatedAt});
  static Book fromJsonBook(Map<String, dynamic> json) {
    return Book(
      bookId: json['_id'],
      audioUrl: json['audioUrl'],
      author: json['authorId'],
      category: json['category'],
      description: json['description'],
      imgUrl: json['imgUrl'],
      pages: json['pages'],
      preview: json['previewText'],
      price: json['price'],
      publishAt: json['publishedAt'],
      title: json['title'],
      updatedAt: json['updatedAt'],
    );
  }
}
