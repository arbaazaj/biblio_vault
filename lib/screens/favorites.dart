import 'package:biblio_vault/model/book.dart';
import 'package:biblio_vault/utils/globals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoriteBooks extends StatefulWidget {
  final List<Book> books;

  const FavoriteBooks({
    Key? key,
    required this.books,
  }) : super(key: key);

  @override
  State<FavoriteBooks> createState() => _FavoriteBooksState();
}

class _FavoriteBooksState extends State<FavoriteBooks> {
  List<Book> bookList = [];

  void getAllFavoriteBooks() {
    var pref = sharedPreferences.getKeys();
    List<dynamic> list = pref.toList();

    for (var book in widget.books) {
      if (list.contains(book.bookId)) {
        bookList.add(book);
      }
    }
  }

  @override
  void initState() {
    getAllFavoriteBooks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: const Text(
          'Favorite Books',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
          itemCount: bookList.length,
          itemBuilder: (ctx, index) {
            final book = bookList[index];
            return Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: ListTile(
                leading: Image(
                  image: NetworkImage(book.bookImage),
                  width: 50.0,
                  height: 50.0,
                ),
                title: Text(
                  book.bookName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                subtitle: Text(
                  book.bookAuthor,
                ),
                trailing: IconButton(
                  onPressed: () {
                    bookList.removeAt(index);
                    sharedPreferences.remove(book.bookId);
                    setState(() {});
                  },
                  icon: const Icon(Icons.favorite,
                      color: CupertinoColors.systemOrange),
                ),
              ),
            );
          }),
    );
  }
}
