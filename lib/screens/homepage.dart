import 'dart:convert';

import 'package:biblio_vault/model/book.dart';
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
        leading: const Icon(Icons.menu, color: Colors.white),
        title: const Text(
          'Dashboard',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.sort_by_alpha, color: Colors.white),
          ),
        ],
      ),
      body: FutureBuilder<BookList>(
        future: getAllBooks(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.books.length,
                itemBuilder: (context, index) {
                  final book = snapshot.data!.books[index];

                  return Card(
                    margin: const EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        Image.network(
                          book.bookImage,
                          width: 110,
                          height: 110,
                          fit: BoxFit.cover,
                        ),
                        Flexible(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 16.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        book.bookName,
                                        style: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        book.bookAuthor,
                                        softWrap: true,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Colors.grey.shade500,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        book.bookPrice,
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green.shade600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 16.0),
                                  child: Text(
                                    '⭐ 4.0',
                                    style:
                                        TextStyle(color: Colors.amber.shade700),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
