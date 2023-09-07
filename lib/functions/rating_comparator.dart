import 'package:biblio_vault/model/book.dart';

int ratingComparator(Book book1, Book book2) {
  if (book1.bookRating.compareTo(book2.bookRating) == 0) {
    return book1.bookName.compareTo(book2.bookName);
  } else {
    return book1.bookRating.compareTo(book2.bookRating);
  }
}
