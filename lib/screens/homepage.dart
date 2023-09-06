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
  void initState() {
    super.initState();
    getAllBooks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.sort_by_alpha),
          ),
        ],
      ),
      body: Row(
        children: [
          // Image.network(
          //   'src',
          //   width: 120,
          //   height: 120,
          //   fit: BoxFit.cover,
          // ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  const Text(
                    'Title',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    'Author',
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Rs. 299',
                    style: TextStyle(color: Colors.green.shade600),
                  ),
                ],
              ),
              Text(
                '⭐4.0',
                style: TextStyle(color: Colors.amber.shade600),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
