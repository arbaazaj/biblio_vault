import 'package:biblio_vault/model/book.dart';
import 'package:flutter/material.dart';

class FavoriteBooks extends StatefulWidget {
  final Book? book;

  const FavoriteBooks({Key? key, this.book}) : super(key: key);

  @override
  State<FavoriteBooks> createState() => _FavoriteBooksState();
}

class _FavoriteBooksState extends State<FavoriteBooks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Books'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(widget.book!.bookName),
          ),
        ],
      ),
    );
  }
}
