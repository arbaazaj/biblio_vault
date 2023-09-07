import 'dart:convert';

import 'package:biblio_vault/model/book.dart';
import 'package:biblio_vault/screens/methods/build_all_book_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late BookList bookList;

  Future<BookList> getAllBooks() async {
    final Uri uri = Uri.parse('http://13.235.250.119/v1/book/fetch_books/');
    final response = await http.get(uri, headers: {
      "Content-Type": "application/json",
      "token": dotenv.env['TOKEN'].toString()
    });

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      bookList = BookList.fromJson(data['data']);
    } else {
      throw Exception('Error: ${response.statusCode}');
    }
    return bookList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orange,
        leading:
            const Icon(CupertinoIcons.line_horizontal_3, color: Colors.white),
        title: const Text(
          'Dashboard',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              sortBooksByAlphabeticalOrder();
            },
            icon: const Icon(Icons.sort_by_alpha, color: Colors.white),
          ),
        ],
      ),
      body: buildBookList(getAllBooks()),
    );
  }

  void sortBooksByAlphabeticalOrder() {
    bookList.books.sort((book1, book2) {
      return book1.bookRating.compareTo(book2.bookRating);
    });
  }
}
