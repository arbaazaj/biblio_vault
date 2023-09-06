class Book {
  final String bookId;
  final String bookName;
  final String bookAuthor;
  final String bookRating;
  final String bookPrice;
  final String bookImage;

  Book({
    required this.bookId,
    required this.bookName,
    required this.bookAuthor,
    required this.bookRating,
    required this.bookPrice,
    required this.bookImage,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      bookId: json['book_id'],
      bookName: json['name'],
      bookAuthor: json['author'],
      bookRating: json['rating'],
      bookPrice: json['price'],
      bookImage: json['image'],
    );
  }
}

class BookList {
  final List<Book> books;

  BookList({required this.books});

  factory BookList.fromJson(List<dynamic> json) {
    List<Book> books = <Book>[];
    books = json.map((i) => Book.fromJson(i)).toList();

    return BookList(books: books);
  }
}
