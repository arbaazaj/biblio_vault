import 'package:biblio_vault/model/book.dart';
import 'package:biblio_vault/routes/routes.dart';
import 'package:biblio_vault/widgets/book_card.dart';
import 'package:flutter/material.dart';

FutureBuilder<BookList> buildBookList(Future<BookList> getAllBooks) {
  return FutureBuilder<BookList>(
    future: getAllBooks,
    builder: (context, snapshot) {
      if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      }
      if (snapshot.hasData) {
        return ListView.builder(
            itemCount: snapshot.data!.books.length,
            itemBuilder: (context, index) {
              final book = snapshot.data!.books[index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(bookDetailsRoute(book));
                },
                child: BookCard(book: book),
              );
            });
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    },
  );
}
