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
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

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
      key: _scaffoldState,
      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: CupertinoColors.systemOrange),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: Text('Dashboard'),
            ),
            ListTile(
              title: Text('Favorites'),
            ),
            ListTile(
              title: Text('Settings'),
            ),
            ListTile(
              title: Text('About Us'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            _scaffoldState.currentState!.openDrawer();
          },
          icon: const Icon(CupertinoIcons.line_horizontal_3),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        backgroundColor: Colors.orange,
        title: const Text(
          'Dashboard',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              sortBooksByAlphabeticalOrder();
            },
            icon: const Icon(Icons.sort_by_alpha),
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
